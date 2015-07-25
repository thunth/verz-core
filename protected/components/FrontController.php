<?php
/**
 * Controller is the customized base controller class.
 * All controller classes for this application should extend from this base class.
 */
class FrontController extends _BaseController
{
	/**
	 * @var string the default layout for the controller view. Defaults to '//layouts/column1',
	 * meaning using a single column layout. See 'protected/views/layouts/column1.php'.
	 */
	public $layout='//layouts/site';
	/**
	 * @var array context menu items. This property will be assigned to {@link CMenu::items}.
	 */
	public $menu=array();
	/**
	 * @var array the breadcrumbs of the current page. The value of this property will
	 * be assigned to {@link CBreadcrumbs::links}. Please refer to {@link CBreadcrumbs::links}
	 * for more details on how to specify this property.
	 */
	 
	 
	public $breadcrumbs=array();
	
	public $_metaKeyword;
	public $pageHeader;
	public $_metaDescription;
    public static $activedPage;
    public $searchKey;

    public function init(){

        // register class paths for extension captcha extended
        Yii::$classMap = array_merge( Yii::$classMap, array(
            'CaptchaExtendedAction' => Yii::getPathOfAlias('ext.captchaExtended').DIRECTORY_SEPARATOR.'CaptchaExtendedAction.php',
            'CaptchaExtendedValidator' => Yii::getPathOfAlias('ext.captchaExtended').DIRECTORY_SEPARATOR.'CaptchaExtendedValidator.php'
        ));
    }
    
	public function getMetaKeywords()
	{
		if(!empty($this->_metaKeyword))
			return $this->_metaKeyword;
		else
		{
			return Yii::app()->params['meta_keywords'];
		}
	}
	
	public function setMetaKeywords($value)
	{
		$this->_metaKeyword=$value;
	}
	
	public function getMetaDescription()
	{
		if(!empty($this->_metaDescription))
			return $this->_metaDescription;
		else
		{
			return Yii::app()->params['meta_description'];
		}
	}
	
	public function setMetaDescription($value)
	{
		$this->_metaDescription=$value;
	}
        
    public function gotoPage($page_id){
        $pageM = Page::getSlugById($page_id);
        if(!empty($pageM)){
            $pageSlug = $pageM->slug;
            $this->redirect(Yii::app()->createAbsoluteUrl('/'.$pageSlug));
        }else
            throw new CHttpException(400, 'Invalid request. Please do not repeat this request again.');

    }
}

?>