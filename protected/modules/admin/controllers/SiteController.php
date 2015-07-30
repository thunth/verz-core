<?php

class SiteController extends AdminController
{
    public function accessRules()
    {
        return array(
            array('allow',  // allow all users to perform  actions
                'actions'=>array('ForgotPassword', 'ResetPassword', 'Login', 'Logout', 'Error'),
                'users'=>array('*'),
            ),  
            array('allow',   //allow authenticated user to perform actions
                'actions'=>array('index', 'Update_my_profile', 'Change_my_password'),
                'users'=>array('@'),
            ),
            array('deny',  // deny all users
                'users'=>array('*'),
            ),                      
        );
    }

    public function actionForgotPassword()
    {
        $model = new ForgotPasswordForm;
        if(isset($_POST['ForgotPasswordForm']))
        {
            $model->attributes=$_POST['ForgotPasswordForm'];
            if($model->validate()) 
            {
                //check Email
                $user = Users::model()->findByAttributes(array(
                    'email' => trim($model->email), 'application_id' => BE,
                ));
                if(!$user){
                    $model->addError('email','Email does not exist.');
                } else {
                    SendEmail::verifyResetPasswordToAdmin($user);
                }                                

            }
        }
		$this->render('forgotPassword',array('model'=>$model));
    }
	
    public function actionResetPassword()
    {
        $id = Yii::app()->request->getParam('id'); 
        $key = Yii::app()->request->getParam('key'); 
        $model = Users::model()->findByPk((int)$id);
        
        if($model !== null && $key == ForgotPasswordForm::generateKey($model))
        {
            $pass = StringHelper::getRandomString(6);
            $model->password_hash = md5($pass);
            $model->temp_password = $pass;
            $model->update();
            SendEmail::resetPasswordToAdmin($model);
        }
        else
        {
            Yii::log('Invalid request. Please do not repeat this request again.');
            throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
        }
        $this->render('ResetPassword',array('model'=>$model));
        
    }    

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

	public function actionIndex()
	{
            $data = array();
            if(isset($_POST['a'])){
                $a = $_POST['a'];
                $b = $_POST['b'];
                $sum = $a + $b;
                $data['sum'] = $sum;
            }
            
//            echo "<pre>";
//            echo "Post Variable<br>";
//            print_r($_POST['a']);
//            echo "</pre>";
//            
//            echo "<pre>";
//            echo "Get Variable<br>";
//            print_r($_GET);
//            echo "</pre>";
//            die;
            
                                                                                                                            
            $this->render('index', 
                array(
                    "data" => $data,
                )
            );
	}

    /**
     * Displays the login page
     */
    public function actionLogin()
    {    

        $model=new AdminLoginForm;
        if(isset($_POST['AdminLoginForm']))
	    {
            //var_dump($_POST['LoginForm']);die;
            $model->attributes=$_POST['AdminLoginForm'];
            if($model->validate()){
                /* Change at yii 1.1.13:
                 * we not use: if (strpos(Yii::app()->user->returnUrl,'/index.php')===false) to check returnUrl
                 */    
                if (strtolower(Yii::app()->user->returnUrl)!==strtolower(Yii::app()->baseUrl.'/'))
                    $this->redirect(Yii::app()->user->returnUrl);
                
                switch (Yii::app()->user->role_id){
                    case ROLE_ADMIN:
                        $this->redirect(Yii::app()->createAbsoluteUrl('admin'));
                    break;

                    default: $this->redirect(Yii::app()->createAbsoluteUrl('admin'));
                }
            }
        }
        $this->render('login', array('model'=>$model));
    }
    
    /**
     * Logs out the current user and redirect to homepage.
     */
    public function actionLogout()
    {
        Yii::app()->user->logout();
        if(isset($_SESSION['LOGGED_USER']))
            unset($_SESSION['LOGGED_USER']);
        //xoa cookie
        if(isset($_COOKIE[VERZ_COOKIE_ADMIN])){
            setcookie(VERZ_COOKIE_ADMIN, '', 1);
            setcookie(VERZ_COOKIE_ADMIN, '', 1, '/');
        }        
        
        $this->redirect(Yii::app()->createAbsoluteUrl('admin/login/'));
    }
    
    
    public function actionUpdate_my_profile()
    {
        if (Yii::app()->user->id == '')
            $this->redirect(array('login'));

        $model = MyFormat::loadModelByClass(Yii::app()->user->id, "Users");
        $model->scenario = 'updateMyProfile';
        //$model->md5pass = $model->password_hash;

        if (isset($_POST['Users']))
        {

            $model->attributes = $_POST['Users'];
            if ($model->validate())
            {
                if ($model->save())
                {
                    $this->setNotifyMessage(NotificationType::Success, 'Your profile information has been successfully updated.');
                    $this->redirect(array('update_my_profile'));
                }
            }
        }

        $this->render('update_my_profile', array(
                'model' => $model,
        ));
    }

    public function actionChange_my_password()
    {
        if (Yii::app()->user->id == '')
            $this->redirect(array('login'));

        $model = MyFormat::loadModelByClass(Yii::app()->user->id, "Users");
        $model->scenario = 'changeMyPassword';

        if (isset($_POST['Users']))
        {
            $model->attributes = $_POST['Users'];
            if ($model->validate())
            {
                $model->password_hash = md5($model->newPassword);
                $model->temp_password = $model->newPassword;
                if ($model->update(array('password_hash', 'temp_password')))
                {
                    SendEmail::noticeChangPasswordSucceedToAdmin($model);
                    $this->setNotifyMessage(NotificationType::Success, 'Your password has been changed successfully');
                    $this->redirect(array('change_my_password'));
                }
            }
        }

        $this->render('change_my_password', array(
                'model' => $model,
        ));
    }
    
    
}