<?php
session_start();
$user = $_SESSION['user'];
include('conn.php');
if(isset($_GET) && $_GET['action'] == 'get') {
	$result = mysql_query("SELECT * FROM tweet WHERE author='$user'
			ORDER BY time DESC", $conn);
	while($row = mysql_fetch_array($result)) {
		echo '<div class="tweet" id='.$row['id'].'>';
		echo '<div class="tweetLeft">';
		echo '<div class="tweetTime">'.$row['time'].'</div>';
		echo '<a class="tweetHref" href="javascript:void(0);" onclick="comment(this);">评论</a>&nbsp;&nbsp;';
		echo '<a class="tweetHref" href="javascript:void(0);" onclick="deleteTweet(this);">删除</a>';
		echo '</div>';
		echo '<div class="tweetContent">'.$row['content'].'</div>';
		echo '<div class="commentList" style="display:none"></div>';
		echo '</div>';
	}
} else if(isset($_GET) && $_GET['action'] == 'add') {
	$content = $_POST['content'];
	$result = mysql_query("INSERT INTO tweet(time,author,content) 
			VALUES(now(),'$user', '$content')");
	if(isset($_POST['topic'])) {
		$topic = $_POST['topic'];
		$tweet = mysql_insert_id();
		$result = mysql_query("INSERT INTO topic_tweet_link(topic_id,tweet_id) 
				VALUES ($topic,$tweet)", $conn);
		}
	if($result) {
		echo 'success';
	} else {
		echo 'fail';
	}
} else if(isset($_GET) && $_GET['action'] == 'delete') {
	$id = $_POST['id'];
	if($result = mysql_query("DELETE FROM tweet where id='$id'")) {
		echo 'success';
	} else {
		echo 'fail';
	}
}
?>