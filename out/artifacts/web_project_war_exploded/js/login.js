$(function () {
    //登录页面单校验
    //校验用户名
    function checkUserName() {
        var reUser = /^\w{5,20}$/;
        var flag = reUser.test($("#login_userName").val());
        if (flag){
            $(this).popover("hide");
            $(this).css("borderColor","green");
        }else {
            $(this).popover("show");
            $(this).css("borderColor","red");
        }
        return flag;
    }

    //校验用户密码
    function checkPassWord() {
        var rePsw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{8,16}$/;
        var flag = rePsw.test($("#login_passWord").val());
        if (flag){
            $(this).popover("hide");
            $(this).css("borderColor","green");
        }else {
            $(this).popover("show");
            $(this).css("borderColor","red");
        }
        return flag;
    }

    //表单提交
    $("#loginFrom").submit(function () {
        if(checkPassWord()&&checkUserName()){
            return true;
        }
        return false;
    })

    $("#login_userName").blur(checkUserName);
    $("#login_passWord").blur(checkPassWord);

    /**
     * 点击时将登录模态框隐藏
     *
     */

})
