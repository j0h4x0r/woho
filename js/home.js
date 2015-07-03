//请求右侧主体内容，包括feed、自己的tweet
function handleStateChangeGetMain() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			document.getElementById('main').innerHTML = xmlHttp.responseText;
			loadAjaxJs(xmlHttp.responseText);
		}
}

function getMainContent() {
	var url = location.hash.split('#!/')[1];
	if (!url)
		url = 'feed';
	var ps = url.split('?');
	url = ps[0] + ".php?action=get";
	if(ps.length > 1) {
		url += "&type=" + ps[1];
	}
	//url += '.php?action=get';
	startXMLHttpRequestGet(url, handleStateChangeGetMain);
}

window.onload = getMainContent;
window.onhashchange = getMainContent;

//请求发布新的tweet
function handleStateChangeAddTweet() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			if (xmlHttp.responseText == 'success') {
				document.getElementById('tweetTextArea').value = '';
				alert('发布成功！');
				//TO DO
			} else {
				alert('发布失败！');
			}
		}
}


document.getElementById('publish').onclick = function() {
	var content = document.getElementById('tweetTextArea').value;
	var paras = 'content=' + content;
	startXMLHttpRequestPost("tweet.php?action=add", handleStateChangeAddTweet, paras);
}

//请求删除微博
var id;

function handleStateChangeDeleteTweet() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			if (xmlHttp.responseText == 'success') {
				var node = document.getElementById(id);
				node.parentNode.removeChild(node);
				alert('删除成功！');
			} else {
				alert('删除失败！');
			}
		}
}

function deleteTweet(tag) {
	id = tag.parentNode.parentNode.id;
	var paras = 'id=' + id;
	startXMLHttpRequestPost("tweet.php?action=delete", handleStateChangeDeleteTweet, paras);
}


//点击小纸条弹出子菜单
document.getElementById('noteCBar').style.display = "none";

function navBarClick() {
	if(this.id != null && this.id == 'noteBar') {
		document.getElementById('noteCBar').style.display = "";
	} else {
		document.getElementById('noteCBar').style.display = "none";
	}
}

var bars = document.getElementsByClassName('pBar');
for(var i = 0; i < bars.length; i++) {
	bars[i].onclick = navBarClick;
}

//请求删除小纸条
function handleStateChangeDeleteNote() {
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

function deleteNote(tag) {
	id = tag.parentNode.parentNode.id;
	paras = "id=" + id;
	startXMLHttpRequestPost("note.php?action=delete", handleStateChangeDeleteNote, paras);
}

//请求添加小纸条
function handleStateChangeAddNote() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			if (xmlHttp.responseText == 'success') {
				document.getElementById('newNote').style.display = "none";
				alert('发布成功！');
				//TO DO
			} else {
				alert('发布失败！');
			}
		}
}

function addNote() {
	var content = document.getElementById('noteTextArea').value;
	var recipient = document.getElementById('rightNewNote').children[0].value;
	var paras = 'content=' + content + '&recipient=' + recipient;
	startXMLHttpRequestPost("note.php?action=add", handleStateChangeAddNote, paras);
}

function handleStateChangeGetFriends() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			document.getElementById('rightNewNote').children[0].innerHTML = xmlHttp.responseText;
		}
}

function showAddNote(flag) {
	if(flag == "0") {
		document.getElementById('newNote').style.display = "none";
	} else {
		var hr = document.getElementById('main');
		var div = document.getElementById('newNote');
		div.style.left = hr.style.left;
		div.style.top = hr.style.top;
		div.style.display = "";
		startXMLHttpRequestGet("profile.php?action=getFriends", handleStateChangeGetFriends);
	}
}

function friendSelectChange(tag) {
	document.getElementById('newRecipient').value = 
		tag.options[tag.selectedIndex].text;
}
