<div class="form">
<?php
$form = $this->beginWidget('CActiveForm', array(
    'id' => 'users-form',
    'enableAjaxValidation' => false,
    'htmlOptions' => array('class' => 'form-horizontal', 'role' => 'form', 'enctype' => 'multipart/form-data'),
        ));
?>
    <!--iiuij-->
<div class="form">
<div class='form-group form-group-sm'>
    <?php echo $form->labelEx($model, 'username', array('class' => 'col-sm-1 control-label')); ?>
    <div class="col-sm-3">
        <?php echo $form->textField($model, 'username', array('class' => 'form-control', 'maxlength' => 255)); ?>
        <?php echo $form->error($model, 'username'); ?>
    </div>
</div>
<div class="form-group form-group-sm">
    <?php echo $form->labelEx($model, 'temp_password', array('class' => "col-sm-1 control-label")); ?>
    <div class="col-sm-3">
        <?php echo $form->passwordField($model, 'temp_password', array('size' => 47, 'maxlength' => 30, 'value' => '', 'class' => "form-control")); ?>
        <?php echo $form->error($model, 'temp_password'); ?>
    </div>
</div>
<div class='form-group form-group-sm'>
    <?php echo $form->labelEx($model, 'email', array('class' => 'col-sm-1 control-label')); ?>
    <div class="col-sm-3">
        <?php echo $form->textField($model, 'email', array('class' => 'form-control', 'maxlength' => 255)); ?>
        <?php echo $form->error($model, 'email'); ?>
    </div>
</div>



 <div class="clr"></div>
<div class="well">
    <?php echo CHtml::htmlButton($model->isNewRecord ? '<span class="' . $this->iconCreate . '"></span> Create' : '<span class="' . $this->iconSave . '"></span> Save', array('class' => 'btn btn-primary', 'type' => 'submit')); ?> &nbsp;  
    <?php echo CHtml::htmlButton('<span class="' . $this->iconCancel . '"></span> Cancel', array('class' => 'btn btn-default', 'onclick' => 'javascript: location.href=\'' . $this->baseControllerIndexUrl() . '\'')); ?>
</div>
<?php $this->endWidget(); ?>
</div>
