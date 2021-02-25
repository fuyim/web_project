<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>pistol更改密码</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/updateUser.css">
    <script src="js/updateUser.js"></script>
    <script src="js/header.js"></script>
    <script src="js/include.js"></script>
</head>
<script>
    $(function () {
       $.post("/web_project/selectUser",$("#updateFrom").serialize(),function (data) {
           //后台返回的数据回显的页面
           if (data!=null){
               $("#update-userName").val(data.username);
               $("#update-email").val(data.email);
               $("#update-telephone").val(data.telephone);
               $("#update_passWord").val(data.passWord);
               $("#update-birthday").val(data.birthday);
               var sex = data.sex;
               if (sex == '男'){
                   $("#man").prop("checked","checked");
               }else if (sex == '女') {
                   $("#man").removeAttr("checked");
                   $("#woman").prop("checked","checked");
               }
           }
       },"json");
       $("#newPsw").blur(function () {
            var update_passWord = $("#update_passWord").val();
            var newPsw = $("#newPsw").val();
            $.post("/web_project/findByPassWord",{update_passWord:update_passWord,newPsw:newPsw},function (data) {
                if (data.isNewMsg){
                    $("#newPswMsg").html(data.NewMsg);
                    $("#newPswMsg").css({"color":"green","font-size":"10px;"})
                }else{
                    $("#newPswMsg").html(data.NewMsg);
                    $("#newPswMsg").css({"color":"red","font-size":"10px;"})
                }
            },"json");
       });
    });
</script>
<body>
<%@include file="login.jsp"%>
<%@include file="register.jsp"%>
<%@include file="header.jsp"%>
<div class="updatePassWord-box">
    <div class="updatePassWord-box-center">
        <a href="index.jsp" class="updatePassWord-box-home"><span class="glyphicon glyphicon-home" style="font-size: 20px;">&nbsp;</span><font style="font-size: 20px">家</font></a>
        &nbsp;<font style="font-size: 20px;color:  #7e7e7e">/</font>&nbsp;<font style=" font-size: 20px;color:  #7e7e7e">更换密码</font>
    </div>
</div>
<div class="updatePassWord-box-buttom" style="background-image: url(img/background.png);">
    <div class="updatePassWord-box-buttom-center">
        <div class="updatePassWord-box-buttom-logo">
            <img src="/web_project/img/logo.png" class="updatePassWord-img">
        </div>
        <hr>
        <form class="form-horizontal" method="post" id="updateFrom" action="/web_project/updatePassWord">
            <div class="form-group">
                <label for="update-userName" class="col-sm-2 control-label" >用 户 名</label>
                <div class="col-sm-10">
                    <input type="text" name="userName" class="form-control" id="update-userName" placeholder="请输入用户名" style="width: 450px;height: 30px" data-container="body" data-toggle="popover" data-placement="right" data-content="5-20位有效字符" readonly>
                    <font id="msg"></font>
                </div>
            </div>
            <div class="form-group">
                <label for="update_passWord" class="col-sm-2 control-label" >原 密 码</label>
                <div class="col-sm-10">
                    <input type="password" name="passWord" class="form-control" id="update_passWord" placeholder="请输入原密码" style="width: 450px;height: 30px" data-container="body" data-toggle="popover" data-placement="right" data-content="输入您的原密码" readonly>
                </div>
            </div>
            <div class="form-group">
                <label for="newPsw" class="col-sm-2 control-label">新 密 码</label>
                <div class="col-sm-10">
                    <input type="password" name="newPsw" class="form-control" id="newPsw" placeholder="请输入新密码" style="width: 450px;height: 30px" data-container="body" data-toggle="popover" data-placement="right" data-content="必须包含大小写字母和数字">
                    <font id="newPswMsg"></font>
                </div>
            </div>
            <div class="form-group">
                <label for="update-telephone" class="col-sm-2 control-label">手 机 号</label>
                <div class="col-sm-10">
                    <input name="telephone" type="text" class="form-control" id="update-telephone" placeholder="请输入手机号" style="width: 450px;height: 30px" data-container="body" data-toggle="popover" data-placement="right" data-content="1开头，第二位是“3,4,5,7,8”任意一位的11位数字" readonly>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label" >性 别</label>
                <div class="col-sm-10" style="padding-top: 5px;">
                    <input type="radio" id="man" name="sex" value="男" checked="checked"> 男
                    <input type="radio" id="woman" name="sex" value="女"> 女
                </div>
            </div>
            <div class="form-group">
                <label for="update-email" class="col-sm-2 control-label">电 子 邮 箱</label>
                <div class="col-sm-10">
                    <input name="email" type="email" class="form-control" id="update-email" placeholder="请输入电子邮箱" style="width: 450px;height: 30px" data-container="body" data-toggle="popover" data-placement="right" data-content="请输入有效电子邮件(@--.)" readonly>
                </div>
            </div>
            <div class="form-group">
                <label for="update-birthday" class="col-sm-2 control-label" >出 生 日 期</label>
                <div class="col-sm-10">
                    <input type="date" class="form-control"  id="update-birthday" name="birthday" placeholder="年/月/日" style="width: 450px;height: 30px" readonly>
                </div>
            </div>
            <div class="form-group">
                <label for="update-check" class="col-sm-2 control-label">验 证 码</label>
                <div class="col-sm-10">
                    <input type="text" id="update-check" name="code" class="form-control"  style="width: 200px;height: 30px" placeholder="请输入验证码">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" ></label>
                <img id="update-code" src="/web_project/CheckCodeServlet" class="col-sm-2 control-label"  alt="" style="padding-bottom: 5px;height: 40px;" onclick="changeCheckCode(this)">
                <a href="javascript:void(0)" style="line-height: 40px" onclick="reCode(this)">看不清?点击刷新</a>
                <script>
                    function changeCheckCode(img) {
                        img.src = "/web_project/CheckCodeServlet?"+new Date().getTime();
                    }
                    function reCode() {
                        var date = new Date().getTime();
                        var src = "/web_project/CheckCodeServlet?"+date
                        $("#update-code").prop("src",src)
                    }
                </script>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default" id="update-btn">修 改</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
