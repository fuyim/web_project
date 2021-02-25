<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <link type="text/css" href="css/index.css" rel="stylesheet">
    <script src="js/header.js"></script>
    <script src="js/include.js"></script>
    <script src="js/index.js"></script>
</head>
<script>
    $(function () {
        $.get("/web_project/OderByServlet",{},function (data) {
            var HotSell_Body="";
            for (var i=0;i<4;i++){
                var hotSell = '<div class="body-bottom-content col-sm-3">\n' +
                    '        <a href="single.jsp?pid='+data[i].id+'" target="_blank"><img src="/web_project/img/product/man03/'+data[i].imageFile+'"></a>\n' +
                    '        <div class="body-bottom-content-bottom">\n' +
                    '            <h3 style="color: #000" id="clothName">'+data[i].name+'</h3>\n' +
                    '            <div class="body-bottom-content-bottom-top">\n' +
                    '            <span  style="font-size: 25px;">网付价:</span>\n' +
                    '            <em style="font-size: 15px;color: red">￥</em>\n' +
                    '            <strong class="cloth_price" style="font-size: 20px;color: red">'+data[i].price+'</strong>\n' +
                    '            <em>起</em>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '    </div>'
                HotSell_Body+=hotSell;
            }
            $(".HotSell").html(HotSell_Body);
        });
    })
</script>
<%@include file="login.jsp"%>
<%@include file="register.jsp"%>
<%@include file="header.jsp"%>
<body>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="/web_project/img/background03.png" alt="...">
            <div class="carousel-caption">
            </div>
        </div>
        <div class="item">
            <img src="/web_project/img/background02.png" alt="...">
            <div class="carousel-caption">
                <h3>...</h3>
                <p>...</p>
            </div>
        </div>
        <div class="item">
            <img src="/web_project/img/background04.png" alt="...">
            <div class="carousel-caption">
                <h3>...</h3>

                <p>...</p>
            </div>
        </div>
        <div class="item">
            <img src="/web_project/img/background05.png" alt="...">
            <div class="carousel-caption">
                <h3>...</h3>
                <p>...</p>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    </a>
</div>
<div class="container-fluid body-bottom">
    <div class="body-bottom-top">
        <div class="body-bottom-top-l"><img src="/web_project/img/icon_5.jpg"></div>&nbsp;<div class="body-bottom-top-r"><span class="body-bottom-top-span">热销榜</span></div>
    </div>
    <div class="HotSell">
<%--    <div class="body-bottom-content col-sm-3">--%>
<%--        <img src="/web_project/img/product/98.jpg">--%>
<%--        <div class="body-bottom-content-bottom">--%>
<%--            <h3 style="color: #000" class="clothName">JEEP/吉普 20秋季新款个性LOGO百搭棉质长袖男式T恤</h3>--%>
<%--            <div class="body-bottom-content-bottom-top">--%>
<%--                <span  style="font-size: 25px;">网付价:</span>--%>
<%--                <em style="font-size: 15px;color: red">￥</em>--%>
<%--                <strong class="cloth_price" style="font-size: 20px;color: red">299</strong>--%>
<%--                <em>起</em>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    </div>
</div>
<div class="container-fluid body-footer">
    <div class="container-fluid">
        <div class="col-md-4 body-footer-content animated wow fadeInLeft" data-wow-delay=".5s">
            <a href="index.jsp">
                <div class="content-grid-effect slow-zoom vertical">
                    <div class="img-box"><img src="/web_project/img/background6.jpg" alt="image" class="img-responsive zoom-img"></div>
                </div>
            </a>
        </div>
        <div class="col-md-4 body-footer-content animated wow fadeInDown animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInDown;">
            <a href="index.jsp">
                <div class="content-grid-effect slow-zoom vertical">
                    <div class="img-box"><img src="/web_project/img/background7%20.jpg" alt="image" class="img-responsive zoom-img"></div>
                </div>
            </a>
        </div>
        <div class="col-md-4 body-footer-content animated wow fadeInRight" data-wow-delay=".5s">
            <a href="index.jsp">
                <div class="content-grid-effect slow-zoom vertical">
                    <div class="img-box"><img src="/web_project/img/background8.jpg" alt="image" class="img-responsive zoom-img"></div>
                </div>
            </a>
        </div>
        <div class="col-md-4 body-footer-content animated wow fadeInLeft" data-wow-delay=".5s">
            <a href="index.jsp">
                <div class="content-grid-effect slow-zoom vertical">
                    <div class="img-box"><img src="/web_project/img/background9.jpg" alt="image" class="img-responsive zoom-img"></div>
                </div>
            </a>
        </div>
        <div class="col-md-4 body-footer-content animated wow fadeInUp animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
            <a href="index.jsp">
                <div class="content-grid-effect slow-zoom vertical">
                    <div class="img-box"><img src="/web_project/img/background10.jpg" alt="image" class="img-responsive zoom-img"></div>
                </div>
            </a>
        </div>
        <div class="col-md-4 body-footer-content animated wow fadeInRight" data-wow-delay=".5s">
            <a href="index.jsp">
                <div class="content-grid-effect slow-zoom vertical">
                    <div class="img-box"><img src="/web_project/img/background11.jpg" alt="image" class="img-responsive zoom-img"></div>
                </div>
            </a>
        </div>
    </div>
    </a>
</div>
<div class="base-box"><em>年轻人的潮流社区</em><span>&nbsp;&nbsp;</span><em>年轻人的潮流社区</em></div>
<%@include file="footer.jsp"%>
<%--<div class="container-fluid body-center">--%>
<%--    <div class="body-center-top">--%>
<%--    <img src="img/icon_6.jpg">&nbsp;<span class="body-bottom-top-span">优质精选</span>--%>
<%--    </div>--%>
<%--    <div class="body-center-r"></div>--%>
<%--    <div class="body-center-l">--%>
<%--        <div class="col-sm-4"></div>--%>
<%--        <div class="col-sm-4"></div>--%>
<%--        <div class="col-sm-4"></div>--%>
<%--        <div class="col-sm-4"></div>--%>
<%--        <div class="col-sm-4"></div>--%>
<%--        <div class="col-sm-4"></div>--%>
<%--    </div>--%>
<%--</div>--%>
</body>
</html>
