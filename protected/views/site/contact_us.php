<h1 class="title">Contact Us</h1>

    <?php $form=$this->beginWidget('CActiveForm', array(
        'id'=>'contact-us-form',
        'htmlOptions'=>array('class'=>'form-horizontal', 'role'=>'form'),
        'enableClientValidation' => true,
        'enableAjaxValidation' => false,
        'clientOptions' => array(
            'validateOnSubmit' => true,
        ),
    )); ?>

<?php if (Yii::app()->user->hasFlash('msg')): ?>
    <div class="alert alert-success alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <?php echo Yii::app()->user->getFlash('msg'); ?>
    </div>
<?php endif; ?> 


<div class="form-group">
    <?php echo $form->labelEx($model,'name', array('class'=>'col-sm-3 control-label')); ?>
    <div class="col-sm-6">
      <?php echo $form->textField($model,'name', array('class'=>'form-control')); ?>
      <?php echo $form->error($model,'name'); ?>
    </div>
  </div>
<div class="form-group">
    <?php echo $form->labelEx($model,'email', array('class'=>'col-sm-3 control-label')); ?>
    <div class="col-sm-6">
      <?php echo $form->textField($model,'email', array('class'=>'form-control')); ?>
      <?php echo $form->error($model,'email'); ?>
    </div>
  </div>
<div class="form-group">
    <?php echo $form->labelEx($model,'phone', array('class'=>'col-sm-3 control-label')); ?>
    <div class="col-sm-6">
      <?php echo $form->textField($model,'phone', array('class'=>'form-control')); ?>
      <?php echo $form->error($model,'phone'); ?>
    </div>
  </div>
<div class="form-group">
    <?php echo $form->labelEx($model,'message', array('class'=>'col-sm-3 control-label')); ?>
    <div class="col-sm-6">
      <?php echo $form->textArea($model,'message', array('class'=>'form-control')); ?>
      <?php echo $form->error($model,'message'); ?>
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-6">
      <button type="submit" class="btn2">Save</button>
    </div>
  </div>

    <?php $this->endWidget(); ?>