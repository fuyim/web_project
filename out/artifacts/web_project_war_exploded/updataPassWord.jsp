<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/updatePassWord.css">
    <script src="js/updatePassWord.js"></script>
    <script src="js/header.js"></script>
    <script src="js/include.js"></script>
</head>
<body>
<%@ include file="login.jsp"%>
<%@ include file="register.jsp"%>
<%@ include file="header.jsp"%>
<div class="top-box">
    <div class="top-box-center">
        <a href="index.jsp" class="bottom-box-center-home"><span class="glyphicon glyphicon-home" style="font-size: 20px;">&nbsp;</span><font style="font-size: 20px">家</font></a>
        &nbsp;<font style="font-size: 20px;color:  #7e7e7e">/</font>&nbsp;<font style=" font-size: 20px;color:  #7e7e7e">修改密码</font>
    </div>
</div>
<div class="bottom-box" style="background-image: url(img/background01.jpg)">
    <div class="bottom-box-center">
        <div>
            <img src="/web_project/img/logo.png" class="bottom-box-center-img">
        </div>
        <hr>
        <form class="form-horizontal" method="post" id="updatePassWordFrom" action="/web_project/updatePassWord">
            <div class="form-group">
                <label for="update-userName" class="col-sm-2 control-label" >用 户 名</label>
                <div class="col-sm-10">
                    <input type="text" name="userName" class="form-control" id="update-userName" placeholder="请输入用户名" style="width: 450px;height: 30px" data-container="body" data-toggle="popover" data-placement="right" data-content="5-20位有效字符">
                    <font id="msg"></font>
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
