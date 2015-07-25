<?php

/**
 * This is the model class for table "{{_subscriber}}".
 *
 * The followings are the available columns in table '{{_subscriber}}':
 * @property integer $id
 * @property string $name
 * @property string $email
 * @property integer $status
 */
class Subscriber extends _BaseModel {

    /**
     * Returns the static model of the specified AR class.
     * @param string $className active record class name.
     * @return Subscriber the static model class
     */
    public static function model($className = __CLASS__) {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return '{{_subscriber}}';
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('email', 'required'),
            array('email', 'unique', 'message' => 'This email address has been subscriber'),
            array('status', 'numerical', 'integerOnly' => true),
            array('name', 'length', 'max' => 100),
            array('email', 'length', 'max' => 200),
            array('email', 'email'),
            // The following rule is used by search().
            // Please remove those attributes that should not be searched.
            array('id, name, email, status, subscriber_group_id', 'safe'),
        );
    }

    public function getAjaxAction() {
        return array('actionAjaxActivate', 'actionAjaxDeactivate');
    }

    /**
     * @return array relational rules.
     */
    public function relations() {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
            'subscriber_group' => array(self::BELONGS_TO, 'SubscriberGroup', 'subscriber_group_id'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels() {
        return array(
            'id' => 'ID',
            'name' => 'Name',
            'email' => 'Email',
            'status' => 'Status',
            'subscriber_group_id' => 'Subscriber Group',
        );
    }

    /**
     * Retrieves a list of models based on the current search/filter conditions.
     * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
     */
    public function search() {
        // Warning: Please modify the following code to remove attributes that
        // should not be searched.

        $criteria = new CDbCriteria;

        $criteria->compare('id', $this->id);
        $criteria->compare('name', $this->name, true);
        $criteria->compare('email', trim($this->email), true);
        $criteria->compare('status', $this->status);

        $criteria->order = 'id DESC';

        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
            'Pagination' => array(
                'PageSize' => 50, //edit your number items per page here
            ),
        ));
    }

    public function activate() {
        $this->status = 1;
        if ($this->update()) {
            $this->mailchimp();
        }
    }

    public function deactivate() {
        $this->status = 0;
        if ($this->update()) {
            $this->mailchimp();
        }
    }

//        public function mailchimp(){
//                        set_time_limit(7200);
//            $idNameGroup=array();
//            $criteria=new CDbCriteria;
////            $criteria->compare('t.status',1);
//            $mSubG = SubscriberGroup::model()->findAll($criteria);
//            if(count($mSubG)>0)
//                foreach($mSubG as $i)
//                    $idNameGroup[$i->id] = $i->name;
//            
//            $criteria=new CDbCriteria;
//            $mSubscriber = Subscriber::model()->findAll($criteria);
//            $test=array();
//            if(count($mSubscriber)>0)
//            {
//                Yii::import('ext.MailChimp.MailChimp', true); 
//                foreach($mSubscriber as $item)
//                {
//                    $mailChimp = new MailChimp();
////                    $mailChimp->removeSubscriber('verzdev2@gmail.com');
////                    die;
//                    $sGroupName = Yii::app()->params['mailchimp_title_groups'];
//                    $sGroup = strtolower($idNameGroup[$item->subscriber_group_id]);
//                    $merge_vars = array(
//                            //'FNAME'=>$item->first_name, 'LNAME'=>  $item->last_name, 
//                            'GROUPINGS'=>array(
//                                array('name'=>$sGroupName, 'groups'=>$sGroup),
//                            )
//                        );
//                    if($item->status == 1)
//                    {
//                        $test[]= $mailChimp->addSubscriber($item->email, $merge_vars);
//                    }
//                    else
//                    {
//                        $mailChimp->removeSubscriber($item->email);
//                    }
//                }
//                
//            }
//        }
    public function mailchimp() {
        set_time_limit(7200);
        $idNameGroup = array();
        $criteria = new CDbCriteria;
//            $criteria->compare('t.status',1);
        $mSubG = SubscriberGroup::model()->findAll($criteria);
        if (count($mSubG) > 0)
            foreach ($mSubG as $i)
                $idNameGroup[$i->id] = $i->name;

        $criteria = new CDbCriteria;
        $mSubscriber = Subscriber::model()->findAll($criteria);
        $test = array();
        if (count($mSubscriber) > 0) {
            Yii::import('ext.MailChimp.MailChimp', true);
            foreach ($mSubscriber as $item) {
                self::addSubscriberToMailchimp($item);
            }
        }
    }

    public function scopes() {
        return array(
            'active' => array(
                'condition' => 'status=1',
            )
        );
    }

    // Add By Nguyen Dung
    public static function getSubscriberByEmail($email) {
        return Subscriber::model()->find('email="' . $email . '"');
    }
     public static function getSubscriberById($id){
        return Subscriber::model()->findByPk($id);
    }

    //Kvan
    public static function addSubscriber($name, $email) {
        if(!self::getSubscriberByEmail($email)){
            $sub = new Subscriber();
            $sub->name = $name;
            $sub->email = $email;
            $sub->status = STATUS_ACTIVE;
            $sub->subscriber_group_id = GROUP_MEMBER;
            $sub->save();
            return $sub;
        }
    }

    //Kvan
    public static function deleteSubscriber($email) {
        $sub = self::getSubscriberByEmail($email);
        if (!empty($sub))
            $sub->delete();
    }

    public static function addSubscriberToMailchimp($model) {
        $mailChimp = new MailChimp();
        $sGroupName = Yii::app()->params['mailchimp_title_groups'];
        $sGroup = strtolower($model->subscriber_group->name);
        $merge_vars = array(
            'FNAME' => $model->name,
            'GROUPINGS' => array(
                array('name' => $sGroupName, 'groups' => $sGroup),
            )
        );
        if ($model->status == 1) {
            $test[] = $mailChimp->addSubscriber($model->email, $merge_vars);
        } else {
            $mailChimp->removeSubscriber($model->email);
        }
    }

    public static function deleteSubscriberToMailchimp($email) {
        $mailChimp = new MailChimp();
        $mailChimp->removeSubscriber($email);
    }

    public static function updateSubscriberToMailchimp($model) {
        $mailChimp = new MailChimp();
        $sGroupName = Yii::app()->params['mailchimp_title_groups'];
        $sGroup = strtolower($model->subscriber_group->name);
        $merge_vars = array(
            'FNAME' => $model->name,
            'GROUPINGS' => array(
                array('name' => $sGroupName, 'groups' => $sGroup),
            )
        );
        $mailChimp->updateSubscriber($model->email, $merge_vars);
    }

    public function beforeDelete() {
        $model = self::getSubscriberById($this->id);
        if (!empty($model)) {
            Yii::import('ext.MailChimp.MailChimp', true);
            self::deleteSubscriberToMailchimp($model->email);
        }
        return parent::beforeDelete();
    }

}