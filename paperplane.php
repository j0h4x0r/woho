<?php
session_start();
if(!isset($_SESSION['login']) || $_SESSION['login'] == false) {
	//echo '<script type="text/javascript">location.href="home.php";</script>';
	header("Location:index.php");
}
$user = $_SESSION['user'];

include('conn.php');
if(isset($_GET['action']) && $_GET['action'] == 'add') {
	$content = $_POST['content'];
	if(mysql_query("INSERT INTO paper_plane(content,sender) 
			VALUES ('$content','$user')", $conn)) {
		$id = mysql_insert_id();
		$result = mysql_query("SELECT * FROM (SELECT mail,name
				FROM basic_info,relation WHERE relation.friend=basic_info.mail
				AND relation.user='$user') friends ORDER BY rand() LIMIT 1", $conn);
		if($row = mysql_fetch_array($result)) {
			$result = mysql_query("INSERT INTO paper_plane_path(paper_plane_id,recv_user,time)
					VALUES($id,'".$row['mail']."',now())", $conn);
				if($result)
					echo 'success';
				else
					echo 'fail';
		} else {
			echo 'fail';
		}
	} else {
		echo 'fail';
	}
	die(0);
} else if(isset($_GET['action']) && $_GET['action'] == 'getPath') {
	$id = $_POST['id'];
	$result = mysql_query("SELECT mail,name,time FROM basic_info,paper_plane_path 
			WHERE basic_info.mail=paper_plane_path.recv_user AND 
			paper_plane_id=$id ORDER BY paper_plane_path.time", $conn);
	while($row = mysql_fetch_array($result)) {
		echo '-->';
		echo '<a href="space.php?mail='.$row['mail'].'">'.$row['name'].'</a>';
	}
	die(0);
	
} else if(isset($_GET['action']) && $_GET['action'] == 'pushPath') {
	$result = mysql_query("SELECT * FROM (SELECT mail,name 
			FROM basic_info,relation WHERE relation.friend=basic_info.mail 
			AND relation.user='$user') friends ORDER BY rand() LIMIT 1", $conn);
	if($row = mysql_fetch_array($result)) {
		$id = $_POST['id'];
		$result = mysql_query("INSERT INTO paper_plane_path(paper_plane_id,recv_user,time) 
				VALUES($id,'".$row['mail']."',now())", $conn);
		if($result)
			echo 'success-'.$row['name'];
		else
			echo 'fail';
	} else {
		echo 'fail';
	}
	die(0);
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/paperplane.css" />
<script type="text/javascript" src="js/ajax.js"></script>
<title>Woho - 纸飞机</title>
</head>
<body>
	<div id="page">
	<a class="topHref" href="logout.php">注销</a>
	<a class="topHref" href="home.php">返回首页</a>
    <h1>纸飞机</h1>
    <p>童年的纸飞机，最后终于回到我手里……</p>
	<a id="ppHref" href="javascript:void(0);" onclick="showAddPp(1);">扔飞机</a>
	<div id="newPp" style="display:none">
		<a class="close" href="javascript:void(0);" onclick="showAddPp(0);">x</a>
		<textarea id="ppTextArea" style="resize:none"></textarea>
		<button id="sendPpBtn" onclick="addPp();">扔飞机</button>
	</div>
	<div id="main">
		<p>收到的纸飞机：</p>
		<?php 
		$result = mysql_query("SELECT * FROM (SELECT * FROM paper_plane_path 
						ORDER BY time DESC) tmp GROUP BY paper_plane_id", $conn);
		while($row = mysql_fetch_array($result)) {
			if($row['recv_user'] == $user) {
				echo '<div class="pp" id='.$row['paper_plane_id'].'>';
				$result2 = mysql_query("SELECT * FROM paper_plane WHERE id="
									.$row['paper_plane_id'], $conn);
				if($row2 = mysql_fetch_array($result2)) {
					echo '<div class="ppLeft">';
					echo '<a href="javascript:void(0);" onclick="pushPath(this);">传递下去</a><br>';
					echo '<a href="javascript:void(0);" onclick="getPath(this);">传播路径</a><br>';
					echo '</div>';
					$result3 = mysql_query("SELECT name FROM basic_info WHERE mail='".$row2['sender']."'", $conn);
					$row3 = mysql_fetch_array($result3);
					echo '<div class="ppContent">'.$row2['content'].'</div>';
					echo '<a href="space.php?mail='.$row2['sender'].'">'.$row3['name'].'</a>';
					echo '<span>-->...</span>';
				}
				echo '</div>';
			}
		}
		?>
	</div>
    </div>
	<script type="text/javascript" src="js/paperplane.js"></script>
</body>
</html>
