<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Đố Vui</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css"  href="Cau_Do.css">
    </head>
    <body>
        <div class="content2">
            <h1>Đố Vui</h1>
            <div class="question">
                <p>yêu nhau cau sáu bổ ba</p>
                <p>ghét nhau cau sáu bổ ra làm mười</p>
                <p>mỗi người một miếng trăm người</p>
                <p>có mười bảy quả hỏi người ghét yêu</p>
                <p>hỏi có bao nhiêu người yêu nhau,ghét nhau?</p>
            </div>
            <div class="answer">
                <p>đáp án:</p>
                <ul>
                    <?php
                    //x: số người yêu nhau
                    //y: số người ghét nhau.
                    //3x+10y=100;(x<=30 y<=9)
                    //x+y=17;
                    for($x=1;$x<=30;$x++){
                        for($y=1;$y<=9;$y++){
                            if(3*$x+10*$y == 100  && $x + $y== 17){
                                echo " <li>$x người yêu nhau, $y người ghét nhau</li>";
                            }
                        }    
                    }
//                    echo "me oi";
                    ?>
                    
                </ul>
            </div>
        </div>
    </body>
</html>
