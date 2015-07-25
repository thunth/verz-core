<?php

/**
 * This is the model class for table "{{_newsletter}}".
 *
 * The followings are the available columns in table '{{_newsletter}}':
 * @property integer $id
 * @property string $subject
 * @property string $content
 * @property string $created_time
 * @property string $remain_subscribers
 * @property integer $total_subscriber
 */
class Newsletter extends _BaseModel
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Newsletter the static model class
	 */
    public $newsletter_group_subscriber;// Add By Nguyen Dung
    public $total_read; // Add By Nguyen Dung
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{_newsletter}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		return array(
			array('subject, content, send_time', 'required'),
			array('total_subscriber', 'numerical', 'integerOnly'=>true),
			array('subject', 'length', 'max'=>255),
            array('send_time', 'date', 'format'=>'yyyy-M-d H:m:s'),
			array('subject, content, send_time', 'safe'),
			array('id, subject, content, created_time, total_subscriber, newsletter_group_subscriber', 'safe'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
                    'newsletter_subscriber' => array(self::HAS_MANY, 'NewsletterGroupSubscriber', 'newsletter_id'),
                    'newsletter_tracking' => array(self::HAS_MANY, 'NewsletterTracking', 'newsletter_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'subject' => 'Subject',
			'content' => 'Content',
			'created_time' => 'Created Time',
			'send_time'		=>	"Sent time",			
			'total_subscriber' => 'Total Subscriber',
			'newsletter_group_subscriber' => 'Group Sent',
			'total_read' => 'Total Read',
		);
	}

    public function countRemain()
    {
        return 0;
    }

	public function search()
	{
		$criteria=new CDbCriteria;

		$criteria->compare('t.id',$this->id);
		$criteria->compare('t.subject',$this->subject,true);
		$criteria->compare('t.content',$this->content,true);
		$criteria->compare('t.created_time',$this->created_time,true);
		$criteria->compare('t.total_subscriber',$this->total_subscriber);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

    /*
    public function activate()
    {
        $this->status = 1;
        $this->update();
    }

    public function deactivate()
    {
        $this->status = 0;
        $this->update();
    }
	*/

	public function defaultScope()
	{
		return array(
			//'condition'=>'',
		);
	}
        
        // Add By Nguyen Dung
        public static function getNewsletterByPk($pk){
            return Newsletter::model()->findByPk((int)$pk);            
        }
}