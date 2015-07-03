<?php
session_start();
if(isset($_SESSION['login']) && $_SESSION['login'] == true) {
	//echo '<script type="text/javascript">location.href="home.php";</script>';
	header("Location:home.php");
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/index.css" />
<title>Woho - 惊讶！好奇！乐趣！</title>
</head>
<body>
	<div id="page">
    	<div id="top">
    		<h1>Woho</h1>
        	<p>Woho是一个小型的社交网站，你可以在这发表你的看法，找到朋友</p>
        </div>
        <div id="divf1">
		<form id="form1" method="post" action="login.php" onsubmit="return InputChk(this)">
        	<span id="errorMsg" style="display:none">请输入合法的账号和密码</span><br>
			<label for="mail">账号</label>
			<input type="text" name="mail" id="mail"/><br>
			<label for="password">密码</label>
			<input type="password" name="password" id="password"/><br>
			<input type="submit" name="submit" id="login" value="登录"/>
		</form>
        </div>
        <div id="divf2">
        <form id="form2" method="post" action="register.php">
			<label for="mailr">输入账号</label>
			<input type="text" name="mail" id="mailr"/><br>
			<label for="namer">注册姓名</label>
			<input type="text" name="name" id="namer"/><br>
			<label for="passwordr">输入密码</label>
			<input type="password" name="password" id="passwordr"/> <br>
			<label for="check_passwordr">再次输入</label>
			<input type="password" name="check_password" id="check_passwordr"> <br>
			<input type="button" name="register" id="register" value="注册" onclick="reg();"/>
		</form>
        </div>
    </div>
	<script src="js/login.js" type="text/javascript"></script>
    <script src="js/register.js" type="text/javascript"></script>
</body>
</html>