<?php
session_start();
$user = $_SESSION['user'];
include('conn.php');
if(isset($_GET['action']) && $_GET['action'] == 'get') {
	$tweet_id = $_GET['id'];
	$result = mysql_query("SELECT author FROM tweet WHERE id='$tweet_id'", $conn);
	$row = mysql_fetch_array($result);
	if($row['author'] == $user)
		$flag = true;
	else
		$flag = false;
	$result = mysql_query("SELECT * FROM comment WHERE tweet_id='$tweet_id' 
			ORDER BY time DESC", $conn);
	echo '<textarea class="commentArea"></textarea><br>';
	echo '<button class="addCommentButton" onclick="addComment(this);">评论</button>';
	while($row = mysql_fetch_array($result)) {
		echo '<div class="comment" id=comment-'.$row['id'].'>';
		$result2 = mysql_query("SELECT name FROM basic_info WHERE mail='".$row['commentor']."'", $conn);
		$row2 = mysql_fetch_array($result2);
		echo '<div class="commentLeft">';
		echo '<a href="space.php?mail='.$row['commentor'].'">'.$row2['name'].'</a>';
		echo '<div class="commentTime">'.$row['time'].'</div>';
		if($flag)
			echo '<a class="commentHref" href="javascript:void(0);" onclick="deleteComment(this);">删除</a>';
		echo '</div>';
		echo '<div class="commentContent">'.$row['content'].'</div>';
		echo '</div>';
	}
} else if(isset($_GET['action']) && $_GET['action'] == 'add') {
	$tweet_id = $_POST['id'];
	$content = $_POST['content'];
	if($result = mysql_query("INSERT INTO comment(time,content,tweet_id,commentor)
			VALUES(now(),'$content','$tweet_id','$user')", $conn)) {
		echo 'success';
	} else {
		echo 'fail';
	}
} else if(isset($_GET['action']) && $_GET['action'] == 'delete') {
	$comment_id = $_POST['id'];
	if($result = mysql_query("DELETE FROM comment WHERE id='$comment_id'", $conn)) {
		echo 'success';
	} else {
		echo 'fail';
	}
}

?>