<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>pistol登陆页面</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="js/login.js"></script>
</head>
<%
    String firstname = "";
    String firstpsw = "";
    Cookie[] cookies = request.getCookies();
    if (cookies!=null) {
        for (Cookie cookie : cookies) {
            String c1 = cookie.getName();
            if ("username".equals(c1)) {
                firstname = cookie.getValue();
            }else if("password".equals(c1)){
                firstpsw = cookie.getValue();
            }
        }
    }
%>
<div>
    <%--登录模态框--%>
    <div class="modal fade bs-example-modal-lg"  id="login" tabindex="-1" role="dialog" aria-labelledby="myLogin">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="font-size: 35px;color: red">&times;</span></button>
                    <div id="img_left"><img src="/web_project/img/logo.png" style="width: 500px;height: 150px"></div>
                    <%--          <div id="img_right"><h4 class="modal-title" id="myLogin" style="font-size: 35px">登 录 页 面</h4></div>--%>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" id="loginFrom" action="/web_project/login">
                        <div class="form-group">
                            <label for="login_userName" class="col-sm-2 control-label" style="font-size: 20px">用 户 名</label>
                            <div class="col-sm-10">
                                <input type="text" name="userName" value="<%=firstname == null ? "":firstname%>" class="form-control" id="login_userName" autocomplete="off" placeholder="请输入用户名" data-container="body" data-toggle="popover" style="width: 550px;height: 40px"  data-placement="right" data-content="5-20位有效字符">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="login_passWord" class="col-sm-2 control-label" style="font-size: 20px;">密 码</label>
                            <div class="col-sm-10">
                                <input type="password" name="passWord" value="<%=firstpsw == null ? "":firstpsw%>" class="form-control" id="login_passWord" autocomplete="off" placeholder="请输入密码" data-container="body" data-toggle="popover" style="width: 550px;height: 40px" data-placement="right" data-content="必须包含大小写字母和数字">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="checkbox">
                                    <label>
                                        <input id="remember" name="remember" type="checkbox" style="font-size: 20px;"> 记 住 我
                                        <a href="/web_project/updataPassWord.jsp" style="text-decoration: none;color: red">忘记密码?点击修改</a>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default" style="font-size: 20px;">登 录</button>
                                <button data-dismiss="modal" aria-label="Close" type="button" id="register_but" class="btn btn-primary" data-toggle="modal" data-target="#register" >
                                    没 有 账 号？立 刻 注 册
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
