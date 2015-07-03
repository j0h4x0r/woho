<?php
ini_set('date.timezone','Asia/Shanghai');
session_start();
/*
 * 页面跳转，倒计时
 */
$rediScript =
'<script language="javascript">
function CountDown(secs, url) {
second.innerHTML = secs;
if(secs-- > 0) {
setTimeout("CountDown(" + secs + ",\"" + url + "\")", 1000);
} else {
location.href = url;
}
}
</script>';
if(isset($_SESSION['login']) && $_SESSION['login'] == true) {
	echo $rediScript;
	echo '非法访问！<span id="second">3</span>秒后自动跳转到登录页面...';
	echo '<script language="javascript">CountDown(3, "index.php");</script>';
	die();
}else if (isset($_POST['mail'])) {
	if ($_POST['mail'] !='' && $_POST['mail'] != "输入注册邮箱" ) {
		include 'conn.php';
		$mail = $_POST['mail'];
		$password = $_POST['password'];
		$showtime=date("Y-m-d H:i:s");
		$name = $_POST['name'];
		$string = "INSERT INTO user_info(mail, name, password, regist_time) VALUES ('".$mail."', '".$name."', '".$password."', '".$showtime."')";
		$result = mysql_query($string, $conn);	 
		if ($result) {
			echo $rediScript;
			echo '注册成功！<span id="second">3</span>秒后自动跳转到登录页面...';
			echo '<script language="javascript">CountDown(3, "index.php");</script>';
	//		header("Location:index.php");
		} else {
			echo $rediScript;
			echo '此邮箱已注册，注册失败，请到登陆界面登陆或修改注册邮箱。<span id="second">3</span>秒后自动跳转到首页...';
			echo '<script language="javascript">CountDown(3, "index.php");</script>';
		}
		mysql_close($conn);
	}
} 
?>


