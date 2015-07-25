<title><?php echo CHtml::encode($this->pageTitle); ?></title>
<meta charset="utf-8" />
<meta name="copyright" content="<?php echo CHtml::encode($this->pageTitle); ?>" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" /> 

<link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/main.css" rel="stylesheet" media="screen" />
<link href="<?php echo Yii::app()->theme->baseUrl; ?>/admin/css/form.css" rel="stylesheet" media="screen" />
<link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/custom.css" rel="stylesheet" media="screen" />

<?php Yii::app()->getClientScript()->registerCoreScript('jquery');?>