//添加纸飞机
function showAddPp(flag) {
	if(flag == "0") {
		document.getElementById('newPp').style.display = "none";
	} else {
		document.getElementById('newPp').style.display = "";
	}
}

function handleStateChangeAddPp() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			if (xmlHttp.responseText == 'success') {
				document.getElementById('newPp').style.display = "none";
				alert('发布成功！');
				//TO DO
			} else {
				alert('发布失败！');
			}
		}
}

function addPp() {
	var content = document.getElementById('ppTextArea').value;
	var paras = 'content=' + content;
	startXMLHttpRequestPost("paperplane.php?action=add", handleStateChangeAddPp, paras);
}

//取得纸飞机路径
var id;
function handleStateChangeGetPath() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			var pTag = document.getElementById(id).getElementsByTagName('span')[0];
			pTag.innerHTML = xmlHttp.responseText;
		}
}

function getPath(tag) {
	id = tag.parentNode.parentNode.id;
	var paras = 'id=' + id;
	startXMLHttpRequestPost("paperplane.php?action=getPath", handleStateChangeGetPath, paras);
}

//传递纸飞机
function handleStateChangePushPath() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			var response = xmlHttp.responseText.split('-');
			if(response[0] == 'success') {
				var node = document.getElementById(id);
				node.parentNode.removeChild(node);
				alert('传递成功！下一个人是' + response[1]);
			} else {
				alert('传递失败！');
			}
		}
}

function pushPath(tag) {
	id = tag.parentNode.parentNode.id;
	var paras = 'id=' + id;
	startXMLHttpRequestPost("paperplane.php?action=pushPath", handleStateChangePushPath, paras);
}
