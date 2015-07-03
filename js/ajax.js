/*使用Ajax异步与服务端通信*/
var xmlHttp;
function createXMLHttpRequest() {
	if (window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
}

function startXMLHttpRequestGet(url, handleFunc) {
	createXMLHttpRequest();
	xmlHttp.onreadystatechange = handleFunc;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
}

function startXMLHttpRequestPost(url, handleFunc, paras) {
	createXMLHttpRequest();
	xmlHttp.onreadystatechange = handleFunc;
	xmlHttp.open("POST", url, true);
	xmlHttp.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	xmlHttp.send(paras);
}

function loadAjaxJs(ajaxLoadedData) {
	// 第一步：匹配加载的页面中是否含有js
	var regDetectJs = /<script(.|\n)*?>(.|\n|\r\n)*?<\/script>/ig;
	var jsContained = ajaxLoadedData.match(regDetectJs);

	// 第二步：如果包含js，则一段一段的取出js再加载执行
	if (jsContained) {
		// 分段取出js正则
		var regGetJS = /<script(.|\n)*?>((.|\n|\r\n)*)?<\/script>/im;

		// 按顺序分段执行js
		var jsNums = jsContained.length;
		for ( var i = 0; i < jsNums; i++) {
			var jsSection = jsContained[i].match(regGetJS);

			if (jsSection[2]) {
				if (window.execScript) {
					// 给IE的特殊待遇
					window.execScript(jsSection[2]);
				} else {
					// 给其他大部分浏览器用的
					window.eval(jsSection[2]);
				}
			}
		}
	}
}