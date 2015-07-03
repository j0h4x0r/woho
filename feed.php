<?php
session_start();
$user = $_SESSION['user'];
//$friend = array();
include('conn.php');
/*$result = mysql_query("select friend from relation where user='$user'", $conn);
while($row = mysql_fetch_array($result)) {
	array_push($friend, $row['friend']);
}*/
$result = mysql_query("SELECT * FROM tweet WHERE author 
		IN (SELECT friend FROM relation WHERE user='$user') 
		OR author='$user' ORDER BY time DESC", $conn);
while($row = mysql_fetch_array($result)) {
	echo '<div class="tweet" id='.$row['id'].'>';
	$result2 = mysql_query("SELECT name FROM basic_info WHERE mail='".$row['author']."'", $conn);
	$row2 = mysql_fetch_array($result2);
	echo '<div class="tweetLeft">';
	echo '<a href="space.php?mail='.$row['author'].'">'.$row2['name'].'</a>';
	echo '<div class="tweetTime">'.$row['time'].'</div>';
	echo '<a class="tweetHref" href="javascript:void(0);" onclick="comment(this);">评论</a>';
	echo '</div>';
	echo '<div class="tweetContent">'.$row['content'].'</div>';
	echo '<div class="commentList" style="display:none"></div>';
	echo '</div>';
}
?>