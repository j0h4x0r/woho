<?php
session_start();
if(!isset($_SESSION['login']) || $_SESSION['login'] == false) {
	//echo '<script type="text/javascript">location.href="home.php";</script>';
	header("Location:index.php");
}

$user = $_SESSION['user'];
include('conn.php');
if(isset($_GET['action']) && $_GET['action'] == 'getTopList') {
	$result = mysql_query("SELECT ratee,avg(score) avg_score FROM ratings GROUP BY ratee 
			ORDER BY avg_score DESC LIMIT 10", $conn);
	$count = 0;
	while($row = mysql_fetch_array($result)) {
		$count = $count + 1;
		$result2 = mysql_query("SELECT name FROM basic_info WHERE mail='".$row['ratee']."'", $conn);
		$row2 = mysql_fetch_array($result2);
        echo '<div class="listTerm">';
		echo $count.'&nbsp;&nbsp;';
		echo '<a href="space.php?mail='.$row['ratee'].'">'.$row2['name'].'</a>';
		echo '&nbsp;&nbsp;&nbsp;&nbsp;'.$row['avg_score'].'<br>';
        echo '</div>';
	}
	die(0);
} else if(isset($_GET['action']) && $_GET['action'] == 'add') {
	$content = $_POST['content'];
	$ratee = $_POST['ratee'];
	$score = $_POST['socre'];
	if($result = mysql_query("INSERT INTO ratings(ratee,rator,time,content,score)
			VALUES('$ratee','$user',now(),'$content',$score)", $conn)) {
		echo 'success';
	} else {
		echo 'fail';
	}
	die(0);
} else if(isset($_GET['action']) && $_GET['action'] == 'getFriends') {
	$result = mysql_query("SELECT friend,name FROM relation,basic_info 
			WHERE user='$user' AND relation.friend=basic_info.mail", $conn);
	while($row = mysql_fetch_array($result)) {
		echo '<a class="friendName" id="'.$row['friend'].'" href="javascript:void(0);" onclick="selectFriend(this);">'.$row['name'].'</a>';
		if($result2 = mysql_query("SELECT avg(score) avg_score FROM ratings WHERE ratee='".$row['friend']."'")) {
			if($row2 = mysql_fetch_array($result2))
				echo '&nbsp;&nbsp;&nbsp;&nbsp;------&nbsp;&nbsp;'.$row2['avg_score'].'<br>';
		} else {
			echo '&nbsp;&nbsp;&nbsp;&nbsp;------&nbsp;&nbsp;尚无评分';
		}
	}
	die(0);
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/rate.css" />
<script type="text/javascript" src="js/ajax.js"></script>
<title>Woho - <?php echo $_SESSION['name']?></title>
</head>
<body>
	<div id="page">
    <a class="topHref" href="home.php">返回首页</a>
	<a class="topHref" href="logout.php">注销</a>
	<div id="topList">
		<h2>排行榜</h2>
		<p>加载中...</p>
	</div>
	<div id="rateFriend">
		<p>给TA个评价吧！</p>
		<a id="choose" href="javascript:void(0);" onclick="showChoose(1);">选择好友</a><br>
		<div id="chooseFriend" style="display: none">
			<a class="close" href="javascript:void(0);" onclick="showChoose(0);">x</a><br>
		</div>
        <br>
		<div id="comment"> </div>
        <div id="n-star">
            <div id="star"></div>
        </div>
        <br>
		<textarea id="rateTextArea" style="resize:none"></textarea>
		<button id="publish" onclick="addRate();">评价</button>
	</div>
    </div>
	<script type="text/javascript" src="js/rate.js"></script>
</body>
</html>