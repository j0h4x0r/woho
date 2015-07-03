<?php
session_start();
if(!isset($_SESSION['login']) || $_SESSION['login'] == false) {
	header("Location:index.php");
}
$user = $_SESSION['user'];

include('conn.php');
if(isset($_GET['action']) && $_GET['action'] == 'add') {
	$name = $_POST['name'];
	$introduction = $_POST['introduction'];
	if($result = mysql_query("INSERT INTO topic(name,introduction,time) 
			VALUES('$name','$introduction',now())", $conn)) {
		echo 'success';
	} else {
		echo 'fail';
	}
	die(0);
} else if(isset($_GET['action']) && $_GET['action'] == 'get') {
	$id = $_GET['id'];
	$result = mysql_query("SELECT * FROM topic WHERE id=$id", $conn);
	if($row = mysql_fetch_array($result)) {
		echo '<script type="text/javascript">
				var oHead = document.getElementsByTagName("head")[0];
				var oScript = document.createElement("script");
				oScript.type = "text/javascript";
				oScript.src = "js/comment.js";
				oHead.appendChild(oScript);
			</script>';
		echo '<h1 id="tpcTitle">'.$row['name'].'</h1>';
		echo '<p>'.$row['introduction'].'</p><br><br>';
		echo '<div id="newTweet">';
		echo '<img src="img/tip.jpg" /><br>';
		echo '<textarea id="tweetTextArea" style="resize:none">#'.$row['name'].'#</textarea><br>';
		echo '</div>';
		echo '<button id="publish" onclick="publishTweet();">发布</button>';
		echo '<div id="tot">';
		$result2 = mysql_query("SELECT * FROM tweet WHERE id IN 
				(SELECT tweet_id FROM topic_tweet_link WHERE 
				topic_id=$id)", $conn);
		while($row2 = mysql_fetch_array($result2)) {
			echo '<div class="tweet" id='.$row2['id'].'>';
			$result3 = mysql_query("SELECT name FROM basic_info WHERE mail='".$row2['author']."'", $conn);
			$row3 = mysql_fetch_array($result3);
			echo '<div class="tweetLeft">';
			echo '<a href="space.php?mail='.$row2['author'].'">'.$row3['name'].'</a>';
			echo '<div class="tweetTime">'.$row2['time'].'</div>';
			echo '<a class="tweetHref" href="javascript:void(0);" onclick="comment(this);">评论</a>';
			echo '</div>';
			echo '<div class="tweetContent">'.$row2['content'].'</div>';
			echo '<div class="commentList" style="display:none"></div>';
			echo '</div>';
		}
		echo '<div id="tot">';
	}
	die(0);
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/tweet.css" />
<link type="text/css" rel="stylesheet" href="css/comment.css" />
<link type="text/css" rel="stylesheet" href="css/topic.css" />
<script type="text/javascript" src="js/ajax.js"></script>
<title>Woho - 群众视角</title>
</head>
<body>
	<div id="page">
	<a class="topHref" href="logout.php">注销</a>
	<a class="topHref" href="home.php">返回首页</a>
	<div id="topics">
		<?php 
		$result = mysql_query("SELECT id,name FROM topic ORDER BY time DESC", $conn);
		$count = 0;
		while($count < 20 && $row=mysql_fetch_array($result)) {
			if ($row['id'] % 3 == 0) {
				echo '<a href="#!/'.$row['id'].'"class="red">'.$row['name'].'</a>';
			} else if ($row['id'] % 3 == 1) {
				echo '<a href="#!/'.$row['id'].'"class="blue">'.$row['name'].'</a>';
			} else {
				echo '<a href="#!/'.$row['id'].'"class="yellow">'.$row['name'].'</a>';
			}
		}
		?>
	</div>
	<div id="rightSide">
		<a id="addTopicHref" href="javascript:void(0);" onclick="showAddTopic(1);">发起话题</a>
		<div id="newTopic" style="display: none">
        	<a class="close" href="javascript:void(0);" onclick="showAddTopic(0);">x</a>
			<p>标题</p><input id="newName" type="text"/>
			<p>简介</p><textarea id="topicTextArea" style="resize:none"></textarea>
			<button id="newTopicBtn" onclick="addTopic();">发起</button>
		</div>
		<div id="topicMain">
			<p>群众关注的焦点是什么？点击左边的云看看吧</p>
		</div>
	</div>
    </div>
	<script type="text/javascript" src="js/topic.js"></script>
</body>
</html>