var score = 0;
var ratee;

function selectFriend(tag) {
	ratee = tag.id;
	document.getElementById('choose').innerText = tag.innerText;
	document.getElementById('chooseFriend').style.display = "none";
}

function handleStateChangeGetFriends() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			document.getElementById('chooseFriend').innerHTML = 
			'<a class="close" href="javascript:void(0);" onclick="showChoose(0);">x</a>' +
			xmlHttp.responseText;
			loadAjaxJs(xmlHttp.responseText);
		}
}

function showChoose(flag) {
	if(flag == "0") {
		document.getElementById('chooseFriend').style.display = "none";
	} else {
		document.getElementById('chooseFriend').style.display = "";
		startXMLHttpRequestGet("rate.php?action=getFriends", handleStateChangeGetFriends);
	}
}

function handleStateChangeLoadTopList() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			document.getElementById('topList').innerHTML = 
			'<h2>排行榜</h2>' + xmlHttp.responseText;
		}
}

function loadTopList() {
	startXMLHttpRequestGet("rate.php?action=getTopList", handleStateChangeLoadTopList);
}

window.onload = loadTopList;

function handleStateChangeAddRate() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			if (xmlHttp.responseText == 'success') {
				document.getElementById('rateTextArea').value = "";
				document.getElementById('choose').innerText = "选择好友";
				alert('评价成功！');
				//TO DO
			} else {
				alert('评价失败！');
			}
		}
}

function addRate() {
	var content = document.getElementById('rateTextArea').value;
	var paras = "content=" + content + "&ratee=" + ratee + "&socre=" + score;
	startXMLHttpRequestPost("rate.php?action=add", handleStateChangeAddRate, paras);
}

//星形评价效果
var starOver = document.getElementById("star"),starUnder = document.getElementById("n-star"),comment = document.getElementById("comment");
var orgWidth = 0,orgWord = "";
var nLeft = starUnder.offsetLeft;
var word = ["很差","不好","一般","不错","很好"], position = [16,32,48,64,80],starChange = function(e){
	starUnder.style.cursor = "pointer";
	var e = e || window.event;
	if(e.stopPropagation){
		e.stopPropagation();
	}
	else if(e.cancelBubble){
		e.cancelBubble();
	}
	var left = e.clientX;
	var i = Math.floor((left - nLeft)/16);
	//comment.innerHTML += "i=" + i + "left = " + left + "; nLeft = " + nLeft + "<br/>";
	comment.innerHTML = word[i];
	score = i + 1;
	try{
		starOver.style.width = position[i] + "px";
	}
	catch(e){};
	
}

var starClick = function(e){
	var e = e || window.event;
	var left = e.clientX;
	var i = Math.floor((left - nLeft)/16);
	orgWidth = position[i] + "px";
	orgWord = word[i];
}

var starOut = function(e){
	starOver.style.width = orgWidth;
	comment.innerHTML = orgWord;
}

if(window.addEventListener){
	starUnder.addEventListener("mouseover",starChange,false);
	starOver.addEventListener("mousemove",starChange,false);
	starOver.addEventListener("click",starClick,false);
	starUnder.addEventListener("mouseout",starOut,false);
}	
else if(window.attachEvent){
	starUnder.attachEvent("onmouseover",starChange);
	starOver.attachEvent("onmousemove",starChange);
	starOver.attachEvent("onclick",starClick);
	starUnder.attachEvent("onmouseout",starOut);
}
else {
	starUnder.onmouseover = starChange;
	starOver.onmousemove = starChange;
	starOver.onclick = starClick;
	starUnder.onmouseout = starOut;
}