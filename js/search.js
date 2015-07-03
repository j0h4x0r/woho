function handleStateChangeAddFriend() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			if (xmlHttp.responseText == 'success') {
				alert('添加成功！');
			} else {
				alert('添加失败！不能添加自己或已经是好友');
			}
		}
}

function addFriend(tag) {
	var id = tag.parentNode.parentNode.id;
	var paras = 'mail=' + id;
	startXMLHttpRequestPost("space.php?action=addFriend", handleStateChangeAddFriend, paras);
}