<h1>We'll help you reset your password</h1>
<?php if (Yii::app()->user->hasFlash('msg')): ?>
    <div class="alert alert-success alert-dismissible" role="alert">
         <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
             <?php echo Yii::app()->user->getFlash('msg'); ?>
    </div>
<?php endif; ?>        
    <?php $form=$this->beginWidget('CActiveForm', array(
        'id'=>'forgot_password-form',
        'htmlOptions'=>array('class'=>'form-horizontal', 'role'=>'form'),
        'enableClientValidation'=>true,
        'clientOptions'=>array(
            'validateOnSubmit'=>true,
        ),
    )); ?>
  <div class="form-group">
    <?php echo $form->labelEx($model,'email', array('class'=>'col-sm-2 control-label')); ?>
    <div class="col-sm-6">
      <?php echo $form->textField($model,'email', array('class'=>'form-control','placeholder'=>'Email')); ?>
      <?php echo $form->error($model,'email'); ?>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-6">
      <button type="submit" class="btn2">Submit</button>
    </div>
  </div>
<?php $this->endWidget(); ?>


