<?php
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
echo $rediScript;
if(!isset($_POST['submit'])) {
	echo '非法访问！<span id="second">3</span>秒后自动跳转到登录页面...';
	echo '<script language="javascript">CountDown(3, "index.php");</script>';
} else {
	$mail = $_POST['mail'];
	$password = $_POST['password'];
	include('conn.php');
	$result = mysql_query("select password,name from user_info where mail = '$mail'", $conn);
	if($row = mysql_fetch_array($result)) {
		if($row['password'] == $password) {
			session_start();
			$_SESSION['user'] = $mail;
			$_SESSION['name'] = $row['name'];
			$_SESSION['login'] = true;
			header("Location:home.php");
		} else {
			echo '用户名或密码错误！<span id="second">3</span>秒后自动跳转到登录页面...';
			echo '<script language="javascript">CountDown(3, "index.php");</script>';
		}
	} else {
		echo '用户名不存在！<span id="second">3</span>秒后自动跳转到登录页面...';
		echo '<script language="javascript">CountDown(3, "index.php");</script>';
	}
}
?>