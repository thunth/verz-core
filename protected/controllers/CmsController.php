<?php

class CmsController extends FrontController
{
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


    /**
     * This is the action to handle external exceptions.
     */
    public function actionError()
    {
        var_dump(Yii::app()->errorHandler->error);
        $error=Yii::app()->errorHandler->error;

            if(Yii::app()->request->isAjaxRequest)
                echo $error['message'];
            else
                $this->render('error', $error);

    }
	
	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */

	public function actionIndex($slug){
        try {
            $model = Page::model()->find("slug='".$_GET['slug']."' and status=1");
            if(empty($model)) $this->redirect(array('error'));

            $this->render('page',array(
                'model'=>$model,
            ));
        } catch (Exception $exc) {
            throw new Exception($exc->getMessage());
        }
	}
}