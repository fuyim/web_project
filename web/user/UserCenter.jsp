<%@ page import="obtk.com.e324.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <script src="../bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/updatePassWord.css">
    <script src="../js/updatePassWord.js"></script>
    <script src="../js/header.js"></script>
    <script src="../js/include.js"></script>
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/UserCenter.css">
</head>
<%
    User user =(User) session.getAttribute("user");
%>
<body>
<%@include file="/login.jsp"%>
<%@include file="/register.jsp"%>
<%@include file="/header.jsp"%>
<div class="top-box">
    <div class="top-box-center">
        <a href="/web_project/index.jsp" class="bottom-box-center-home"><span class="glyphicon glyphicon-home" style="font-size: 20px;">&nbsp;</span><font style="font-size: 20px">家</font></a>
        &nbsp;<font style="font-size: 20px;color:  #7e7e7e">/</font>&nbsp;<font style=" font-size: 20px;color:  #7e7e7e;">个 人 中 心</font>
    </div>
</div>
<div class="center-top">
    <div class="center-top-l">
        <ol class="breadcrumb ol">
            <li><a href="/web_project/user/UserCenter.jsp" style="font-size: 25px;">个人中心</a></li>
            <li><a href="/web_project/user/MyCart.jsp" style="font-size: 25px;">我的购物车</a></li>
            <li><a href="/web_project/user/MyAddress.jsp" style="font-size: 25px;">我的收货地址</a></li>
            <li><a href="/web_project/updateUser.jsp" style="font-size: 25px;">更改我的密码</a></li>
        </ol>
    </div>
    <div class="center-top-r">
        <div class="alert alert-success" role="alert" style="font-size: 20px;">个 人 信 息</div>
        <div class="center-top-r-body">
            <div class="center-top-r-body-top">
            <span class="glyphicon glyphicon-user" style="font-size: 30px;"></span>
            <span class="" style="font-size: 15px;padding-left: 25px">用 户 名:</span>
                <span class="name"><%=user.getUserName()%></span>
            </div>
            <div class="center-top-r-body-top-center">
            <span class="glyphicon glyphicon-hand-right" style="font-size: 30px"></span>
                <span style="font-size: 15px;padding-left: 45px;">性 别:</span>
                <span class="sex"><%=user.getSex()%></span>
            </div>
            <div class="center-top-r-body-top-center">
                <span class="glyphicon glyphicon-envelope" style="font-size: 30px"></span>
                <span style="font-size: 15px;padding-left: 10px;">电 子 邮 件:</span>
                <span class="email"><%=user.getEmail()%></span>
            </div>
            <div class="center-top-r-body-top-bottom">
                <span class="glyphicon glyphicon-phone" style="font-size: 30px"></span>
                <span style="font-size: 15px;padding-left: 30px;">手 机 号:</span>
                <span class="shouji"><%=user.getTelephone()%></span>
            </div>
        </div>
    </div>
</div>
<%@include file="/footer.jsp"%>
</body>
</html>
