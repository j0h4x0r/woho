<?php 
session_start();
$user = $_SESSION['user'];
include('conn.php');
if(isset($_GET['action']) && $_GET['action'] == 'get') {
	echo '<a id="newNoteHref" href="javascript:void(0);" onclick="showAddNote(1);">传小纸条</a>';
	echo '<div id="newNote" style="display:none">';
	echo '<div id="leftNewNote">';
	echo '<input type="text" readonly="readonly" id="newRecipient"/>';
	echo '<textarea id="noteTextArea" style="resize:none"></textarea>';
	echo '<button id="sendNoteBtn" onclick="addNote();">传小纸条</button>';
	echo '</div>';
	echo '<div id="rightNewNote"><select multiple="multiple" onchange="friendSelectChange(this);"></select></div>';
	echo '<a class="close" href="javascript:void(0);" onclick="showAddNote(0);">x</a>';
	echo '</div>';
	if($_GET['type'] == 'recv') {
		$result = mysql_query("SELECT * FROM note WHERE recipient='$user'
				ORDER BY time DESC", $conn);
		while($row = mysql_fetch_array($result)) {
			echo '<div class="note" id='.$row['id'].'>';
			$result2 = mysql_query("SELECT name FROM basic_info WHERE mail='".$row['sender']."'", $conn);
			$row2 = mysql_fetch_array($result2);
			echo '<div class="noteLeft">';
			echo '<div class="noteHref">来源 - <a href="space.php?mail='.$row['sender'].'">'.$row2['name'].'</a></div>';
			echo '<div class="noteTime">'.$row['time'].'</div>';
			echo '<a class="noteHref" href="javascript:void(0);" onclick="deleteNote(this);">删除</a>';
			echo '</div>';
			echo '<div class="noteContent">'.$row['content'].'</div>';
			echo '</div>';
		}
	} else {
		$result = mysql_query("SELECT * FROM note WHERE sender='$user'
				ORDER BY time DESC", $conn);
		while($row = mysql_fetch_array($result)) {
			echo '<div class="note" id='.$row['id'].'>';
			$result2 = mysql_query("SELECT name FROM basic_info WHERE mail='".$row['recipient']."'", $conn);
			$row2 = mysql_fetch_array($result2);
			echo '<div class="noteLeft">';
			echo '<div class="noteHref">去向 - <a href="space.php?mail='.$row['recipient'].'">'.$row2['name'].'</a></div>';
			echo '<div class="noteTime">'.$row['time'].'</div>';
			echo '<a class="noteHref" href="javascript:void(0);" onclick="deleteNote(this);">删除</a>';
			echo '</div>';
			echo '<div class="noteContent">'.$row['content'].'</div>';
			echo '</div>';
		}
	}
} else if(isset($_GET['action']) && $_GET['action'] == 'add') {
	$content = $_POST['content'];
	$recipient = $_POST['recipient'];
	if($result = mysql_query("INSERT INTO note(sender,recipient,time,content)
			VALUES('$user','$recipient',now(),'$content')")) {
		echo 'success';
	} else {
		echo 'fail';
	}
} else if(isset($_GET['action']) && $_GET['action'] == 'delete') {
	$id = $_POST['id'];
	if($result = mysql_query("DELETE FROM note where id='$id'")) {
		echo 'success';
	} else {
		echo 'fail';
	}
}
?>