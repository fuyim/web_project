$(function () {
    $(".top-box-center").fadeIn("2000");
    //修改密码页面表单校验
    function checkUser() {
        var reUser = /^\w{5,20}$/;
        var flag = reUser.test($("#update-userName").val());
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
        var flag = rePsw.test($("#newPsw").val());
        if (flag){
            $(this).popover("hide");
            $(this).css("borderColor","green");
        }else {
            $(this).popover("show");
            $(this).css("borderColor","red");
        }
        return flag;
    }

    //验证码校验 不为空即可
    function checkCode() {
        var check = $("#update-check").val();
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
        if (checkUser()&&checkPsw()&&checkPsw()){
            return true;
        }
        return false;
    });

    $("#update-userName").blur(checkUser);
    $("#newPsw").blur(checkPsw);
    $("#update-check").blur(checkCode);
})