<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详情</title>
    <script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/updatePassWord.css">
    <script src="js/updatePassWord.js"></script>
    <script src="js/header.js"></script>
    <script src="js/include.js"></script>
    <link type="text/css" href="css/single.css" rel="stylesheet">
<%--    <script src="js/single.js"></script>--%>
</head>
<script>
    $(function () {
        $.post("/web_project/getAreasByPid",{},function (data) {
            var option = "";
            // <option>===省份===</option>
            for (var i=0 ; i<data.length ; i++) {
                var o = '<option value="' + data[i].aid + '">'+data[i].atitle+'</option>'
                option+=o;
            }
            $("#province").append(option);
        });
        //当选择的省份发生改变的时候要填充城市的下拉框
        $("#province").change(function () {
            $.post("/web_project/getAreasByPid",{"pid":$(this).val()},function (data) {
                $("#city").html("<option>===城市===</option>");
                $("#area").html("<option>===区县===</option>");
                var option = "";
                for (var i=0;i<data.length;i++){
                    var o = '<option value="' + data[i].aid + '">'+data[i].atitle+'</option>'
                    option+=o;
                }

                $("#city").append(option)
            })
        });
        $("#city").change(function () {
            $.post("/web_project/getAreasByPid",{"pid":$(this).val()},function (data) {
                $("#area").html("<option>===区县===</option>");
                var option = "";
                for (var i=0;i<data.length;i++){
                    var o = '<option value="' + data[i].aid + '">'+data[i].atitle+'</option>'
                    option+=o;
                }
                $("#area").append(option)
            })

        });

        $("#area").change(function () {
            $("#speed").fadeIn(2000)
        })


        //获取路径中传来的pid
        var search = location.search;
        var pid = search.split("=")[1];

        //获取主图详情
        $.get("/web_project/QueryPage",{pid:pid},function (pb) {
            var imaSrc = ''
            for (var i=0;i<pb.list.length;i++){
                var mainProduct = pb.list[i];
                var img = '<img src="/web_project/img/product/man03/'+mainProduct.imageFile+'" style="width: 375px;height: 385px;" id="mainProductImg">'
                var p = '<p style="font-size: 25px;font-weight: bold">'+mainProduct.name+'</p>'
                var span = '<span style="font-size: 20px;">￥<em style="font-size: 40px;color: red">'+mainProduct.price+'</em></span>';
                imaSrc = '/web_project/img/product/man03/'+mainProduct.imageFile+'';
            }
            //将鼠标移出主图时要将图片还原
            $("#productImg").mouseout(function () {

                $("#mainProductImg").attr("src",imaSrc)
            })
            $("#productImg").html(img);
            $("#single-center-r-top").html($("#single-center-r-top").html()+p);
            $("#single-center-r-top-price").html(span);
        })
        $.get("/web_project/GetProductAttach",{pid:pid},function (data) {
            var image = ""
            var image01Src = '';
            var image02Src = '';
            var image03Src = '';
            for (var i=0 ; i<data.length;i++){
                var image01 = '<img src="/web_project/img/product/man03-attach/'+data[0].imageFile+'" style="width: 124px;height: 130px">'
                var image02 = '<img src="/web_project/img/product/man03-attach/'+data[1].imageFile+'" style="width: 124px;height: 130px">';
                var image03 = '<img src="/web_project/img/product/man03-attach/'+data[2].imageFile+'" style="width: 124px;height: 130px">';
                image01Src = '/web_project/img/product/man03-attach/'+data[0].imageFile+'';
                image02Src = '/web_project/img/product/man03-attach/'+data[1].imageFile+'';
                image03Src = '/web_project/img/product/man03-attach/'+data[2].imageFile+'';
            }
            $("#productImg-bottom-l").mouseover(function () {
                // alert(image01Src)/web_project/img/product/man03-attach/0101.jpg
                //改变大图路径
                $("#mainProductImg").attr("src",image01Src)
            })
            //点击中间图
            $("#productImg-bottom-c").mouseover(function () {
                //改变大图路径
                $("#mainProductImg").attr("src",image02Src)
            })
            //点击右边图
            $("#productImg-bottom-r").mouseover(function () {
                //改变大图路径
                $("#mainProductImg").attr("src",image03Src)
            })

            $("#productImg-bottom-l").html(image01);
            $("#productImg-bottom-c").html(image02);
            $("#productImg-bottom-r").html(image03);
        })
        //点击加入购物车
        $("#by_btn").click(function () {
            var click = 0;
            var check = $("#clothSize option:checked").val();
            if (check == 0){
                alert("请选择尺码");
            }else{
                var clothSize = $("#clothSize option:selected").val();
                $.get("/web_project/AddCart",{clothSize:clothSize,pid:pid,click:click},function (data) {
                    window.open("user/MyCart.jsp")
                })
            }

        })
    })
</script>
<body>
<%@ include file="login.jsp"%>
<%@ include file="register.jsp"%>
<%@ include file="header.jsp"%>
<div class="top-box">
    <div class="top-box-center">
        <a href="index.jsp" class="bottom-box-center-home"><span class="glyphicon glyphicon-home" style="font-size: 20px;">&nbsp;</span><font style="font-size: 20px">家</font></a>
        &nbsp;<font style="font-size: 20px;color:  #7e7e7e">/</font>&nbsp;<font style=" font-size: 20px;color:  #7e7e7e">商 品 详 情</font>
    </div>
</div>
<div class="single-center">
    <div class="single-center-l">
        <div class="productImg" id="productImg">
<%--            <img src="/web_project/img/product/34.jpg" style="width: 375px;height: 385px;" id="productImg">--%>
        </div>
        <div class="productImg-bottom" id="productImg-bottom">
            <div class=" productImg-bottom-l" id="productImg-bottom-l">
<%--                <img src="/web_project/img/product/200.jpg" style="width: 124px;height: 130px">--%>
            </div>
            <div class=" productImg-bottom-c" id="productImg-bottom-c">
<%--                <img src="/web_project/img/product/98.jpg" style="width: 124px;height: 130px">--%>
            </div>
            <div class=" productImg-bottom-r" id="productImg-bottom-r">
<%--                <img src="/web_project/img/product/181.jpg" style="width: 124px;height: 130px">--%>
            </div>
        </div>
    </div>
    <div class="single-center-r">
        <div class="single-center-r-top" id="single-center-r-top">
            <span style="color: #2aabd2;font-size: 20px;">pistol</span>
<%--            <p style="font-size: 25px;font-weight: bold">JEEP/吉普 20秋季新款个性LOGO百搭棉质长袖男式T恤</p>--%>
        </div>
        <div class="single-center-r-top" id="single-center-r-top-price" style="background-color: #eeeeee;padding-left: 30px;padding-top: 10px;">
            <span style="font-size: 20px;">￥<em style="font-size: 40px;color: red">299</em></span>
        </div>
        <div class="single-center-r-center">
            <div style="width: 500px;height: 70px;">
            <span style="color: #999">配送</span>
            <select id="province">
                <option>===省份===</option>
            </select>
            <select id="city">
                <option>===城市===</option>
            </select>
            <select id="area">
                <option>===区县===</option>
            </select>
            <p style="padding-left: 30px;display: none" id="speed">现在下单，最快3天后送达</p>
            </div>
            <div>
                <span style="color: #999">运费</span>
                <span>免费送货</span>
            </div>
            <div class="ClothColor">
                <span style="color: #999">颜色</span>
                <a href="javascript:void(0)">红色</a>
                <a href="javascript:void(0)">蓝色</a>
                <a href="javascript:void(0)">灰色</a>
                <a href="javascript:void(0)">墨绿</a>
            </div>
            <div>
                <span style="color: #999">尺码</span>
                <select id="clothSize">
                    <option value="0">===尺码===</option>
                    <option>S码</option>
                    <option>M码</option>
                    <option>L码</option>
                    <option>XL码</option>
                    <option>XXL码</option>
                    <option>XXXL码</option>
                </select>
                <span style="color: red;font-size: 10px;">录入您的尺码信息，精准推荐尺码：</span><span style="font-size: 10px;"><a href="single.jsp" style="text-decoration: none">录入尺码信息</a></span>
            </div>
            <div style="margin-top: 15px;margin-left: 35px;">
                <button class="btn btn-danger" id="by_btn">点击加入购物车</button>
            </div>
        </div>
        <div class="single-center-r-footer">
            <div class="Service">
            <span style="color: #999">客服</span>
            <a href="javascript:void(0)" style="text-decoration: none">
            <span class="glyphicon glyphicon-phone-alt" style="color: #f10180"></span>
                <span>在线客服<span style="font-size: 10px;">(09:00-18:00)</span></span>
            </a>
            </div>
            <div class="service">
                <span style="color: #999">服务</span>
                <a href="javascript:void(0)" style="text-decoration: none;font-size: 10px;">顺丰配送</a>
                <a href="javascript:void(0)" style="text-decoration: none;font-size: 10px;">7天无理由退货</a>
                <a href="javascript:void(0)" style="text-decoration: none;font-size: 10px;">退货无忧</a>
                <a href="javascript:void(0)" style="text-decoration: none;font-size: 10px;">7天可换</a>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
