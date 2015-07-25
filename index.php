<?php
try {
    //error_reporting(0);
    date_default_timezone_set('Asia/Singapore');
    // change the following paths if necessary
    define('DS', DIRECTORY_SEPARATOR);
    define('PS', PATH_SEPARATOR);
    define('ROOT', dirname(__FILE__));
    define('YII_PROTECTED_DIR',  ROOT . DS . 'protected');
    define('YII_THEMES_DIR',  ROOT . DS . 'themes');
    define('YII_UPLOAD_DIR',  ROOT . DS . 'upload');
    define('YII_UPLOAD_FOLDER', 'upload');
    
    $yii='../yii-framework-1.1.16/yii.php';
    $config=dirname(__FILE__).'/protected/config/main.php';

    // remove the following lines when in production mode
    //define('YII_DEBUG', true);
    defined('YII_DEBUG') or define('YII_DEBUG',true);
    // specify how many levels of call stack should be shown in each log message
    defined('YII_TRACE_LEVEL') or define('YII_TRACE_LEVEL',3);
    // remove the following lines when in production mode

    require_once($yii);
    Yii::createWebApplication($config);
    SettingForm::applySettings();//override settings by values from database
    Yii::app()->run();
} catch (Exception $exc) {
    if(strpos($exc->getMessage(), "Can't connect to local MySQL server") ){
        echo "Server can not connect, please try again later. Contact with admin if waiting over 10 minutes";
        die;
    }else{
        throw new CHttpException(404, $exc->getMessage());
    }
}