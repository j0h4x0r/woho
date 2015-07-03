var mailInputr = document.getElementById('mailr');
var tipmailr = "输入注册邮箱";
mailInputr.value = tipmailr;
mailInputr.style.color = '#999';
mailInputr.onfocus = function() {
	if (this.value == tipmailr) {
		this.value = '';
		this.style.color = '#000';
	}
}
mailInputr.onblur = function() {
	if (this.value == '') {
		this.value = tipmailr;
		this.style.color = '#999';
	}
}
var passwordr = document.getElementById('passwordr');
var checkPasswordr = document.getElementById('check_passwordr');

function isEmail(str){	
	var regex = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;	
	return regex.test(str);		
}

function reg() {
	var formr = document.getElementById("form2");
	if (formr.mailr.value == "" || formr.mailr.value == "输入注册邮箱") {
		alert ("请填写注册邮箱");
	}  else if (formr.passwordr.value == "") {
		alert("请输入密码");
	} else if (formr.check_passwordr.value == "") {
		alert("请输入确认密码");
	} else if (formr.password.value != formr.check_passwordr.value) {
		alert("您输入的密码和确认密码不同，请修改后重新注册");
		passwordr.value = "";
		checkPasswordr.value = "";
	} else if (!isEmail(formr.mailr.value)){
		alert("邮箱格式错误，请填写正确的邮箱");
	} else {
		formr.submit();	
	}
}
