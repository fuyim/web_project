$(function () {
    //鼠标移入时小图时能将小图映射到大图‘
    //点击左边图
    $("#productImg-bottom-l").mouseover(function () {
        //改变大图路径
        var imgSrc = "/web_project/img/product/'''";
        $("#productImg").attr("src",imgSrc)
    })
    //点击中间图
    $("#productImg-bottom-c").mouseover(function () {
        //改变大图路径
        var imgSrc = "/web_project/img/product/98.jpg";
        $("#productImg").attr("src",imgSrc)
    })
    //点击右边图
    $("#productImg-bottom-r").mouseover(function () {
        //改变大图路径
        var imgSrc = "/web_project/img/product/181.jpg";
        $("#productImg").attr("src",imgSrc)
    })
})