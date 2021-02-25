<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的购物车</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <script src="../bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/updatePassWord.css">
    <script src="../js/updatePassWord.js"></script>
    <script src="../js/header.js"></script>
    <script src="../js/include.js"></script>
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/cart.css">
    <link rel="stylesheet" href="../css/cart.css">
    <script src="../js/MyCart.js"></script>
</head>
<script>
    $(function () {
        $.get("/web_project/FindCartServlet",{},function (data) {
            var cart = "";

            for (var i=0;i<data.length;i++){
                var check = data[i].isChecked == 1? "checked" : "unchecked";
                var listContent = '<div class="goodsList">\n' +
                    '            <div class="listContent">\n' +
                    '                <span class="firstTab common">\n' +
                    '                    <input class="isChecked"  type="checkbox" '+check+'>\n' +
                    '                </span>\n' +
                    '                <span id="pro_id" style="display: none">'+data[i].cart_id+'</span>\n'+
                    '            <div class="secondTab common">\n' +
                    '                <img class="goodsImg" src="../img/product/man03/'+data[i].imageFile+'">\n' +
                    '                   <div class="goodsLink">\n' +
                    '                        <a href="/web_project/single.jsp?pid='+data[i].pid+'" target="_blank" style="text-decoration: none"><p>'+data[i].name+'</p></a>\n' +
                    '                       <span>尺码:</span><span>'+data[i].clothSize+'</span>\n' +
                    '                   </div>\n' +
                    '            </div>\n' +
                    '            <span class="thirdTab common price specialItem ">'+data[i].price+'</span>\n' +
                    '            <div class="fourthTab common">\n' +
                    '                <input type="button" class="min" value="-">\n' +
                    '                <input type="text" class="num" value="'+data[i].clothNum+'" disabled="disabled">\n' +
                    '                <input type="button" class="add" value="+">\n' +
                    '            </div>\n' +
                    '            <a class="lastTab common" href="#">删除</a>\n' +
                    '             </div>\n' +
                    '        </div>'
                if (data[i].isDelete==0){
                    cart+=listContent;
                }

            }
            $("#CartList").html(cart);
            cal();

            //1.全选
            $("#selectAll").click(function(){
                $(".isChecked").each(function () {
                    if (!this.checked){
                        //复选框没有选中
                        this.checked = "checked";
                        $.get("/web_project/UpdateCartServlet",{"checked":"true"},function (data) {
                        })
                    }
                })
                cal();
            })

            //选中和取消选中
            $("input[type=checkbox]").click(function () {
                var pid = $(this).parent().next().text();
                $.get("/web_project/UpdateCartServlet",{"checked":this.checked,pid:pid},function (data) {
                })
            })

            //2.反选
            $("#cancel").click(function(){
                $(".isChecked").each(function(){
                    var pid = $(this).parent().next().text();
                    this.checked = !this.checked;
                    $.get("/web_project/UpdateCartServlet",{"checked":this.checked,pid:pid},function (data) {
                    })
                });
                cal();
            })
            //3.删除所选
            $("#delete").click(function(){
                var flag;
                click = 1;
                flag = confirm("确定删除所选吗");
                    $(".isChecked").each(function () {
                        if (this.checked) {
                            var pid = $(this).parent().next().text();
                            if (flag){
                                $(this).parent().parent().parent().remove();
                            }
                            $.get("/web_project/UpdateCartServlet",{pid:pid,click:click},function (data) {
                            });
                        }
                    });
                cal();
            })
            //4.直接删除
            var click = 0;
            $("a.lastTab").click(function(){
                var flag = confirm("确定要删除吗？");
                if(flag) {
                    $(this).parent().parent().remove();
                }
                var pid = $(this).parent().children("#pro_id").text();
                var click = 1;
                $.get("/web_project/UpdateCartServlet",{pid:pid,click:click},function (data) {

                })
                cal();
            });
            //5.数量加减
            $(".add").click(function(){
                //点击添加按钮，哥哥的value属性的值要加1
                $(this).prev().val(parseInt($(this).prev().val())+1);
                var num = $(this).prev().val()
                var pid = $(this).parent().parent().children("#pro_id").text();
                $.get("/web_project/UpdateCartServlet",{num:num,pid:pid},function (data) {

                })
                cal();

            })
            $(".min").click(function(){
                //点击添加按钮，哥哥的value属性的值要加1
                var num = parseInt($(this).next().val());//当前的数量
                if(num>1){
                    num = num-1
                }else{
                    num =1
                }
                $(this).next().val(num);
                var pid = $(this).parent().parent().children("#pro_id").text();
                $.get("/web_project/UpdateCartServlet",{pid:pid,num:num},function (data) {
                })
                cal();
            })
            //6.计算商品数量和金额
            function cal(){
                var count = 0;//商品的数量
                var sum = 0;//商品的总金额

                $(".num").each(function(){
                    var t = $(this).parent().siblings(".firstTab").children()[0];
                    if(t.checked){
                        console.log(1);
                        count += parseInt(this.value);
                        sum += eval(this.value+"*"+$(this).parent().prev().text());
                        console.log(count);
                        console.log(sum);
                    }
                })
                //计算完成然后设置总金额和数量
                $("#count").text(count);
                $("#total").text(sum);
                $("#header-total").text(sum)

            }
            //手动点击复选框也要计算金额和数量
            $("input[type=checkbox]").click(function(){
                cal();
            })
        });

    })
</script>
<body>
<%@include file="/login.jsp"%>
<%@include file="/register.jsp"%>
<%@include file="/header.jsp"%>
<div class="top-box">
    <div class="top-box-center">
        <a href="/web_project/index.jsp" class="bottom-box-center-home"><span class="glyphicon glyphicon-home" style="font-size: 20px;">&nbsp;</span><font style="font-size: 20px">家</font></a>
        &nbsp;<font style="font-size: 20px;color:  #7e7e7e">/</font>&nbsp;<font style=" font-size: 20px;color:  #7e7e7e;">我 的 购 物 车</font>
    </div>
</div>
<div class="MyCart-table">
    <div class="shoppingCart" id="shoppingCart">
        <div class="header">
            <div class="Content">
                <span class="common firstTab">选中</span>
<%--                <span class="common firstTab">编号</span>--%>
                <span class="common secondTab">商品</span>
                <span class="common thirdTab">单价</span>
                <span class="common fourthTab">数量</span>
                <span class="common lastTab">操作</span>
            </div>
        </div>
        <div id="CartList"></div>
<%--        <div class="goodsList">--%>
<%--            <div class="listContent">--%>
<%--                <span class="firstTab common">--%>
<%--                    <input  type="checkbox" />--%>
<%--                </span>--%>
<%--                <div class="secondTab common">--%>
<%--                    <img class="goodsImg" src="../img/product/181.jpg">--%>
<%--                    <div class="goodsLink">--%>
<%--                        <p>连帽卫衣女宽松钉珠纹设计感秋季新款中长款长袖上衣女</p>--%>
<%--                        <span>尺码:</span><span>S码</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <span class="thirdTab common price specialItem ">199</span>--%>
<%--                <div class="fourthTab common">--%>
<%--                    <input type="button" class="min" value="-">--%>
<%--                    <input type="text" class="num" value="1" disabled="disabled">--%>
<%--                    <input type="button" class="add" value="+">--%>
<%--                </div>--%>
<%--                    <a class="lastTab common" href="#">删除</a>--%>
<%--                </div>--%>
<%--        </div>--%>
        <div class="footer">
            <div class="Content">

                <div class="common">
                    <input class="selectBtn btn btn-info" id="selectAll"  type="button" value="全选">
                    <input class="selectBtn btn btn-info" id="cancel" type="button" value="反选">
                    <input class="selectBtn btn btn-info" id="delete" type="button" value="删除所选">
                </div>

                <div class="common count" >
                    选中商品数:
                    <span id="count" class="specialItem">
                        0
                    </span>
                </div>
                <div class="common total">
                    总金额:<span id="total" class="specialItem">0.00</span>
                </div>
            </div>
        </div>
    </div>
    <div style="margin-top: 20px;"><%@include file="../footer.jsp"%></div>
</div>
</body>
</html>
