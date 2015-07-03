<?php
session_start();
if(!isset($_SESSION['login']) || $_SESSION['login'] == false) {
	//echo '<script type="text/javascript">location.href="home.php";</script>';
	header("Location:index.php");
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/home.css" />
<link type="text/css" rel="stylesheet" href="css/comment.css" />
<link type="text/css" rel="stylesheet" href="css/tweet.css" />
<link type="text/css" rel="stylesheet" href="css/note.css" />
<link type="text/css" rel="stylesheet" href="css/profile.css" />
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/comment.js"></script>
<title>Woho - <?php echo $_SESSION['name']?></title>
</head>
<body>
<div id="page">
	<a class="topHref" href="logout.php">注销</a>
	<div id="navBar">
		<a href="#!/feed" class="pBar">首页</a><br>
		<a href="#!/tweet" class="pBar">我的碎碎念</a><br>
		<a href="javascript:void(0);" class="pBar" id="noteBar">小纸条</a><br>
		<div class="cNavBar" id="noteCBar">
			<a href="#!/note?recv" class="cBar">收到的小纸条</a><br>
			<a href="#!/note?send" class="cBar">传出的小纸条</a><br>
		</div>
		<a href="#!/profile" class="pBar">个人资料</a><br>
		<a href="topic.php" class="pBar">群众视角</a><br>
		<a href="rate.php" class="pBar">好友评价</a><br>
		<a href="paperplane.php" class="pBar">纸飞机</a><br>
		<a href="search.php" class="pBar">找朋友</a><br>
	</div>
	<div id="rightSide">
    	<div id="pubTweet">
        	<img src="img/tip.jpg" />
			<textarea id="tweetTextArea"></textarea><br>
			<button id="publish">发布</button>
        </div>
		<div id="main">
		
		</div>
	</div>
</div>
	<script type="text/javascript" src="js/home.js"></script>
</body>
</html>