<div class="container">
    <div class="breadcrumb"><a href="<?php echo yii::app()->createAbsoluteUrl('')?>">Home</a> / <?php echo $model->title?></div>
    <div class="row">
        <div class="col-sm-9">
            <h1 class="title-page"><?php echo $model->title?></h1>
            <?php echo $model->content;?>
        </div>
        <!--right menu-->
        <div class="col-sm-3">
            <div class="clearfix"><a href="<?php echo yii::app()->createAbsoluteUrl('site/index')?>" class="back">Back to Home</a></div>
            <div class=""><a href="<?php echo yii::app()->createAbsoluteUrl('site/register')?>" class="btn-2">register now</a></div>
        </div>
        <!--right menu-->

    </div>

</div>
