function DateSelector(selYear, selMonth, selDay)
{
    this.selYear = selYear;
    this.selMonth = selMonth;
    this.selDay = selDay;
    this.selYear.Group = this;
    this.selMonth.Group = this;
    // 给年份、月份下拉菜单添加处理onchange事件的函数
    if(window.document.all != null) // IE
    {
        this.selYear.attachEvent("onchange", DateSelector.Onchange);
        this.selMonth.attachEvent("onchange", DateSelector.Onchange);
    }
    else // Firefox
    {
        this.selYear.addEventListener("change", DateSelector.Onchange, false);
        this.selMonth.addEventListener("change", DateSelector.Onchange, false);
    }

    if(arguments.length == 4) // 如果传入参数个数为4，最后一个参数必须为Date对象
        this.InitSelector(arguments[3].getFullYear(), arguments[3].getMonth() + 1, arguments[3].getDate());
    else if(arguments.length == 6) // 如果传入参数个数为6，最后三个参数必须为初始的年月日数值
        this.InitSelector(arguments[3], arguments[4], arguments[5]);
    else // 默认使用当前日期
    {
        var dt = new Date();
        this.InitSelector(dt.getFullYear(), dt.getMonth() + 1, dt.getDate());
    }
}

// 增加一个最大年份的属性
DateSelector.prototype.MinYear = 1900;

// 增加一个最大年份的属性
DateSelector.prototype.MaxYear = (new Date()).getFullYear();

// 初始化年份
DateSelector.prototype.InitYearSelect = function()
{
    // 循环添加OPION元素到年份select对象中
    for(var i = this.MaxYear; i >= this.MinYear; i--)
    {
        // 新建一个OPTION对象
        var op = window.document.createElement("OPTION");
        
        // 设置OPTION对象的值
        op.value = i;
        
        // 设置OPTION对象的内容
        op.innerHTML = i;
        
        // 添加到年份select对象
        this.selYear.appendChild(op);
    }
}

// 初始化月份
DateSelector.prototype.InitMonthSelect = function()
{
    // 循环添加OPION元素到月份select对象中
    for(var i = 1; i < 13; i++)
    {
        // 新建一个OPTION对象
        var op = window.document.createElement("OPTION");
        
        // 设置OPTION对象的值
        op.value = i;
        
        // 设置OPTION对象的内容
        op.innerHTML = i;
        
        // 添加到月份select对象
        this.selMonth.appendChild(op);
    }
}

// 根据年份与月份获取当月的天数
DateSelector.DaysInMonth = function(year, month)
{
    var date = new Date(year, month, 0);
    return date.getDate();
}

// 初始化天数
DateSelector.prototype.InitDaySelect = function()
{
    // 使用parseInt函数获取当前的年份和月份
    var year = parseInt(this.selYear.value);
    var month = parseInt(this.selMonth.value);
    
    // 获取当月的天数
    var daysInMonth = DateSelector.DaysInMonth(year, month);
    
    // 清空原有的选项
    this.selDay.options.length = 0;
    // 循环添加OPION元素到天数select对象中
    for(var i = 1; i <= daysInMonth ; i++)
    {
        // 新建一个OPTION对象
        var op = window.document.createElement("OPTION");
        
        // 设置OPTION对象的值
        op.value = i;
        
        // 设置OPTION对象的内容
        op.innerHTML = i;
        
        // 添加到天数select对象
        this.selDay.appendChild(op);
    }
}

// 处理年份和月份onchange事件的方法，它获取事件来源对象（即selYear或selMonth）
// 并调用它的Group对象（即DateSelector实例，请见构造函数）提供的InitDaySelect方法重新初始化天数
// 参数e为event对象
DateSelector.Onchange = function(e)
{
    var selector = window.document.all != null ? e.srcElement : e.target;
    selector.Group.InitDaySelect();
}

// 根据参数初始化下拉菜单选项
DateSelector.prototype.InitSelector = function(year, month, day)
{
    // 由于外部是可以调用这个方法，因此我们在这里也要将selYear和selMonth的选项清空掉
    // 另外因为InitDaySelect方法已经有清空天数下拉菜单，因此这里就不用重复工作了
    this.selYear.options.length = 0;
    this.selMonth.options.length = 0;
    
    // 初始化年、月
    this.InitYearSelect();
    this.InitMonthSelect();
    
    // 设置年、月初始值
    this.selYear.selectedIndex = this.MaxYear - year;
    this.selMonth.selectedIndex = month - 1;
    
    // 初始化天数
    this.InitDaySelect();
    
    // 设置天数初始值
    this.selDay.selectedIndex = day - 1;
}

var selYear = window.document.getElementById("selYear");
var selMonth = window.document.getElementById("selMonth");
var selDay = window.document.getElementById("selDay");
// 新建一个DateSelector类的实例，将三个select对象传进去
new DateSelector(selYear, selMonth ,selDay);
// 也可以试试下边的代码
// var dt = new Date(2004, 1, 29);
// new DateSelector(selYear, selMonth ,selDay, dt);

//编辑资料
var infoTags = document.getElementsByClassName('info');
var editTags = document.getElementsByClassName('edit');
for(var i = 0; i < infoTags.length; i++) {
	infoTags[i].style.display = "";
}
for(var i = 0; i < editTags.length; i++) {
	editTags[i].style.display = "none";
}

function editProfile() {
	editTags[0].children[0].value = infoTags[0].innerText;
	if(infoTags[1].innerText == '男')
		editTags[1].children[0].checked = true;
	else
		editTags[1].children[1].checked = true;
	//不写生日了。。。。
	editTags[3].innerText = infoTags[3].innerText;
	editTags[4].children[0].value = infoTags[4].innerText;
	editTags[5].children[0].value = infoTags[5].innerText;
	editTags[6].innerText = infoTags[6].innerText;
	for(var i = 0; i < infoTags.length; i++) {
		infoTags[i].style.display = "none";
	}
	for(var i = 0; i < editTags.length; i++) {
		editTags[i].style.display = "";
	}
}

function handleStateChangeSaveProfile() {
	if (xmlHttp.readyState == 4)
		if (xmlHttp.status == 200) {
			if (xmlHttp.responseText == 'success') {
				getMainContent();
				alert("保存成功！");
			} else {
				alert(xmlHttp.responseText);
				alert("保存失败！");
			}
		}
}

function saveProfile() {
	paras = "name=" + editTags[0].children[0].value;
	paras += "&sex=" + ((editTags[1].children[0].checked == true) ? "0" : "1");
	var year = editTags[2].children[0].value;
	var month = editTags[2].children[1].value;
	month = month < 10 ? "0"+month : ""+month;
	var day = editTags[2].children[2].value;
	day = day < 10 ? "0"+day : ""+day;
	paras += "&birthday=" + year + month + day;
	paras += "&address=" + editTags[4].children[0].value;
	paras += "&phone=" + editTags[5].children[0].value;
	startXMLHttpRequestPost("profile.php?action=edit", handleStateChangeSaveProfile, paras);
}
