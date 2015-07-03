//请求加载评论
function handleStateChangeGetComment() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			document.getElementById(id)
			.getElementsByClassName('commentList')[0].innerHTML = xmlHttp.responseText;
		}
}

function comment(tag) {
	id = tag.parentNode.parentNode.id;
	var list = document.getElementById(id).getElementsByClassName('commentList')[0];
	if (list.style.display == "") {
		list.style.display = "none";
	} else {
		var url = "comment.php?action=get&id=" + id;
		startXMLHttpRequestGet(url, handleStateChangeGetComment);
		list.style.display = "";
	}
}

//请求添加评论
function handleStateChangeAddComment() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			if (xmlHttp.responseText == 'success') {
				//var list = document.getElementById(id)
				//.getElementsByClassName('commentList')[0];
				var url = "comment.php?action=get&id=" + id;
				startXMLHttpRequestGet(url, handleStateChangeGetComment);
				//list.getElementsByClassName('commentArea')[0].value = "";
				alert("评论成功！");
			} else {
				alert("评论失败！");
			}
		}
}

function addComment(tag) {
	id = tag.parentNode.parentNode.id;
/*	content = document.getElementById(id)
	.getElementsByClassName('commentList')[0]
	.getElementsByClassName('commentArea')[0].value;*/
	content = tag.parentNode.getElementsByClassName('commentArea')[0].value;
	paras = "id=" + id + "&content=" + content;
	startXMLHttpRequestPost("comment.php?action=add", handleStateChangeAddComment, paras);
}

//请求删除评论
function handleStateChangeDeleteComment() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			if (xmlHttp.responseText == 'success') {
				var node = document.getElementById(id);
				node.parentNode.removeChild(node);
				alert("删除成功！");
			} else {
				alert("删除失败！");
			}
		}
}

function deleteComment(tag) {
	id = tag.parentNode.parentNode.id;
	paras = "id=" + id.split('-')[1];
	startXMLHttpRequestPost("comment.php?action=delete", handleStateChangeDeleteComment, paras);
}
