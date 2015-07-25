<?php

class UsersController extends AdminController
{
    public $pluralTitle = 'Members';
    public $singleTitle = 'Member';
    public $aIdCannotDelete = array();

    public function actionCreate() {
        try {
            $model = new Users('create');
            $model->role_id = ROLE_MEMBER;
            if (isset($_POST['Users'])) {
                $model->attributes = $_POST['Users'];
                if ($model->save()) {
                    
                    $model->password_hash = md5($model->temp_password);
                    $this->setNotifyMessage(NotificationType::Success, $this->singleTitle . ' has been created');
                    $this->redirect(array('view', 'id' => $model->id));
                }
                else
                    $this->setNotifyMessage(NotificationType::Error, $this->singleTitle . ' cannot be created for some reasons');
            }
            $this->render('create', array(
                'model' => $model,
                'actions' => $this->listActionsCanAccess,
            ));
        } catch (exception $e) {
            Yii::log("Exception " . $e->getMessage(), 'error');
            throw new CHttpException($e);
        }
    }

    public function actionDelete($id) {
        try {
            
            if (Yii::app()->request->isPostRequest) {
                // we only allow deletion via POST request
                if (!in_array($id, $this->aIdCannotDelete)) {                    
                    if ($model = $this->loadModel($id)) {                        
//                        SendEmail::noticeChangPasswordSucceedToAdmin($model);
                        $this->setNotifyMessage(NotificationType::Success, 'Your password has been changed successfully');
                        if ($model->delete()){
                            Yii::log("Delete record " . print_r($model->attributes, true), 'info');
                        }
                    }

                    // if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
                    if (!isset($_GET['ajax']))
                        $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('index'));
                }
            } else {
                Yii::log("Invalid request. Please do not repeat this request again.");
                throw new CHttpException(400, 'Invalid request. Please do not repeat this request again.');
            }
        } catch (Exception $e) {
            Yii::log("Exception " . $e->getMessage(), 'error');
            throw new CHttpException($e);
        }
    }

    public function actionIndex() {
        try {
            $model=new Users('search');
            $model->unsetAttributes();  // clear any default values
            if(isset($_GET['Users']))
                $model->attributes=$_GET['Users'];
            $model->role_id = ROLE_MEMBER;
            $this->render('index',array(
                'model'=>$model, 'actions' => $this->listActionsCanAccess,
            ));
        } catch (Exception $e) {
            Yii::log("Exception " . $e->getMessage(), 'error');
            throw  new CHttpException($e);
        }
    }

    public function actionUpdate($id) {
        $model=$this->loadModel($id);
        $model->role_id = ROLE_MEMBER;
        if(isset($_POST['Users']))
        {
            $model->attributes=$_POST['Users'];
            if ($model->save())
            {
                $this->setNotifyMessage(NotificationType::Success, $this->singleTitle . ' has been updated');
                $this->redirect(array('view', 'id'=> $model->id));
            }
            else
                $this->setNotifyMessage(NotificationType::Error, $this->singleTitle . ' cannot be updated for some reasons');
        }
        //$model->beforeRender();
        $this->render('update',array(
            'model' => $model,
            'actions' => $this->listActionsCanAccess,
            'title_name' => $model->id        ));
    }

    public function actionView($id) {
        try {
            $model = $this->loadModel($id);
            $this->render('view', array(
                'model'=> $model,
                'actions' => $this->listActionsCanAccess,
                'title_name' => $model->id            ));
        } catch (Exception $exc) {
            throw new CHttpException(404, 'The requested page does not exist.');
        }
    }

    /*
     * Bulk delete
     * If you don't want to delete some specified record please configure it in global $aIdCannotDelete variable
     */
    public function actionDeleteAll()
    {
        $deleteItems = $_POST['users-grid_c0'];
        $shouldDelete = array_diff($deleteItems, $this->aIdCannotDelete);

        if (!empty($shouldDelete))
        {
            Users::model()->deleteAll('id in (' . implode(',', $shouldDelete) . ')');
            $this->setNotifyMessage(NotificationType::Success, 'Your selected records have been deleted');
        }
        else
            $this->setNotifyMessage(NotificationType::Error, 'No records was deleted');

        if (!isset($_GET['ajax']))
            $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('index'));
    }

    public function actionUpdateStatusAll() {
        $updateItems = $_POST['users-grid_c0'];
        $status = $_POST['status'];
        if (!empty($updateItems) && $status != '') {
            Users::model()->updateAll(array('status'=>$status), 'id in (' . implode(',', $updateItems) . ')');
            $this->setNotifyMessage(NotificationType::Success, 'Your selected records have been updated');
        }
        else
            $this->setNotifyMessage(NotificationType::Error, 'No records was updated');

        if (!isset($_GET['ajax']))
            $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('index'));
    }


    public function loadModel($id){
        //need this define for inherit model case. Form will render parent model name in control if we don't have this line
        $initMode = new Users();
        $model=$initMode->findByPk($id);
        if($model===null)
            throw new CHttpException(404,'The requested page does not exist.');
        return $model;
    }
}