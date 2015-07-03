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
<link type="text/css" rel="stylesheet" href="css/search.css" />
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/search.js"></script>
<title>Woho - <?php echo $_SESSION['name']?>
</title>
</head>
<body>
	<div id="page">
    <a class="topHref" href="logout.php">注销</a>
	<a class="topHref" href="home.php">返回首页</a>
	<h1>在这里寻找你的朋友</h1>
    <center>
	<form method="get" action="search.php">
		<input id="txt" type="text" name="q" />
        <input id="btn" type="submit" value="搜索" /><br>
	</form>
    </center>
	<br>
	<br>
	<?php 
	if(isset($_GET['q']) && $_GET['q'] != "") {
		$qword = $_GET['q'];
		include('conn.php');
		$result = mysql_query("SELECT * FROM user_info WHERE name LIKE '%$qword%'", $conn);
		if($result) {
			while($row = mysql_fetch_array($result)) {
				echo '<div class="item" id='.$row['mail'].'>';
				echo '<dl>';
				echo '<dt>昵称</dt>';
				echo '<dd><a href="space.php?mail='.$row['mail'].'">'.$row['name'].'</a></dd>';
				echo '<dt>性别</dt>';
				echo '<dd>'.($row['sex'] == 1 ? "女":"男").'</dd>';
				echo '<dt>地址</dt>';
				echo '<dd>'.$row['address'].'</dd>';
				echo '<a href="javascript:void(0);" onclick="addFriend(this);" >加为好友</a>';
				echo '</dl>';
				echo '</div>';
			}
		}
	}
	?>
    </div>
</body>
</html>
