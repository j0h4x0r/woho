<?php
session_start();
if(isset($_GET['action']) && $_GET['action'] == "addFriend") {
	$user = $_SESSION['user'];
	$friend = $_POST['mail'];
	if($user == $friend) {
		echo 'fail';
		die(0);
	}
	include('conn.php');
	$result = mysql_query("SELECT * FROM relation WHERE user='$user' 
			AND friend='$friend'", $conn);
	if($row = mysql_fetch_array($result)) {
		echo 'fail';
		die(0);
	}
	$result = mysql_query("INSERT INTO relation(user, friend) VALUES
							('$user','$friend')", $conn);
	if($result)
		echo 'success';
	else
		echo 'fail';
	die(0);
} else if(!isset($_GET['mail']) || $_GET['mail'] == "") {
	header("Location:home.php");
} else {
	include('conn.php');
	$user = $_GET['mail'];
	$result = mysql_query("SELECT * FROM user_info WHERE mail='$user'", $conn);
	$row = mysql_fetch_array($result);
	if(!$row) {
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
		echo '访问的页面不存在！<span id="second">3</span>秒后自动跳转到首页...';
		echo '<script language="javascript">CountDown(3, "index.php");</script>';
	}
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/space.css" />
<link type="text/css" rel="stylesheet" href="css/tweet.css" />
<link type="text/css" rel="stylesheet" href="css/comment.css" />
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/comment.js"></script>
<script type="text/javascript" src="js/space.js"></script>
<title>Woho - <?php echo $row['name'];?></title>
</head>
<body>
	<a class="topHref" href="home.php">返回首页</a>
	<a class="topHref" href="logout.php">注销</a>
	<h1><?php echo $row['name'];?></h1>
	<div id="profile">
    	<a href="javascript:void(0);" onclick="addFriend(<?php echo $row['mail'];?>);" >加为好友</a>
		<dl>
			<dt>性别</dt>
			<dd><?php echo ($row['sex'] == 1 ? '女' : '男');?></dd>
			<dt>生日</dt>
			<dd><?php echo ($row['birthday']);?></dd>
			<dt>电子邮件</dt>
			<dd><?php echo ($row['mail']);?></dd>
			<dt>地址</dt>
			<dd><?php echo ($row['address']);?></dd>
			<dt>电话</dt>
			<dd><?php echo ($row['phone']);?></dd>
			<dt>注册时间</dt>
			<dd><?php echo ($row['regist_time']);?></dd>
		</dl>
	</div>
	<div id="tweets">
		<?php 
		$result = mysql_query("SELECT * FROM tweet WHERE author='$user'
				ORDER BY time DESC", $conn);
		while($row = mysql_fetch_array($result)) {
			echo '<div class="tweet" id='.$row['id'].'>';
			echo '<div class="tweetLeft">';
			echo '<div class="tweetTime">'.$row['time'].'</div>';
			echo '<a class="tweetHref" href="javascript:void(0);" onclick="comment(this);">评论</a>';
			echo '</div>';
			echo '<div class="tweetContent">'.$row['content'].'</div>';
			echo '<div class="commentList" style="display:none"></div>';
			echo '</div>';
		}
		?>
	</div>
</body>
</html>