<?php 
session_start();
$user = $_SESSION['user'];
include('conn.php');
if(isset($_GET['action']) && $_GET['action'] == 'edit') {
	$name = $_POST['name'];
	$sex = $_POST['sex'];
	$birthday = $_POST['birthday'];
	$address = $_POST['address'];
	$phone = $_POST['phone'];
	if($result = mysql_query("UPDATE user_info 
			SET name='$name',sex=$sex,birthday=$birthday,address='$address',phone='$phone' 
			WHERE mail='$user'", $conn)) {
		echo 'success';
	} else {
		echo 'fail';
	}
	die(0);
} else if(isset($_GET['action']) && $_GET['action'] == 'getFriends') {
	$result = mysql_query("SELECT mail,name FROM basic_info 
			WHERE mail IN (SELECT friend FROM relation WHERE user='$user')", $conn);
	while($row = mysql_fetch_array($result)) {
		echo '<option value='.$row['mail'].'>'.$row['name'].'</option>';
	}
	die(0);
}
$result = mysql_query("SELECT * FROM user_info WHERE mail='$user'", $conn);
$row = mysql_fetch_array($result);
?>
<script type="text/javascript">
var oHead = document.getElementsByTagName('head')[0];
var oScript = document.createElement('script');
oScript.type = "text/javascript";
oScript.src = "js/profile.js";
oHead.appendChild(oScript);
</script>
<div id="profile">
	<dl>
		<dt>昵称</dt>
		<dd class="info"><?php echo ($row['name']);?></dd>
		<dd class="edit"><input type="text" />
		<dt>性别</dt>
		<dd class="info"><?php echo ($row['sex'] == 1 ? '女' : '男');?></dd>
		<dd class="edit">
			<input type="radio" name="sex" />男
			<input type="radio" name="sex" />女
		</dd>
		<dt>生日</dt>
		<dd class="info"><?php echo ($row['birthday']);?></dd>
		<dd class="edit">
			<select id="selYear"></select>年
			<select id="selMonth"></select>月
			<select id="selDay"></select>日
		</dd>
		<dt>电子邮件</dt>
		<dd class="info"><?php echo ($row['mail']);?></dd>
		<dd class="edit"></dd>
		<dt>地址</dt>
		<dd class="info"><?php echo ($row['address']);?></dd>
		<dd class="edit"><input type="text" /></dd>
		<dt>电话</dt>
		<dd class="info"><?php echo ($row['phone']);?></dd>
		<dd class="edit"><input type="text" /></dd>
		<dt>注册时间</dt>
		<dd class="info"><?php echo ($row['regist_time']);?></dd>
		<dd class="edit"></dd>
	</dl>
	<button class="info" onclick="editProfile();">修改</button>
	<button class="edit" onclick="saveProfile();">保存</button>
</div>
<script type="text/javascript">
	
</script>