<?php
/**
 * All sendmail function should be placed here.
 * Custom For Each Project
 */
class SendEmail{
    //registering successfully, send email to User - bb
    public static function registerSucceedToUser($mUser){
        $param = $mUser->getParamArray();
//        echo '<pre>';
//        print_r($param);
//        echo '<pre>';
//        exit;
        $loginLink = '<a href="' . Yii::app()->createAbsoluteUrl("site/login") . '">' . Yii::app()->createAbsoluteUrl("site/login") . '</a>';
        $param['{FULL_NAME}'] = !empty($mUser->full_name) ? $mUser->full_name : $mUser->first_name.' '.$mUser->last_name;
        $param['{PASSWORD}'] = $mUser->temp_password;
        $param['{LINK_LOGIN}'] = $loginLink;
        $param['{COUNTRY}'] = $mUser->area_code->area_name;

        if(EmailHelper::send(MAIL_REGISTER_SUCCEED_TO_MEMBER, $param, $mUser->email)){

        }else $mUser->addError('status', 'Can not send email');
    }

    //registering successfully, send email to Administrator - bb
    public static function registerSucceedToAdmin($mUser){
        $param = $mUser->getParamArray();
        $param['{FULL_NAME}'] = !empty($mUser->full_name) ? $mUser->full_name : $mUser->first_name.' '.$mUser->last_name;
        $param['{PASSWORD}'] = $mUser->temp_password;
        $param['{COUNTRY}'] = $mUser->area_code->area_name;

        if(EmailHelper::send(MAIL_REGISTER_SUCCEED_TO_ADMIN, $param, Yii::app()->params['adminEmail'])){

        }else $mUser->addError('status', 'Can not send email');
    }
    
    //send email to User for forgetting password  - bb
    public static function forgotPasswordToUser($mUser){
        $mUser->verify_code = Users::model()->checkVerifyCode(rand(100000, 1000000)); // Gen verify code and send qua mail or sms
        $mUser->update('verify_code');
        $resetlink = '<a href="' . Yii::app()->createAbsoluteUrl("site/resetPassword", array('verify_code'=>$mUser->verify_code)) . '">RESET PASSWORD NOW</a>';
        $param = array(
            '{FULL_NAME}'        => !empty($mUser->full_name) ? $mUser->full_name : $mUser->first_name.' '.$mUser->last_name,
            '{EMAIL}'       => $mUser->email,
            '{RESET_LINK}'  => $resetlink,
        );
        
        if(EmailHelper::send(MAIL_FORGET_PASSWORD, $param, $mUser->email)){
            
        }else $mUser->addError('status', 'Can not send email');
    }

    //send email to User for changing password
    public static function changePassToUser($mUser){
        $name = $mUser->full_name;
        $login_link = '<a href="'.Yii::app()->createAbsoluteUrl("site/login").'">'.Yii::app()->createAbsoluteUrl("site/login").'</a>';
        $param = array(
            '{FULL_NAME}'=>$name,
            '{PASSWORD}'=>$mUser->temp_password,
            '{LINK_LOGIN}' =>$login_link,
        );

        if(EmailHelper::send(MAIL_CHANGE_PASSWORD_TO_USER, $param, $mUser->email))
            Yii::app()->user->setFlash("success", "An email has sent to: $mUser->email. Please check email to get new password.");
        else
            $mUser->addError('email','Can not send email to: '.$mUser->email);

    }

    //Submitting contact form successfully, send email to confirm User
    public static function confirmContactMailToUser($contactM){
        $param = array(
            '{NAME}'=>$contactM->name,
            '{EMAIL}'=>$contactM->email,
            '{PHONE}' =>$contactM->phone,
            '{MESSAGE}' =>$contactM->message,
        );

        if(EmailHelper::send(MAIL_CONTACT_US_TO_USER,$param, Yii::app()->params['adminEmail'])){}
        else
            $contactM->addError('email','Can not send email to: '.$contactM->email);
    }

    //Submitting contact form successfully, send email to Administrator
    public static function noticeContactMailToAdmin($contactM){
        $param = array(
            '{NAME}'=>$contactM->name,
            '{EMAIL}'=>$contactM->email,
            '{PHONE}' =>$contactM->phone,
            '{MESSAGE}' =>$contactM->message,
        );

        if(EmailHelper::send(MAIL_CONTACT_US_TO_ADMIN,$param, Yii::app()->params['adminEmail'])){}
        else
            $contactM->addError('email','Can not send email to: '.$contactM->email);
    }

    //mail from Forgot Password at BE
    public static function verifyResetPasswordToAdmin($mUser){
        $name = $mUser->full_name;
        $key = ForgotPasswordForm::generateKey($mUser);
        $forgot_link = '<a href="'.Yii::app()->createAbsoluteUrl('/admin/site/resetPassword',array('id'=>$mUser->id, 'key'=>$key)).'">'.Yii::app()->createAbsoluteUrl('/admin/site/ResetPassword',array('id'=>$mUser->id, 'key'=>$key)).'</a>';

        $param = array(
            '{NAME}'=>$name,
            '{USERNAME}'=>$mUser->username,
            '{EMAIL}'=>$mUser->email,
            '{LINK}' =>$forgot_link,
        );

        if(EmailHelper::send(MAIL_VERIFY_TO_RESET_PASSWORD_TO_ADMIN,$param, $mUser->email))
            Yii::app()->user->setFlash("success", "An email has sent to: $mUser->email. Please check email to verify this action.");
        else
            $mUser->addError('email','Can not send email.');
    }

    //mail to reset password after admin agreed verify email at BE
    public static function resetPasswordToAdmin($mUser){
        $name = $mUser->full_name;
        $login_link = '<a href="'.Yii::app()->createAbsoluteUrl("admin/site/login").'">'.Yii::app()->createAbsoluteUrl("admin/site/login").'</a>';
        $param = array(
            '{NAME}'=>$name,
            '{PASSWORD}'=>$mUser->temp_password,
            '{LINK_LOGIN}' =>$login_link,
        );

        if(EmailHelper::send(MAIL_RESET_PASSWORD_TO_ADMIN,$param, $mUser->email))
            Yii::app()->user->setFlash("success", "An email has sent to: $mUser->email. Please check email to get new password.");
        else
            $mUser->addError('email','Can not send email to: '.$mUser->email);
    }

    //mail to change password successfully from "Change password form" at BE
    public static function noticeChangPasswordSucceedToAdmin($mUser){
        $name = $mUser->full_name;
        $login_link = '<a href="'.Yii::app()->createAbsoluteUrl("admin/site/login").'">'.Yii::app()->createAbsoluteUrl("admin/site/login").'</a>';
        $param = array(
            '{NAME}'=>$name,
            '{PASSWORD}'=>$mUser->temp_password,
            '{LINK_LOGIN}' =>$login_link,
        );

        if(EmailHelper::send(MAIL_CHANGE_PASSWORD_TO_ADMIN,$param, $mUser->email))
            Yii::app()->user->setFlash("success", "An email has sent to: $mUser->email. Please check email to get new password.");
        else
            $mUser->addError('email','Can not send email to: '.$mUser->email);
    }
}
?>
