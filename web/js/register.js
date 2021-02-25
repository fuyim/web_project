$(function () {
    //注册表单校验
    //用户名的校验
    function checkUser() {
        var reUser = /^\w{5,20}$/;
        var flag = reUser.test($("#register_userName").val());
        if (flag){
            $(this).popover("hide");
            $(this).css("borderColor","green");
        }else {
            $(this).popover("show");
            $(this).css("borderColor","red");
        }
        return flag;
    }
    //密码校验
    function checkPsw() {
        var rePsw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{8,16}$/;
        var flag = rePsw.test($("#register_passWord").val());
        if (flag){
            $(this).popover("hide");
            $(this).css("borderColor","green");
        }else {
            $(this).popover("show");
            $(this).css("borderColor","red");
        }
        return flag;
    }

    //校验重复密码
    function checkrePsw() {
        var rePsw = $("#rePsw").val();
        var flag = false;
        if (rePsw == $("#register_passWord").val()){
            $(this).popover("hide");
            $(this).css("borderColor","green");
            flag = true;
        }else {
            $(this).popover("show");
            $(this).css("borderColor","red");
        }
        return flag;
    }
    //手机号校验
    function checkPhone() {
        var rePhone = /^1[34578]\d{9}$/;
        var flag = rePhone.test($("#telephone").val());
        if (flag){
            $(this).popover("hide");
            $(this).css("borderColor","green");
        }else {
            $(this).popover("show");
            $(this).css("borderColor","red");
        }
        return flag;
    }
    //电子邮箱校验
    function checkEmail() {
        var reMail = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/i;
        var flag = reMail.test($("#email").val());
        if (flag){
            $(this).popover("hide");
            $(this).css("borderColor","green");
        }else {
            $(this).popover("show");
            $(this).css("borderColor","red");
        }
        return flag
    }
    //出生日期校验 不为空即可
    function checkBirthday() {
        var birthday = $("#birthday").val();
        var flag = false;
        if (birthday){
            $(this).popover("hide");
            $(this).css("borderColor","green");
            flag = true;
        }else {
            $(this).popover("show");
            $(this).css("borderColor","red");
        }
        return flag;
    }
    //验证码校验 不为空即可
    function checkCode() {
        var check = $("#check").val();
        var flag = false;
        if (check){
            $(this).popover("hide");
            $(this).css("borderColor","green");
            flag = true;
        }else {
            $(this).popover("show");
            $(this).css("borderColor","red");
        }
        return flag;
    }

    $("#registerFrom").submit(function () {
        if (checkUser()&&checkPsw()&&checkCode()&&checkPhone()&&checkBirthday()&&checkrePsw()&&checkEmail()){
            return true;
        }
        return false;
    });

    $("#register_userName").blur(checkUser);
    $("#register_passWord").blur(checkPsw);
    $("#rePsw").blur(checkrePsw);
    $("#telephone").blur(checkPhone);
    $("#email").blur(checkEmail);
    $("#birthday").blur(checkBirthday);
    $("#check").blur(checkCode);


})