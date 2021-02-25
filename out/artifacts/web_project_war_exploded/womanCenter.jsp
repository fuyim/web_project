<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>女士主页</title>
    <link type="text/css" href="css/updatePassWord.css" rel="stylesheet">
    <script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="css/manCenter.css">
    <script src="js/manCenter.js"></script>
</head>
<script>
    $(function () {
        $(function () {
            //男装分类
            var search = location.search;
            // alert(search);?cid=5;
            var wid = search.split("=")[1];
            // alert(cid)
            load(wid,null);
        });
    });
        function load(wid,currentPage) {
            $.get("/web_project/QueryPage",{wid:wid,currentPage:currentPage},function (pb) {
                //设置总页码数
                $("#totalPage").html(pb.totalPage);
                //设置总记录数
                $("#totalCount").html(pb.totalSzie);

                // <li><a href="#">首页</a></li>
                // <li><a href="#">上一页</a></li>
                // <li class="active" ><a href="#">1</a></li>

                var lis = "";
                //计算上一页的页码
                var prevNum =  pb.currentPage - 1;
                if(prevNum <= 0){
                    prevNum = 1;
                }

                //首页
                var firstPage = '<li onclick="javascript:load('+wid+',1)"><a href="javascript:void(0)">首页</a></li>';
                //上一页
                var prevPage = '<li onclick="javascript:load('+wid+','+prevNum+')"><a href="javascript:void(0)">上一页</a></li>';

                lis+=firstPage;
                lis+=prevPage;

                for (var i=1;i<=pb.totalPage ; i++){
                    var li;
                    if(pb.currentPage == i){
                        li = '<li class="active" onclick="javascript:load('+wid+','+i+')"><a href="javascript:void(0)">'+i+'</a></li>';
                    }else{
                        li = '<li onclick="javascript:load('+wid+','+i+')" ><a href="javascript:void(0)">'+i+'</a></li>';
                    }
                    lis+=li;
                }
                // <li><a href="#">下一页</a></li>
                // <li><a href="#">末页</a></li>
                //计算下一页
                var nextNum = pb.currentPage+1;
                if (nextNum >= pb.totalPage){
                    nextNum = pb.totalPage;
                }
                //下一页
                var nextPage = '<li onclick="javascript:load('+wid+','+nextNum+')"><a href="javascript:void(0)">下一页</a></li>'
                //末页
                var lastPage = '<li onclick="javascript:load('+wid+','+nextNum+')"><a href="javascript:void(0)">末页</a></li>'
                lis+=nextPage;
                lis+=lastPage;
                //展示
                $("#PageNum").html(lis);

                var woman_product = "";
                for (var i =0 ; i<pb.list.length ; i++){
                    var woman = pb.list[i];
                    var woman_li =' <div class="col-sm-3 man-product-center-body-center">\n' +
                        '            <a href="/web_project/single.jsp?pid='+woman.id+'" target="_blank"><img src="img/product/man03/'+woman.imageFile+'" style="height: 305px"></a>\n' +
                        '            <div class="man-product-center-body-center-bottom">\n' +
                        '                <h3 style="color: #000;font-size: 15px;font-weight: bold"">'+woman.name+'</h3>\n' +
                        '                <div class="man-product-center-bottom-top" style="padding-top: 20px">\n' +
                        '                    <span  style="font-size: 25px;">网付价:</span>\n' +
                        '                    <em style="font-size: 15px;color: red">￥</em>\n' +
                        '                    <strong class="cloth_price" style="font-size: 20px;color: red">'+woman.price+'</strong>\n' +
                        '                    <em>起</em>\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '             </div>'

                    woman_product+=woman_li
                }

                $("#womanProduct").html(woman_product);
                window.scrollTo(0,0);
            })
        }

</script>
<body>
<%@include file="header.jsp"%>
<div class="top-box">
    <div class="top-box-center">
        <a href="index.jsp" class="bottom-box-center-home"><span class="glyphicon glyphicon-home" style="font-size: 20px;">&nbsp;</span><font style="font-size: 20px">家</font></a>
        &nbsp;<font style="font-size: 20px;color:  #7e7e7e">/</font>&nbsp;<font style=" font-size: 20px;color:  #7e7e7e;">女 士</font>
    </div>
</div>
<div class="man-product">
    <div class="man-product-center">
        <div class="man-product-center-top"><h2 style="color: #dca7a7;font-weight: bold ">女&nbsp;装</h2></div>
        <div id="womanProduct">
<%--            <div class="col-sm-3 man-product-center-body-center">--%>
<%--                        <img src="img/product/200.jpg" style="height: 305px">--%>
<%--                        <div class="man-product-center-body-center-bottom">--%>
<%--                            <h3 style="color: #000">JEEP/吉普 20秋季新款个性LOGO百搭棉质长袖男式T恤</h3>--%>
<%--                            <div class="man-product-center-bottom-top">--%>
<%--                                <span  style="font-size: 25px;">网付价:</span>--%>
<%--                                <em style="font-size: 15px;color: red">￥</em>--%>
<%--                                <strong class="cloth_price" style="font-size: 20px;color: red">299</strong>--%>
<%--                                <em>起</em>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
        </div>
    </div>
    <div class="man-product-center-bottom">
        <div class="page_num_inf" style="font-size: 25px;">
            <i>|</i>
            共
            <span class="totalPage" id="totalPage" style="color: red">12</span> 页
            <span class="totalCount" id="totalCount" style="color: red">132</span> 条
        </div>
        <div class="PageNum">
            <nav>
                <ul class="pagination pagination-lg" id="PageNum">
<%--                    <li><a href="#">首页</a></li>--%>
<%--                    <li><a href="#">上一页</a></li>--%>
<%--                    <li><a href="#">1</a></li>--%>
<%--                    <li><a href="#">2</a></li>--%>
<%--                    <li><a href="#">3</a></li>--%>
<%--                    <li><a href="#">4</a></li>--%>
<%--                    <li><a href="#">5</a></li>--%>
<%--                    <li><a href="#">6</a></li>--%>
<%--                    <li><a href="#">7</a></li>--%>
<%--                    <li><a href="#">8</a></li>--%>
<%--                    <li><a href="#">9</a></li>--%>
<%--                    <li><a href="#">10</a></li>--%>
<%--                    <li><a href="#">下一页</a></li>--%>
<%--                    <li><a href="#">末页</a></li>--%>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>
</html>
