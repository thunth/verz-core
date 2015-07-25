<?php

class SiteController extends FrontController
{

    public $attempts = MAX_TIME_TO_SHOW_CAPTCHA;
    public $counter;
    /**
	 * Declares class-based actions.
	 */
	public function actions()
	{
		return array(
			// captcha action renders the CAPTCHA image displayed on the contact page
			'captcha'=>array(
				'class'=>'CCaptchaAction',
				'backColor'=>0xFFFFFF,
			),
			// page action renders "static" pages stored under 'protected/views/site/pages'
			// They can be accessed via: index.php?r=site/page&view=FileName
			'page'=>array(
				'class'=>'CViewAction',
			),
		);
	}

        
    public function accessRules()
    {
        return array(
            array('allow',
             'actions' => array('captcha'),
             'users' => array('*'),
             ),
        );
    }

    /**
     * This is the action to handle external exceptions.
     */
    public function actionError()
    {
        if($error=Yii::app()->errorHandler->error)
        {
            if(Yii::app()->request->isAjaxRequest)
                echo $error['message'];
            else
                $this->render('error', $error);
        }
    }

    protected function performAjaxValidation($model)
    {
        try
        {
            if(isset($_POST['ajax']))
            {
                echo CActiveForm::validate($model);
                Yii::app()->end();
            }
        }
        catch (Exception $e)
        {
            Yii::log("Exception ".  print_r($e, true), 'error');
            throw  new CHttpException("Exception ".  print_r($e, true));
        }
    }
    

	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */
    public function actionIndex(){        
        $this->render('index',array(
	    ));
    }

    public function actionRegister()	{
        try
        {
            $model = new Users('createMemberFE');
            // Uncomment the following line if AJAX validation is needed
            $this->performAjaxValidation($model);
            if (isset($_POST['Users'])) {
                $model->attributes = $_POST['Users'];
                // if ok validate then send sms or email
                if ($model->validate()) {
                    $model->status = STATUS_ACTIVE;
                    $model->role_id = ROLE_MEMBER;
                    $model->application_id = FE;
                    $model->password_hash = md5($model->temp_password);
                    $model->verify_code = Users::model()->checkVerifyCode(rand(100000, 1000000)); // Gen verify code and send qua mail or sms
                    if($model->save()){
                        //recieve Newsletter
                        if(isset($_POST['Users']['recieveNewsletter'])){
                            Subscriber::addSubscriber($model->full_name,$model->email);
                        }
                        //registering successfully, send email to User
                        SendEmail::registerSucceedMailToUser($model);
                        //registering successfully, send email to Administrator
                        SendEmail::registerSucceedMailToAdmin($model);

                        $this->gotoPage(PAGE_SUCCESS_SIGN_UP);
                    }
                }
            }
            $this->render('register',array(
                'model'=>$model
            ));
        }
        catch (Exception $e)
        {
            Yii::log("Exception ".  print_r($e, true), 'error');
            throw  new CHttpException("Exception ".  print_r($e, true));
        }
    }


    private function captchaRequired()
    {           
        return Yii::app()->session->itemAt('captchaRequired') >= $this->attempts;
    }

    /**
     * Displays the login page
     */
    public function actionLogin()
    {
	$model = $this->captchaRequired()? new LoginForm('captchaRequired') : new LoginForm();
        $model->login_by = 'email';//login by username or email.
        $returnUrl = '';
        if(isset($_GET['returnUrl'])){
            $returnUrl = urldecode($_GET['returnUrl']);
        }
		// collect user input data
		if(isset($_POST['LoginForm']))
		{
			$model->attributes=$_POST['LoginForm'];
			// validate user input and redirect to the previous page if valid
			//if($model->validate() && $model->login())
                    if($model->validate())     
                    {
                        if(!empty($returnUrl)){
                            $this->redirect(Yii::app()->createAbsoluteUrl($returnUrl));
                        }
                        if (strpos(Yii::app()->user->returnUrl,'/index.php')===false)
                            $this->redirect(Yii::app()->user->returnUrl);
                        switch (Yii::app()->user->role_id){
                            case ROLE_ADMIN:
                                $this->redirect(Yii::app()->createAbsoluteUrl('admin/site/login'));
                            break;
                            default :$this->redirect(Yii::app()->createAbsoluteUrl('member/site/updateProfile'));
                        }
                        Yii::app()->session->add('captchaRequired',0);
                        Yii::app()->end();
                    }
                    else
                    {
                        $this->counter = Yii::app()->session->itemAt('captchaRequired') + 1;
                        Yii::app()->session->add('captchaRequired',$this->counter);
                    }
		}
		// display the login form
		$this->render('login',array('model'=>$model));
    }

    /**
     * Logs out the current user and redirect to homepage.
     */
    public function actionLogout()
    {
        Yii::app()->user->logout();
        $this->redirect(Yii::app()->createAbsoluteUrl('site/login'));
    }

    /**
	 * send an email to enable member to reset password - bb - 27/7/2014
	 */	
    public function actionForgotPassword()
    {
        $model = new Users('forgotPassword');
        if(isset($_POST['Users']))
        {
            $model->email = $_POST['Users']['email'];
            if ($model->validate()) 
            {
                    $model = Users::model()->findByAttributes(array('email'=>trim($model->email)));
                    SendEmail::forgotPasswordToUser($model);
                    Yii::app()->user->setFlash('msg', "Email sent! You'll receive an email with instructions on how to set a new password.");
                    $this->redirect(array('forgotPassword'));
            }
        }
        $this->render('forgot_password',array('model'=>$model));
    }
    
    //form reset password  - bb - 27/7/2014
    public function actionResetPassword()
    {
        $this->pageTitle = 'Reset password ' . ' - ' . Yii::app()->params['title'];
        try {
            $verify_code = trim($_GET['verify_code']);
            $model = Users::model()->findByAttributes(array('verify_code'=>$verify_code));
            if(!$model)
                throw new CHttpException(400, 'Invalid request. Please do not repeat this request again.');
            $model->scenario = 'fe_reset_password';
            
            if (isset($_POST['Users'])) {
                $model->attributes = $_POST['Users'];

                if ($model->validate()) 
                {
                    $newPass = $model->newPassword;
                    $model->password_hash = md5($newPass);
                    $model->temp_password = $newPass;
                    $model->verify_code = '';
                    $model->update(array('password_hash', 'temp_password', 'verify_code'));
                    $this->gotoPage(PAGE_SUCCESS_RESET_PASSWORD);            
                }
            }

            $this->render('resetPassword', array(
                        'model' => $model
                ));
            
        }catch (Exception $e)
        {
            Yii::log("Exception ".  print_r($e, true), 'error');
            throw  new CHttpException("Exception ".  print_r($e, true));
        }
    }

    public function actionContactUs()
    {
        $this->pageTitle = 'Contact Us ' . ' - ' . Yii::app()->params['defaultPageTitle'];
        $model = new ContactForm('create');
        //auto fill
        if(isset(Yii::app()->user->id))
        {
            $mUser = Users::model()->findByPk(Yii::app()->user->id);
            if($mUser)
            {
                $model->name = $mUser->full_name;
                $model->email = $mUser->email;
                $model->phone = $mUser->phone;
            }
            
        }
        if(isset($_POST['ContactForm']))
        {
            $model->attributes = $_POST['ContactForm'];
            if($model->validate()) {
                $model->message = '<br>'.nl2br($model->message);
                SendEmail::noticeContactToAdmin($model);
                SendEmail::confirmContactToUser($model);

                Yii::app()->user->setFlash('msg','Thank you for contacting us. We will respond to you as soon as possible.');                
                $this->refresh();
            }
            else{
                Yii::log(print_r($model->getErrors(), true), 'error', 'SiteController.actionContact');
            }
        }
 
        $this->render('contact_us', array(
            'model'=>$model,
        ));
    }

    //Kvan
//    public function actionThankYou(){
//        $this->pageTitle = 'Thank you ' . ' - ' .Yii::app()->params['title'];
//        $pageM = Yii::app()->user->getFlash('success');
//        $this->render('thankyoupage',array('pageM'=>$pageM));
//    }

    public function actionUnsubscribe($id, $code)
    {
        $model = Subscriber::model()->findByPk($id);
        $email = $model->email;
        if(md5($model->id.$model->email) == $code)
        {
            $model->deactivate();
            $this->render('unsubscribe', array('email'=>$email));
        }
        else
        {
            Yii::log("Invalid request");
            throw new CHttpException('Invalid request');
        }
    }

    
    public function actionGuestSubscriber(){

        $validator = new CEmailValidator;
        $error = array();
        if($validator->validateValue($_POST['guest_mail']) && !empty($_POST['guest_mail'])){
         $rs = Subscriber::model()->findAll(array('condition'=>'email="'.$_POST['guest_mail'].'"'));
         if(count($rs)>0)
            $error['exists'] = 'exists';
        else
        {
            // insert to db
            $model = new Subscriber();
            $model->email = $_POST['guest_mail'];
            $model->save();
        }
        }else
         $error['not_valid'] = 'not_valid';
        $this->render('guestSubscriber', array(
        'email'=>$_POST['guest_mail'],
        'error'=>$error));
    }


    public function actionUnderConstruction(){
         $this->render('underconstruction');
    }


}