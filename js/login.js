var mailInput = document.getElementById('mail');
var tipmail = '注册邮箱';
mailInput.value = tipmail;
mailInput.style.color = '#999';
mailInput.onfocus = function() {
	if (this.value == tipmail) {
		this.value = '';
		this.style.color = '#000';
	}
}
mailInput.onblur = function() {
	if (this.value == '') {
		this.value = tipmail;
		this.style.color = '#999';
	}
}

var passwordInput = document.getElementById('password');
var tipPassword = '请输入密码';
passwordInput.value = tipPassword;
passwordInput.style.color = '#999';
passwordInput.type = 'text';
passwordInput.onfocus = function() {
	if (this.value == tipPassword) {
		this.value = '';
		this.style.color = '#000';
		this.type = 'password';
	}
}
passwordInput.onblur = function() {
	if (this.value == '') {
		this.value = tipPassword;
		this.style.color = '#999';
		this.type = 'text';
	}
}

function InputChk(form) {
	if(form.mail.value == tipmail || form.password.value == tipPassword) {
		document.getElementById('errorMsg').style.display = "";
		return false;
	}
	return true;
}