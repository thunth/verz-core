<?php
$this->breadcrumbs=array(
	'Newsletter Management'
);

$menus=array(
	array('label'=>'Create Newsletter', 'url'=>array('create')),
);
$this->menu= ControllerActionsName::createMenusRoles($menus, $actions);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('newsletter-grid', {
		data: $(this).serialize()
	});
	return false;
});
");

?>

<h1>Newsletter Management</h1>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'newsletter-grid',
	'dataProvider'=>$model->search(),
	'columns'=>array(
        array(
            'header' => 'S/N',
            'type' => 'raw',
            'value' => '$this->grid->dataProvider->pagination->currentPage * $this->grid->dataProvider->pagination->pageSize + ($row+1)',
            'headerHtmlOptions' => array('width' => '30px','style' => 'text-align:center;'),
            'htmlOptions' => array('style' => 'text-align:center;')
        ),
		'subject',
//		'content:html',
        'created_time:datetime',
        'send_time:datetime',
        array(
            'name'=>'total_subscriber',
            'value'=>'$data->total_subscriber',
            'htmlOptions' => array('style' => 'text-align:center;')
        ),            
        array(
            'name'=>'total_sent',
            'value'=>'$data->total_sent',
            'htmlOptions' => array('style' => 'text-align:center;')
        ),            
        array(
            'name'=>'total_read',
            'value'=>'count($data->newsletter_tracking)',
            'htmlOptions' => array('style' => 'text-align:center;')
        ),            
        array(
            'name'=>'Sent',
            'value'=>'($data->countRemain() == 0)?"Yes":"No"',
        ),
		array(
			'class'=>'CButtonColumn',
			'template'=> ControllerActionsName::createIndexButtonRoles($actions),
                        //'template' => '($data->status==1)? {view} {update}:{view} {update} {delete}',
                        'buttons'=>array(
                            'update'=>array('visible'=>'$data->countRemain() != 0',),
                        ),
		),
	),
));


?>
