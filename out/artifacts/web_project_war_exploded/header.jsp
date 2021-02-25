<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <script src="./bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="./bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="./css/header.css">
    <script src="./js/header.js"></script>
<body>
<script>
    $(function () {
        $("#mandropdown").click(function () {
            $.post("/web_project/category",{},function (data) {
                var lis = "";
                for (var i=0 ; i<data.length; i++){
                    var li = '<li><a href="/web_project/manCenter.jsp?cid='+data[i].cid+'">'+data[i].cname+'</a></li>';
                    lis += li;
                }
                $("#man").html(lis);
            });

        })

        $("#womandropdown").click(function () {
            $.post("/web_project/womanCategory",{},function (data) {
                var woman_lis = "";
                for (var i=0 ; i<data.length; i++){
                    var li = '<li><a href="/web_project/womanCenter.jsp?cid='+data[i].cid+'">'+data[i].cname+'</a></li>';
                    woman_lis += li;
                }
                $("#woman").html(woman_lis);
            })
        })


        //搜索模糊查询
        var rname = '';
        $("#search-button").click(function () {
            //获取搜索框中的内容
            rname = $("#search-input").val();
            // alert(rname)
            //跳转页面
            location.href = 'http://localhost/web_project/product.jsp?rname='+rname+'';
        })

        var search = location.search;
        var rname = search.split("=")[1];
        if (rname){
            rname = window.decodeURIComponent(rname)
        }
    })
</script>
<header id="header">
    <div class="header-top">
        <div class="header-top-left"  style="display: none;">
            <div class="img">
                <img src="/web_project/img/logo.png" alt="logo" id="img">
            </div>
            <div class="center">
                <a href="/web_project/user/MyCart.jsp" class="price-cart">
                    <span class="glyphicon glyphicon-shopping-cart car" aria-hidden="true"></span>
                </a>
            </div>
        </div>
        <div class="header-top-right" style="display: none">
            <div class="phone">
                <span class="glyphicon glyphicon-phone telephone" aria-hidden="true"></span>
                <span>172-6130-7242</span>
                <div class="phone-call" style="color: #7e7e7e;">Call me</div>
            </div>
            <div class="search">
                <a href="javascript:void(0)" class="search-a" data-toggle="modal" data-target="#search-modal"><span class="glyphicon glyphicon-search span_search"></span></a>
            </div>
        </div>
    </div>
    <div class="header-bottom nav" style="display: none">
        <ul class="nav nav-pills" id="ul">
            <li>
                <a class="dropdown-toggle"  href="/web_project/index.jsp" role="button" aria-haspopup="true" aria-expanded="false">
                    首 页
                </a>
            </li>
            <li role="presentation" class="dropdown" id="mandropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    男 装 <span class="caret"></span>
                </a>
                <ul class="dropdown-menu" id="man">
                </ul>
            </li>
            <li role="presentation" class="dropdown" id="womandropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    女 装 <span class="caret"></span>
                </a>
                <ul class="dropdown-menu" id="woman">
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle"  href="/web_project/product.jsp" role="button" aria-haspopup="true" aria-expanded="false">
                    了 解 更 多
                </a>
            </li>
            <li>
                <a class="dropdown-toggle"  href="/web_project/product.jsp" role="button" aria-haspopup="true" aria-expanded="false">
                    产 品 展 示
                </a>
            </li>
            <li>
                <a class="dropdown-toggle" href="/web_project/user/UserCenter.jsp" role="button" aria-haspopup="true" aria-expanded="false">
                    个 人 中 心
                </a>
            </li>
            <li>
                <a id="login_but"  data-toggle="modal" data-target="#login" role="button" aria-haspopup="true" aria-expanded="false">
                    登 录
                </a>
            </li>
            <li>
                <a class="dropdown-toggle"  href="/web_project/logout" role="button" aria-haspopup="true" aria-expanded="false">
                    注 销
                </a>
            </li>
        </ul>
    </div>
</header>
<%--搜索模态框--%>
<!-- Small modal -->

<div class="modal fade bs-example-modal-lg" id="search-modal" tabindex="-1" role="dialog" aria-labelledby="mySearchModal">
    <div class="modal-dialog modal-lg">
        <div class="search-modal-center">
                <div class="search-modal-center-left">
                    <input class="form-control" type="text" name="search" id="search-input" placeholder="搜 索">
                </div>
                <div class="search-modal-center-right" role="button" id="search-button">
                    <span class="glyphicon glyphicon-search search-modal-center-span"></span>
                </div>
        </div>
    </div>
</div>
</body>
</html>