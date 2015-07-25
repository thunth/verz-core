<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title"><span class="<?php echo $model->isNewRecord ? $this->iconCreate : $this->iconEdit; ?>"></span> <?php echo $model->isNewRecord ? 'Create' : 'Update'; ?> <?php echo $this->singleTitle ?></h3>
	</div>
	<div class="panel-body">
		<div class="form">
			<?php
			$form = $this->beginWidget('CActiveForm', array(
				'id' => 'news-category-form',
				'enableAjaxValidation' => false,
				'htmlOptions' => array('class' => 'form-horizontal', 'role' => 'form'),
			));
			?>
			<div class='form-group form-group-sm'>
				<?php echo $form->labelEx($model, 'category_name', array('class' => 'col-sm-1 control-label')); ?>
				<div class="col-sm-3">
					<?php echo $form->textField($model, 'category_name', array('class' => 'form-control', 'maxlength' => 255)); ?>
					<?php echo $form->error($model, 'category_name'); ?>
				</div>
			</div>
			<div class="form-group form-group-sm">
				<?php echo $form->labelEx($model,'parent_id', array('class' => 'col-sm-1 control-label')); ?>
				<div class="col-sm-3">
					<?php echo $form->dropDownList($model, 'parent_id', $model->categoryDropdownBackend(), array('empty' => '--Root--', 'class' => 'form-control')); ?>
					<?php echo $form->error($model,'parent_id'); ?>
				</div>
			</div>
			<div class='form-group form-group-sm'>
				<?php echo $form->labelEx($model, 'display_order', array('class' => 'col-sm-1 control-label')); ?>
				<div class="col-sm-3">
					<?php echo $form->textField($model, 'display_order', array('class' => 'form-control', 'maxlength' => 255)); ?>
					<?php echo $form->error($model, 'display_order'); ?>
				</div>
			</div>

			<div class='form-group form-group-sm'>
				<?php echo $form->labelEx($model, 'status', array('class' => 'col-sm-1 control-label')); ?>
				<div class="col-sm-3">
					<?php echo $form->dropDownList($model, 'status', $model->optionActive, array('class' => 'form-control')); ?>
					<?php echo $form->error($model, 'status'); ?>
				</div>
			</div>


			<div class="clr"></div>
			<div class="well">
				<?php echo $form->hiddenField($model, 'type', array('value'=>$model->categoryType));?>
				<?php echo CHtml::htmlButton($model->isNewRecord ? '<span class="' . $this->iconCreate . '"></span> Create' : '<span class="' . $this->iconSave . '"></span> Save', array('class' => 'btn btn-primary', 'type' => 'submit')); ?> &nbsp;  
				<?php echo CHtml::htmlButton('<span class="' . $this->iconCancel . '"></span> Cancel', array('class' => 'btn btn-default', 'onclick' => 'javascript: location.href=\'' . $this->baseControllerIndexUrl() . '\'')); ?>
			</div>
		<?php $this->endWidget(); ?>
		</div>
	</div>
</div>