<?php MyDebug::output(Yii::app()->user);
$a;
$a = 1;
echo $a."<br>";
$a = "abc";
echo $a."<br>";
$b;
$a="thu";
echo $a."<br>";
$chuoi="hoten";
echo "<h1> hello world <\h1>";
?>

<!--<form method="post" action="" id="" class="">   
    <label>Nhap vao a:</label> 
    <input value=<?php
MyDebug::output(Yii::app()->user);
$a;
$a = 1;
echo $a . "<br>";
$a = "abc";
echo $a . "<br>";
$b;
$a = "thu";
echo $a . "<br>";
$chuoi = "hoten";
?>

<form method="post" action="" id="" class="">   
    <label>Nhap vao a:</label> 
    <input value="<?php echo isset($_POST['a']) ? $_POST['a'] : ''; ?>" type="text" name="a">
    <br>
    <label>Nhap vao b:</label> 
        <input value="<?php echo isset($_POST['b']) ? $_POST['b'] : ''; ?>" type="text" name="b">
    <br>
    <label>Tong cua a + b:</label> 
<?php
echo isset($data['sum']) ? $data['sum'] : '';
?>
    
    <br>
    <input type="submit" value="Sumit" >
</form>





    <br>
    <input type="submit" value="Sumit" >
</form>-->




