<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="robots" content="noindex" />
        <meta name="googlebot" content="noindex" />
        <title><?php echo CHtml::encode($this->pageTitle) . ' - ' . Yii::app()->params['projectName'] . ' Admin'; ?></title>
		
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Admin panel developed with the Bootstrap from Twitter.">
        <meta name="author" content="travis">

        <link href="<?php echo Yii::app()->theme->baseUrl; ?>/admin/css/jquery-ui-1.8.18.custom.css" type=text/css rel=stylesheet>
        <link href="<?php echo Yii::app()->theme->baseUrl; ?>/admin/css/bootstrap.css" rel="stylesheet">
        <link href="<?php echo Yii::app()->theme->baseUrl; ?>/admin/css/site.css" rel="stylesheet">
		<link href="<?php echo Yii::app()->theme->baseUrl; ?>/admin/css/multiple-select.css" rel="stylesheet">
        <link href="<?php echo Yii::app()->theme->baseUrl; ?>/admin/css/bootstrap-responsive.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/admin/css/form.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/admin/css/nestable.css" />
		<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/admin/css/chosen.css" />
		<!-- <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/admin/css/jquery.fileupload.css" /> -->
		
		
    </head>
    <body>
        <div class="navbar">
            <div class="navbar-inner">
				<div class="container-fluid">
					<a class="brand" href="<?php echo Yii::app()->createAbsoluteUrl('admin/site/index'); ?>"><?php echo Yii::app()->params['projectName'];?></a>
					<?php if (isset(Yii::app()->user->id)): ?>
					<div class="btn-group pull-right loginas">
						<a class="btn btn-danger" href="<?php echo Yii::app()->createAbsoluteUrl('admin/site/update_my_profile'); ?>"><i class="icon-user"></i> <?php echo Yii::app()->user->name; ?></a>
						<a class="btn btn-danger dropdown-toggle" data-toggle="dropdown" href="#">
							<span class="caret"></span>
						</a>
						
						<ul class="dropdown-menu">
							<li><a href="<?php echo Yii::app()->createAbsoluteUrl('admin/site/update_my_profile'); ?>">Profile</a></li>
							<li class="divider"></li>
							<li><a href="<?php echo Yii::app()->createAbsoluteUrl('admin/site/change_my_password'); ?>">Change password</a></li>
							<li class="divider"></li>
							<li><a href="<?php echo Yii::app()->createAbsoluteUrl('admin/site/logout'); ?>">Logout</a></li>
						</ul>
					</div>
					<div class="welcome">Welcome </div>
				<?php endif; ?>
				</div>
				<div class="clr"></div>
				<?php if (isset(Yii::app()->user->id)): ?>
				<div class="nav-collapse">
					<?php
					$menu = new ShowAdminMenu();
					echo $menu->showMenu();
					?>
				</div>
				<?php else: ?>
				<div class="nav-collapse">&nbsp;</div>
				<?php endif;?>
            </div>
        </div>
        <div class="clr"></div>
        <div class="container-fluid">
            <div class="row-fluid">
				<?php if (isset($this->breadcrumbs)): ?>
					<?php
					$this->widget('ext.CBreadcrumbs.Cbreadcrumbs', array(
						'links' => $this->breadcrumbs,
					));
					?><!-- breadcrumbs -->
<?php endif ?>
<?php echo $content; ?>
            </div>

        </div>
		<footer class="footer">
			Copyright &copy; <?php echo date('Y'); ?> <a href="<?php echo Yii::app()->createAbsoluteUrl('/'); ?>"><?php echo Yii::app()->params['projectName'];?></a> <br/>
			Execution Time: <?php 
			$log = new CLogger();
			echo round($log->getExecutionTime(),3);?> sec | 
			Memory Usage: <?php echo round($log->getMemoryUsage()/1048576,2);?> mb
		</footer>
		
		<?php Yii::app()->getClientScript()->registerCoreScript('jquery'); ?>
		<?php Yii::app()->clientScript->registerCoreScript('jquery.ui'); ?>
        <script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/menu/jquery.nestable.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/jquery.multiple.select.js"></script>
		<script type="text/javascript" src="<?php echo Yii::app()->baseUrl . '/resources/ckeditor/ckeditor.js'; ?>"></script>
        <script type="text/javascript" src="<?php echo Yii::app()->theme->baseUrl . '/admin/js/jquery-ui-timepicker-addon.js'; ?>"></script>
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/bootstrap.min.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/bootstrap.file-input.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/bootbox.min.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/chosen.jquery.min.js"></script>
        <script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/custom.js"></script>
		<!-- <script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/vendor/jquery.ui.widget.js"></script> -->
		<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
		<!-- <script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/jquery.iframe-transport.js"></script> -->
		<!-- The basic File Upload plugin -->
		<!-- <script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/jquery.fileupload.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/jquery.fileupload-process.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/jquery.fileupload-image.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/jquery.fileupload-audio.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/jquery.fileupload-video.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/jquery.fileupload-validate.js"></script>
		<script src="<?php echo Yii::app()->theme->baseUrl; ?>/admin/js/jquery.fileupload-ui.js"></script> -->
		<script type="text/javascript" src="<?php echo Yii::app()->theme->baseUrl.'/admin/js/gii.js';?>"></script>
		<script type="text/javascript">
			//set class my-editor-basic for basic
			//set class my-editor-full for full toolbars
			$(document).ready(function() {
				runEditorBasic('<?php echo Yii::app()->baseUrl; ?>/resources/', <?php echo Yii::app()->params['ckeditor_basic']; ?>, '100%', 150);
				runEditorFull('<?php echo Yii::app()->baseUrl; ?>/resources/', <?php echo Yii::app()->params['ckeditor_full']; ?>, '100%', 250);
				runDatePicker('<?php echo Yii::app()->theme->baseUrl; ?>');
				runTimePicker('<?php echo Yii::app()->theme->baseUrl; ?>');
				runDateTimePicker('<?php echo Yii::app()->theme->baseUrl; ?>');
				validateNumber();
			});
			
//			$(function () {
//				'use strict';
//				// Change this to the location of your server-side upload handler:
//				var url = window.location.hostname === 'blueimp.github.io' ?
//							'//jquery-file-upload.appspot.com/' : 'server/php/';
//				$('#fileupload').fileupload({
//					url: url,
//					dataType: 'json',
//					done: function (e, data) {
//						$.each(data.result.files, function (index, file) {
//							$('<p/>').text(file.name).appendTo('#files');
//						});
//					},
//					progressall: function (e, data) {
//						var progress = parseInt(data.loaded / data.total * 100, 10);
//						$('#progress .progress-bar').css(
//							'width',
//							progress + '%'
//						);
//					}
//				}).prop('disabled', !$.support.fileInput)
//					.parent().addClass($.support.fileInput ? undefined : 'disabled');
//			});
        </script>
		
		<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td>
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn btn-primary start" disabled>
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Start</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <td>
            <span class="preview">
                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td>
        <td>
            <p class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
        </td>
        <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td>
            {% if (file.deleteUrl) { %}
                <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>Delete</span>
                </button>
                <input type="checkbox" name="delete" value="1" class="toggle">
            {% } else { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>

    </body>
</html>




