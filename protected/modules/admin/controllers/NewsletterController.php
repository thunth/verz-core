<?php

class NewsletterController extends AdminController
{
	public function actionCreate()
	{
            $model = new Newsletter('create');

            if(isset($_POST['Newsletter']))
            {
                $model->attributes=$_POST['Newsletter'];
                $model->created_time = date('Y-m-d H:i:s');
                $send_time = str_replace("/","-",$_POST['Newsletter']['send_time']);
                $send_time = date('Y-m-d H:i:s',strtotime($send_time));
                $model->send_time = $send_time;

                $res = $this->buildListSubscriberAdd();                
                $model->total_subscriber = $res['totalSubscriber'];
                $model->remain_subscribers = $res['listIdSubsciber'];
                if(!$model->save())
                {
                    Yii::log(print_r($model, true), 'error', 'NewsletterController.actionCreate');
                    //throw new CHttpException(400, 'Error');
                } else{
                    $this->saveGroupSubscriber($model);
                    $this->redirect(array('view','id'=>$model->id));
                }
            }

            $this->render('create',array(
                'model'=>$model, 'actions' => $this->listActionsCanAccess,
            ));
	}
        
        public function buildListSubscriberAdd(){
            $criteria=new CDbCriteria;
            $criteria->compare('t.status',1);
            $listIdSubsciber =  '';
            $totalSubscriber=0;
            // if not select group => we get all subscriber
            if(!isset($_POST['Newsletter']['newsletter_group_subscriber']) || count($_POST['Newsletter']['newsletter_group_subscriber'])<1 ){
                $subscribers = Subscriber::model()->findAll($criteria);
                foreach($subscribers as $s)
                {
                    $listIdSubsciber .= $s->id . ',';
                }
                $totalSubscriber = count($subscribers);
            }else{
                // if select group => we get all subscriber of this group
                $criteria->addInCondition('t.subscriber_group_id',$_POST['Newsletter']['newsletter_group_subscriber']);
                $subscribers = Subscriber::model()->findAll($criteria);
                foreach($subscribers as $s)
                {
                    $listIdSubsciber .= $s->id . ',';
                }
                $totalSubscriber = count($subscribers);
            }
            return array('listIdSubsciber'=>$listIdSubsciber,'totalSubscriber'=>$totalSubscriber);
            
        }

        public function buildListSubscriberUpdate($model){
            $criteria=new CDbCriteria;
            $criteria->compare('t.status',1);
            $listIdSubsciber =  '';
            $totalSubscriber=0;
            // if not select group => we get all subscriber
            if(!isset($_POST['Newsletter']['newsletter_group_subscriber']) || count($_POST['Newsletter']['newsletter_group_subscriber'])<1 ){
                $listIdSubsciber = '';
            }else{
                // if select group => we get all subscriber of this group
                // id add more group, we find more subscriber 
                $arrGroupIdOld = $this->getGroupSubscriber($model);
                $arrGroupIdAddNew=array();
                foreach ($_POST['Newsletter']['newsletter_group_subscriber'] as $item){
                    if(!in_array($item, $arrGroupIdOld))
                            $arrGroupIdAddNew[]=$item;
                }
                
                if(count($arrGroupIdAddNew)>0):
                    $criteria->addInCondition('t.subscriber_group_id',$arrGroupIdAddNew);
                    $subscribers = Subscriber::model()->findAll($criteria);
                    foreach($subscribers as $s)
                    {
                        $listIdSubsciber .= $s->id . ',';
                    }
                    $totalSubscriber = count($subscribers);
                else:
                    $listIdSubsciber = '';    
                endif;
            }
            return array('listIdSubsciber'=>$listIdSubsciber,'totalSubscriber'=>$totalSubscriber);
            
        }

        public function actionUpdate($id)
        {
            $model=$this->loadModel($id);
            $model->newsletter_group_subscriber = $this->getGroupSubscriber($model);

            if(isset($_POST['Newsletter']))
            {
                $model->attributes=$_POST['Newsletter'];
                $send_time = str_replace("/","-",$_POST['Newsletter']['send_time']);
                $send_time = date('Y-m-d H:i:s',strtotime($send_time));
                $model->send_time = $send_time;
                $res = $this->buildListSubscriberUpdate($model);
                $model->total_subscriber = $model->total_subscriber+$res['totalSubscriber'];
                $model->remain_subscribers = $model->remain_subscribers.$res['listIdSubsciber'];
                
                if($model->validate()):
                    $model->save();
                    $this->saveGroupSubscriber($model);
                    $this->redirect(array('view','id'=>$model->id));
                endif;
            }

            $model->send_time = date('d/m/Y H:i:s',strtotime($model->send_time));

            $this->render('update',array(
                'model'=>$model, 'actions' => $this->listActionsCanAccess,
            ));
        }

        public function getGroupSubscriber($model){
            if(count($model->newsletter_subscriber)>0){
                $res = array();
                foreach($model->newsletter_subscriber as $item)
                    $res[]= $item->subscriber_group_id;
                return $res;
            }
            return array();
        }
        
        public function saveGroupSubscriber($model){
            NewsletterGroupSubscriber::model()->deleteAll('newsletter_id='.$model->id);
            foreach ($_POST['Newsletter']['newsletter_group_subscriber'] as $item):
                $mAdd = new NewsletterGroupSubscriber();
                $mAdd->newsletter_id=$model->id;
                $mAdd->subscriber_group_id=$item;
                $mAdd->save();
            endforeach;
        }
        
        
	public function actionDelete($id)
	{ 
		if(Yii::app()->request->isPostRequest)
		{
			// we only allow deletion via POST request
			if($model = $this->loadModel($id))
                        {
                            if($model->delete())
                                Yii::log("Delete record ".  print_r($model->attributes, true), 'info');
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
        
        public function actionView($id)
        {
            $this->render('view',array(
                'model'=>$this->loadModel($id), 'actions' => $this->listActionsCanAccess,
            ));
        }        

	/**
	 * Manages all models.
	 */
	public function actionIndex()
	{
		$model=new Newsletter('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Subscriber']))
			$model->attributes=$_GET['Newsletter'];

		$this->render('index',array(
			'model'=>$model, 'actions' => $this->listActionsCanAccess,
		));
	}


    /**
     * @param integer the ID of the model to be loaded
     * @return Returns the data model based on the primary key given in the GET variable.
     * If the data model is not found, an HTTP exception will be raised.
     */
    public function loadModel($id)
    {
        $model=Newsletter::model()->findByPk($id);
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
