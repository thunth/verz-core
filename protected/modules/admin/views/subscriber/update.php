<?php
$this->breadcrumbs=array(
	'Subscriber Management'=>array('index'),
	$model->email,
	'Update Subscriber',
);

$menus=array(
	array('label'=>'Subscriber Management', 'url'=>array('index')),
	array('label'=>'Create Subscriber', 'url'=>array('create')),
);
$this->menu= ControllerActionsName::createMenusRoles($menus, $actions);

?>

<h1>Update Subscriber [<?php echo $model->email; ?>]</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>