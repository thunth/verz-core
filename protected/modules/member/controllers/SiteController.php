<?php

class SiteController extends MemberController
{
    /**
     * Declares class-based actions.
     */
    
    public function accessRules() {
        return array();
    }

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

	public function actionIndex()
	{
        $this->render('index');
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

    public function actionChangePassword(){
        $model = Users::getInforUser(Yii::app()->user->id);
        $model->scenario = 'changeMyPassword';

        if(isset($_POST['Users']))
        {
            $model->attributes=$_POST['Users'];
            if($model->validate())
            {
                $model->password_hash = md5($model->newPassword);
                $model->temp_password = $model->newPassword;
                if($model->update(array('password_hash', 'temp_password'))) {
                    SendEmail::changePassToUser($model);
                    Yii::app()->user->setFlash('successChangeMyPassword', "Your password has been successfully changed.");
                }
            }
        }

        $this->render('changePassword',array(
            'model'=>$model,
        ));
    }

    public function actionUpdateProfile(){
        $model = Users::getInforUser(Yii::app()->user->id);
        $model->scenario = 'updateMyProfile';

        if(isset($_POST['Users']))
        {
            $model->attributes=$_POST['Users'];
            if($model->save())
            {
                Yii::app()->user->setFlash('success', "Your profile has been successfully changed.");
            }
        }
        $this->render('updateProfile',array(
            'model'=>$model,
        ));
    }

}
