<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>pistol注册页面</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/index.css">
    <script src="js/register.js"></script>
</head>
<script>
    $(function () {
        $("#register_userName").blur(function () {
            //获取焦点时获取文本内容
            var username = $(this).val();
            $.post("/web_project/findByUser",{username:username},function (data) {
                if (data.isMsg){
                    //用户存在
                    $("#msg").html(data.msg);
                    $("#msg").css("color","red");
                }else {
                    //用户存在
                    $("#msg").html(data.msg);
                    $("#msg").css("color","green");
                }
            },"json")
        })
    })
</script>
<body>
<%--注册模态框--%>
<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myRegister">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="height: 110px;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="color: red">&times;</span></button>
                <div style="width: 400px;height: 100px;"><img src="/web_project/img/logo.png" style="width: 400px;height: 100px;"></div>
                <%--          <h4 class="modal-title" id="myRegister" style="font-size: 35px">注 册 页 面</h4>--%>
            </div>
            <div class="modal-body" style="height:500px">
                <form class="form-horizontal" method="post" id="registerFrom" action="/web_project/register">
                    <div class="form-group">
                        <label for="register_userName" class="col-sm-2 control-label" >用 户 名</label>
                        <div class="col-sm-10">
                            <input type="text" name="userName" class="form-control" id="register_userName" placeholder="请输入用户名" style="width: 450px;height: 30px" data-container="body" data-toggle="popover" data-placement="right" data-content="5-20位有效字符">
                            <font id="msg"></font>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="register_passWord" class="col-sm-2 control-label" >密 码</label>
                        <div class="col-sm-10">
                            <input type="password" name="passWord" class="form-control" id="register_passWord" placeholder="请输入密码" style="width: 450px;height: 30px" data-container="body" data-toggle="popover" data-placement="right" data-content="必须包含大小写字母和数字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="rePsw" class="col-sm-2 control-label">确 认 密 码</label>
                        <div class="col-sm-10">
                            <input type="password" name="rePsw" class="form-control" id="rePsw" placeholder="请输入密码" style="width: 450px;height: 30px" data-container="body" data-toggle="popover" data-placement="right" data-content="请再次输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="telephone" class="col-sm-2 control-label">手 机 号</label>
                        <div class="col-sm-10">
                            <input name="telephone" type="text" class="form-control" id="telephone" placeholder="请输入手机号" style="width: 450px;height: 30px" data-container="body" data-toggle="popover" data-placement="right" data-content="1开头，第二位是“3,4,5,7,8”任意一位的11位数字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sex" class="col-sm-2 control-label" >性 别</label>
                        <div class="col-sm-10" style="padding-top: 5px;">
                            <input type="radio" id="sex" name="sex" value="男" checked> 男
                            <input type="radio" name="sex" value="女"> 女
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">电 子 邮 箱</label>
                        <div class="col-sm-10">
                            <input name="email" type="email" class="form-control" id="email" placeholder="请输入电子邮箱" style="width: 450px;height: 30px" data-container="body" data-toggle="popover" data-placement="right" data-content="请输入有效电子邮件(@--.)">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="birthday" class="col-sm-2 control-label" >出 生 日 期</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control"  id="birthday" name="birthday" placeholder="年/月/日" style="width: 450px;height: 30px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="check" class="col-sm-2 control-label">验 证 码</label>
                        <div class="col-sm-10">
                            <input type="text" id="check" name="code" class="form-control"  style="width: 200px;height: 30px" placeholder="请输入验证码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="check" class="col-sm-2 control-label" ></label>
                        <img id="code" src="/web_project/CheckCodeServlet" class="col-sm-2 control-label"  alt="" style="padding-bottom: 5px;height: 40px;" onclick="changeCheckCode(this)">
                        <a href="javascript:void(0)" style="line-height: 40px" onclick="reCode(this)">看不清?点击刷新</a>
                        <script>
                            function changeCheckCode(img) {
                                img.src = "/web_project/CheckCodeServlet?"+new Date().getTime();
                            }
                            function reCode() {
                                var date = new Date().getTime();
                                var src = "/web_project/CheckCodeServlet?"+date
                                $("#code").prop("src",src)
                            }
                        </script>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">注 册</button>
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
