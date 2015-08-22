<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Image Gallery</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="Do_While.css">
    </head>
    <body>
        <div class="content1">
            <h1>Image Gallery</h1>
            <div class="image">
                <?php
                $i=1;
                do{
                    echo'<img src="Image/0'.$i.'.jpg"/>';
                    $flagshow=0;
                    if(isset($_GET["show"])){
                       $flagshow=$_GET["show"];
                       $i++;
                    }
                }
                while($i<=5 && flagshow==1);
                ?>
                
                <!--<img src="Image/02.jpg"/>-->
                <!--<img src="Image/03.jpg"/>-->
                <img src="Image/04.jpg"/>
                <img src="Image/05.jpg"/>
                <!--<img src="Image/06.jpg"/>-->
                <!--<img src="Image/07.jpg"/>-->
                <a href="Do_While.php?show=1">show all</a>
            </div>
        </div>
        
    </body>
</html>

