<?php
//header('content-type:text/html;charset=utf-8');
//$conn = @mysql_connect("192.168.54.101", "woho", "woho");
$conn = @mysql_connect("localhost", "woho", "woho");
if(!$conn) {
	die('数据库连接失败：'. mysql_error());
}
mysql_select_db('woho', $conn);
//mysql_query("set names utf8");

?>