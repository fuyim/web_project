<%@ page import="obtk.com.e324.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的收获地址</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <script src="../bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/updatePassWord.css">
    <script src="../js/updatePassWord.js"></script>
    <script src="../js/header.js"></script>
    <script src="../js/include.js"></script>
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/MyAddress.css">
    <script src="../js/MyAddress.js"></script>
</head>
<script>
    $(function () {
        var setDefault = 0;
        var isDelete = 0;
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

        //点击清空按钮将值清空
        $("#clear").click(function () {
            var reapName = $("#reapName").val(""); //收获人值
            var province = $("#province").val("===省份==="); //省下拉框值
            var city = $("#city").val("===城市==="); //市下拉框值
            var area = $("#area").val("===区县==="); //区下框值
            var particular = $("#particular").val(""); //详细地址
            var phone = $("#shouji").val("");//手机号
            var email = $("#MyAddress-email").val("");//电子邮件
        })
        var defaultAddress;
        $.get("/web_project/UpdateAddressDefault",{setDefault:setDefault,isDelete:isDelete},function (data) {
            var address_body = "";
            for (var i=0;i<data.length;i++){
                var defaultAddress = data[i].isDefault == 1 ? "默认地址"  : "";
                var body = '<div class="MyAddress-body-center-r-body">' +
                    '            <div class="top">\n' +
                    '            <div class="MyAddress-body-center-r-body-top-l">\n' +
                    '                <span style="font-size: 20px">'+data[i].username+'</span>\n' +
                    '                <span style="font-size: 20px">'+data[i].province+'</span>\n' +
                    '            </div>\n' +
                    '            <div class="MyAddress-body-center-r-body-top-c">\n' +
                    '                <span>'+defaultAddress+'</span>\n' +
                    '            </div>\n' +
                    '            <div class="MyAddress-body-center-r-body-top-r">\n' +
                    '                <span style="font-size: 20px;" class="close">×</span>\n' +
                    '            </div>\n' +
                    '            </div>\n' +
                    '            <div class="MyAddress-center">\n' +
                    '            <div class="MyAddress-body-center-r-body-center-l">\n' +
                    '                <div><label style="color: #999999">收货人:</label><span>'+data[i].reapName+'</span></div>\n' +
                    '                <div><label style="color: #999999">所在地区:</label><span>'+data[i].province+"-"+data[i].city+"-"+data[i].area+'</span></div>\n' +
                    '                <div><label style="color: #999999">地址:</label><span>'+data[i].detail+'</span></div>\n' +
                    '                <div><label style="color: #999999">手机号:</label><span>'+data[i].phone+'</span></div>\n' +
                    '                <div><label style="color: #999999">电子邮件:</label><span>'+data[i].email+'</span></div>\n' +
                    '            </div>\n' +
                    '            </div>\n' +
                    '            <div class="MyAddress-body-center-r-body-footer">\n' +
                    '                <input type="hidden" class="hidden_id" value="'+data[i].id+'">' +
                    '                <a role="button"  class="setDefault">设为默认</a>\n' +
                    '            </div>' +
                    '               </div>';
                if (data[i].isDelete == 0){
                    address_body+=body;
                }

            }
            $("#MyAddress-body-center-r").html(address_body);

            //点击设为默认时将默认地址弹出
            $(".setDefault").click(function () {
                setDefault = 1;
                var pid = $(this).prev().val();
                $.get("/web_project/UpdateAddressDefault",{pid:pid,setDefault:setDefault,isDelete:isDelete},function (data) {
                    location.reload()//当设置完成之后页面刷新一次
                })
            })

            $(".close").click(function () {
                var pid = $(this).parent().parent().next().next().children(".hidden_id").val();
                var flag = confirm("确定删除此地址吗？");
                if (flag){
                    $(this).parent().parent().parent().remove();
                }
                isDelete = 1
                $.get("/web_project/UpdateAddressDefault",{pid:pid,isDelete:isDelete,setDefault:setDefault},function (data) {

                })
            });
        });

        //点击保存按钮新建一个地址框
        $("#save").click(function () {
            var reapName = $("#reapName").val(); //收获人值
            var province = $("#province option:selected").text();
            //省下拉框值
            var city = $("#city option:selected").text(); //市下拉框值
            var area = $("#area option:selected").text(); //区下框值
            var particular = $("#particular").val(); //详细地址
            var phone = $("#shouji").val();//手机号
            var email = $("#MyAddress-email").val();//电子邮件
            if (reapName==""||province==""||city==""||area==""||particular==""||phone==""||email==""){
                alert("请输入完整");
                return;
            }
            $.get("/web_project/AddAddress",{reapName:reapName,province:province,city:city,area:area,particular:particular,phone:phone,email:email},function (data) {

                for (var i=0 ; i<2 ; i++){
                    location.reload()//点击保存页面刷新
                }
            })

             reapName = $("#reapName").val(""); //收获人值
             province = $("#province").val("===省份==="); //省下拉框值
             city = $("#city").val("===城市==="); //市下拉框值
             area = $("#area").val("===区县==="); //区下框值
             particular = $("#particular").val(""); //详细地址
             phone = $("#shouji").val("");//手机号
             email = $("#MyAddress-email").val("");//电子邮件
        })

        //

    })
</script>
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
        &nbsp;<font style="font-size: 20px;color:  #7e7e7e">/</font>&nbsp;<font style=" font-size: 20px;color:  #7e7e7e;">我 的 收 货 地 址</font>
    </div>
</div>
<div class="MyAddress-body">
    <div class="MyAddress-body-l">
        <div class="MyAddress-body-l-top">新增收获地址</div>
        <hr>
        <div class="MyAddress-body-l-body">
            <div>
                <label>*收货人</label>
                <div><input type="text" name="reapName" id="reapName" class="form-control"></div>
            </div>
            <div style="margin-top: 10px;">
                <label>*所在地:</label>
                <select name="province" id="province">
                    <option>===省份===</option>
                </select>
                <select name="city" id="city">
                    <option>===城市===</option>
                </select>
                <select name="area" id="area">
                    <option>===区县===</option>
                </select>
            </div>
            <div style="margin-top: 10px">
                <label>*详细地址</label>
                <div><input type="text" name="particular" id="particular" class="form-control"></div>
            </div>
            <div style="margin-top: 10px">
                <label>*手机号</label>
                <div><input type="text" name="shouji" id="shouji" class="form-control" data-container="body" data-toggle="popover" data-placement="right" data-content="1开头，第二位是“3,4,5,7,8”任意一位的11位数字"></div>
            </div>
            <div style="margin-top: 10px">
                <label>*邮箱</label>
                <div><input type="text" name="email" id="MyAddress-email" class="form-control" data-container="body" data-toggle="popover" data-placement="right" data-content="有效电子邮件(@--.)"></div>
            </div>
        </div>
        <hr>
        <div class="MyAddress-body-center-footer">
        <div style="float: right;margin-right: 40px;">
            <button type="button" class="btn btn-success" id="save">保存</button>
            <button type="button" class="btn btn-danger" id="clear">清空</button>
        </div>
        </div>
    </div>
    <div class="MyAddress-body-center">
    </div>
    <div class="MyAddress-body-center-r" id="MyAddress-body-center-r">
<%--        <div class="MyAddress-body-center-r-body">--%>
<%--            <div class="top">--%>
<%--            <div class="MyAddress-body-center-r-body-top-l">--%>
<%--                <span style="font-size: 20px"><%=user.getUserName()%></span>--%>
<%--                <span style="font-size: 20px" id="MyAddress">湖南</span>--%>
<%--            </div>--%>
<%--            <div class="MyAddress-body-center-r-body-top-c" id="first" style="display: none">--%>
<%--                <span>默认地址</span>--%>
<%--            </div>--%>
<%--            <div class="MyAddress-body-center-r-body-top-r">--%>
<%--                <span style="font-size: 20px;" class="close" id="close">×</span>--%>
<%--            </div>--%>
<%--            </div>--%>
<%--            <div class="MyAddress-center">--%>
<%--            <div class="MyAddress-body-center-r-body-center-l">--%>
<%--                <div><label style="color: #999999">收货人:</label><span>admin</span></div>--%>
<%--                <div><label style="color: #999999">所在地区:</label><span>望城县</span></div>--%>
<%--                <div><label style="color: #999999">地址:</label><span>......</span></div>--%>
<%--                <div><label style="color: #999999">手机号:</label><span>17261307242</span></div>--%>
<%--                <div><label style="color: #999999">电子邮件:</label><span>1243@QQ.com</span></div>--%>
<%--            </div>--%>
<%--            </div>--%>
<%--            <div class="MyAddress-body-center-r-body-footer">--%>
<%--                <a role="button"  class="setDefault">设为默认</a>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>
</div>
</body>
</html>
