<?php

class SubscriberController extends AdminController
{
	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id), 'actions' => $this->listActionsCanAccess,
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Subscriber('create');

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Subscriber']))
		{
			$model->attributes=$_POST['Subscriber'];
                        $model->email = trim($_POST['Subscriber']['email']);
			if($model->save())
                        {
                             //Synchronize
                            Yii::import('ext.MailChimp.MailChimp', true);
                            Subscriber::addSubscriberToMailchimp($model);
                            $this->redirect(array('index'));
                        }
		}

		$this->render('create',array(
			'model'=>$model, 'actions' => $this->listActionsCanAccess,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);
                $old_email = $model->email;
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Subscriber']))
		{
			$model->attributes=$_POST['Subscriber'];
                        $model->email = trim($_POST['Subscriber']['email']);
			if($model->save())
                        {
                             //if users change their email, update new email
                            if($model->email != $old_email){
                                //Synchronize
                                Yii::import('ext.MailChimp.MailChimp', true);
                                Subscriber::deleteSubscriberToMailchimp($old_email);
                                //Synchronize
                                Subscriber::addSubscriberToMailchimp($model);
                            }
                            $this->redirect(array('index'));
                        }
				
		}

		$this->render('update',array(
			'model'=>$model, 'actions' => $this->listActionsCanAccess,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		if(Yii::app()->request->isPostRequest)
		{
			// we only allow deletion via POST request
			if($model = $this->loadModel($id))
                        {
                            if($model->delete())
                                Yii::log(" Subscriber Delete record ".  print_r($model->attributes, true), 'info');
                        }

			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('index'));
		}
		else
		{
                    Yii::log('Invalid request. Please do not repeat this request again.');
                    throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
                }
	}

	/**
	 * Manages all models.
	 */
	public function actionIndex()
	{
		$model=new Subscriber('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Subscriber']))
			$model->attributes=$_GET['Subscriber'];

		$this->render('index',array(
			'model'=>$model, 'actions' => $this->listActionsCanAccess,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer the ID of the model to be loaded
	 */
	public function loadModel($id)
	{
		$model=Subscriber::model()->findByPk((int)$id);
		if($model===null)
		{
                    Yii::log('The requested page does not exist.');
                    throw new CHttpException(404,'The requested page does not exist.');
                }
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param CModel the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='subscriber-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
