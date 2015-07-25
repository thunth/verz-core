<?php

/**
 * This is the model class for table "gama_group_banners".
 *
 * The followings are the available columns in table 'gama_group_banners':
 * @property integer $id
 * @property string $name
 */
class GroupBanner extends _BaseModel
{

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return  '{{_group_banners}}';;
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, display_in_url', 'required'),
			array('name', 'length', 'max' => 250),
			array('name', 'unique'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name', 'safe', 'on' => 'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => Yii::t('translation', 'ID'),
			'name' => Yii::t('translation', 'Name'),
			'display_in_url' => Yii::t('translation', 'Display in url'),
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria = new CDbCriteria;

		$criteria->compare('id', $this->id);
		$criteria->compare('name', $this->name, true);
		$sort = new CSort();

		$sort->attributes = array(
			'name' => array(
				'asc' => 't.name',
				'desc' => 't.name desc',
				'default' => 'asc',
			),
		);
		$sort->defaultOrder = 't.name asc';


		return new CActiveDataProvider($this, array(
			'criteria' => $criteria,
			'pagination' => array(
				'pageSize' => Yii::app()->params['defaultPageSize'],
			),
		));
	}

	public function behaviors()
	{
		return array('sluggable' => array(
				'class' => 'application.extensions.mintao-yii-behavior-sluggable.SluggableBehavior',
				'columns' => array('name'),
				'unique' => true,
				'update' => true,
			),);
	}

	public function getDetailBySlug($slug)
	{
		$criteria = new CDbCriteria;
		$criteria->compare('t.slug', $slug);
		return GroupBanner::model()->find($criteria);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return GroupBanner the static model class
	 */
	public static function model($className = __CLASS__)
	{
		return parent::model($className);
	}

	public function nextOrderNumber()
	{
		return GroupBanner::model()->count() + 1;
	}

	public function beforeSave()
	{
		return TRUE;
	}

	public static function getActiveBanner($current_link)
	{
		$match = self::model()->escapeInput(trim($current_link, '/'));
		$models = self::model()->findAll(array(
			'condition' => 'display_in_url LIKE :match',
    		'params'    => array(':match' => "%$match%"),
    		'order' => 'id ASC'
		));
				
		if (!empty($models))
			return $models[0];
		return NULL;
	}

}
