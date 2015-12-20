var flag1 = false;
function checkReg() {
    //获取表单提交的内容  

    var varName = document.form1.userName;
    var userName = varName.value;

    if (varName.value.length == 0) {
        $.scojs_message("收件人不能为空(ﾉ*･ω･)ﾉ", $.scojs_message.TYPE_OK);
        //document.getElementById("name").innerHTML = "<font color='red'>收件人不能为空!</font>";
        return false;
    } else {
        checkUsed(userName);
        //flag2=true;
        //document.getElementById("name").innerHTML = "<font color='red'></font>";
    }
}
function checkUsed(name) {

    var url = "checkUsedName.htm?userName=" + name;
    //创建一个XMLHttpRequest对象req
    if (window.XMLHttpRequest) {
        //IE7, Firefox, Opera支持
        req = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        //IE5,IE6支持
        req = new ActiveXObject("Microsoft.XMLHTTP");
    }

    try {
        req.open("GET", url, true);
        req.onreadystatechange = callBackReg;
        req.send(null);
    }
    catch (e) {
        alert(e.message);
        alert(e.description);
        alert(e.number);
        alert(e.name);
    }


}
function callBackReg() {
    if (req.readyState == 4) {

        var result = req.responseText;

        if (result == 'info_registered') {
            //document.getElementById("name").innerHTML = "<font color='green'></font>";
            flag1 = true;
            alert("info_registered");
            return true;
        }

        if (result == 'info_yourself') {
            alert("info_yourself");
            $.scojs_message("亲，你寂寞了嘛，发给自己干嘛(。﹏。*)", $.scojs_message.TYPE_OK);
        }

        if (result == "info_default") {
            alert("info_default");
            $.scojs_message("请输入对方的姓名", $.scojs_message.TYPE_OK);
        }

        if (result == 'info_no_such_person') {
            alert("'info_no_such_person");
            $.scojs_message("收件人不存在，请检查~(╯﹏╰)~", $.scojs_message.TYPE_OK);
            //document.getElementById("name").innerHTML = "<font color='red'>收件人不存在</font>";
            return false;
        }
    }
}
function validate() {

    if (flag1) {
        form1.submit();
    }
    else
        alert("请仔细检查您的信息！(๑•ᴗ•๑)");
}