$(function () {
    $(".updatePassWord-box-center").fadeIn("2000");
    $(".updatePassWord-box-buttom").fadeIn("2000")

    $("#update-btn").click(function () {
        window.scrollTo(0,0);
    })
    //修改密码页面校验
    // function checkUser() {
    //     var reUser = /^\w{5,20}$/;
    //     var flag = reUser.test($("#update-userName").val());
    //     if (flag){
    //         $(this).popover("hide");
    //         $(this).css("borderColor","green");
    //     }else {
    //         $(this).popover("show");
    //         $(this).css("borderColor","red");
    //     }
    //     return flag;
    // }
    // //密码校验
    // function checkPsw() {
    //     var rePsw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{8,16}$/;
    //     var flag = rePsw.test($("#update_passWord").val());
    //     if (flag){
    //         $(this).popover("hide");
    //         $(this).css("borderColor","green");
    //     }else {
    //         $(this).popover("show");
    //         $(this).css("borderColor","red");
    //     }
    //     return flag;
    // }

    //校验重复密码
    function checkNewPsw() {
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
    // //手机号校验
    // function checkPhone() {
    //     var rePhone = /^1[34578]\d{9}$/;
    //     var flag = rePhone.test($("#update-telephone").val());
    //     if (flag){
    //         $(this).popover("hide");
    //         $(this).css("borderColor","green");
    //     }else {
    //         $(this).popover("show");
    //         $(this).css("borderColor","red");
    //     }
    //     return flag;
    // }
    // //电子邮箱校验
    // function checkEmail() {
    //     var reMail = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/i;
    //     var flag = reMail.test($("#update-email").val());
    //     if (flag){
    //         $(this).popover("hide");
    //         $(this).css("borderColor","green");
    //     }else {
    //         $(this).popover("show");
    //         $(this).css("borderColor","red");
    //     }
    //     return flag
    // }
    // //出生日期校验 不为空即可
    // function checkBirthday() {
    //     var birthday = $("#update-birthday").val();
    //     var flag = false;
    //     if (birthday){
    //         $(this).popover("hide");
    //         $(this).css("borderColor","green");
    //         flag = true;
    //     }else {
    //         $(this).popover("show");
    //         $(this).css("borderColor","red");
    //     }
    //     return flag;
    // }
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

    $("#updateFrom").submit(function () {
        if (checkNewPsw()&&checkCode()){
            return true;
        }
        return false;
    });

    // $("#update-userName").blur(checkUser);
    // $("#update_passWord").blur(checkPsw);
        $("#newPsw").blur(checkNewPsw);
    // $("#update-telephone").blur(checkPhone);
    // $("#update-email").blur(checkEmail);
    // $("#update-birthday").blur(checkBirthday);
    $("#update-check").blur(checkCode);

})