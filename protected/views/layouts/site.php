<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
     <?php include_once '_head.php';?>
</head>

<body>
    <div id="page">
        <header id="branding" role="banner">
            <?php include_once '_header.php';?>
        </header>
        <div id="main">
            <section id="primary">
                <div id="content" role="main">
                    <?php echo $content; ?>
                    
                </div>                
            </section>
            <div id="secondary" class="widget-area" role="complementary">
                <div>
                    <?php //$this->widget('SearchWidget'); ?>
                    <br/>
                    <?php if(!isset(Yii::app()->user->id)) {?>
                    <p>Login</p>
                    <p><a href="<?php echo yii::app()->createAbsoluteUrl('site/login')?>">Login page</a></p>
                    <p>Register</p>
                    <p><a href="<?php echo Yii::app()->createAbsoluteUrl('site/register'); ?>">Basic Register</a></p>
                    <p>FORGOT PASSWORD</p>
                    <p><a href="<?php echo Yii::app()->createAbsoluteUrl('site/forgotPassword'); ?>">Forgot password</a></p>
                    <?php }else {?>
                    <p>Logout</p>
                    <p><a href="<?php echo yii::app()->createAbsoluteUrl('site/logout')?>">Logout</a></p>
                    <p>PROFILE</p>
                    <p><a href="<?php echo Yii::app()->createAbsoluteUrl('member/site/updateProfile'); ?>">Profile</a></p>
                    <p>CHANGE PASSWORD</p>
                    <p><a href="<?php echo Yii::app()->createAbsoluteUrl('member/site/changePassword'); ?>">Change password</a></p>
                    <?php } ?>
                </div>
            </div>
        </div>
        <footer class="footer-container">
            <?php include_once '_footer.php';?>
        </footer>
    </div>
</body>

</html>