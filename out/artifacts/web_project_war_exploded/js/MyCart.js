$(function(){
    // //1.全选
    // $("#selectAll").click(function(){
    //     $("input[type=checkbox]").prop("checked",true);
    //     cal();
    // })
    //
    // //2.反选
    // $("#cancel").click(function(){
    //     $("input[type=checkbox]").each(function(){
    //         this.checked = !this.checked;
    //     });
    //     cal();
    // })
    // //3.删除所选
    // $("#delete").click(function(){
    //     var flag = confirm("确定要删除吗？");
    //     if (flag) {
    //         $("input[type=checkbox]").each(function () {
    //             if (this.checked) {
    //                 $(this).parent().parent().parent().remove();
    //             }
    //             ;
    //         });
    //     }
    //     cal();
    // })
    // //4.直接删除
    // $("a.lastTab").click(function(){
    //     var flag = confirm("确定要删除吗？");
    //     if(flag) {
    //         $(this).parent().parent().remove();
    //     }
    //     cal();
    // });
    // //5.数量加减
    // $(".add").click(function(){
    //     //点击添加按钮，哥哥的value属性的值要加1
    //         $(this).prev().val(parseInt($(this).prev().val())+1);
    //         cal();
    //
    // })
    // $(".min").click(function(){
    //     //点击添加按钮，哥哥的value属性的值要加1
    //     var n = parseInt($(this).next().val());//当前的数量
    //     if(n>1){
    //         n = n-1
    //     }else{
    //         n =1
    //     }
    //     $(this).next().val(n);
    //     cal();
    // })
    // //6.计算商品数量和金额
    // function cal(){
    //     var count = 0;//商品的数量
    //     var sum = 0;//商品的总金额
    //
    //     $(".num").each(function(){
    //         var t = $(this).parent().siblings(".firstTab").children()[0];
    //         if(t.checked){
    //             console.log(1);
    //             count += parseInt(this.value);
    //             sum += eval(this.value+"*"+$(this).parent().prev().text());
    //             console.log(count);
    //             console.log(sum);
    //         }
    //     })
    //     //计算完成然后设置总金额和数量
    //     $("#count").text(count);
    //     $("#total").text(sum);
    //     $("#header-total").text(sum)
    //
    // }
    // //手动点击复选框也要计算金额和数量
    // $("input[type=checkbox]").click(function(){
    //     cal();
    // })


})
