<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>厨师预约</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/bootstrap-switch.css">
    <link rel="stylesheet" href="resources/css/app.css">
    <link rel="stylesheet" href="resources/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="resources/css/toastr.min.css">
    <style>
        .order-select-wrap{
            display: inline-block;
            height: 200px;
            vertical-align: top;
            padding:40px;

        }
        .cook-info-wrap{
            display: inline-block;
            padding:20px;
            margin-left:20px;
        }
        .zongjia{
            font-size: 24px;
            border: 1px solid #ffcbfa;
            display: inline-block;
        }
        .user-info{
            margin-top: 10px;

        }
    </style>
</head>
<body>
<%@include file="pub/nav.jsp"%>
<div hidden="hidden">
    <span id="cookId">${cook.id}</span>
    <span id="cookPrice">${cook.price}</span>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
      		<h2>预约：</h2>
      		<hr>
            <div class="cook-info-wrap">
                    <img class="cook-avatar" src="${cook.avatar}" alt="">
                <div class="cook-info">
                    <p>编号：${cook.id}</p>
                    <p>姓名：${cook.name}</p>
                    <p class="motto" style="color: red">${cook.motto}</p>
                </div>
            </div>
            <div class="order-select-wrap">
                <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-primary active" name="label-buyfood" content="1">
                        <input type="radio" name="buyfood"  autocomplete="off" checked> 厨师代买食材
                    </label>
                    <label class="btn btn-info" name="label-buyfood" content="0">
                        <input type="radio" name="buyfood"  autocomplete="off"> 自备食材
                    </label>
                </div><br><br>
                <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-primary active" name="label-foodsize" beilv="1">
                        <input type="radio" name="foodsize"  autocomplete="off"  checked> 四菜一汤
                    </label>
                    <label class="btn btn-info" name="label-foodsize" beilv="2">
                        <input type="radio" name="foodsize"  autocomplete="off" > 六菜一汤
                    </label>
                    <label class="btn btn-danger" name="label-foodsize" beilv="3">
                        <input type="radio" name="foodsize"  autocomplete="off" > 十菜两汤
                    </label>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="row">
        <div  class="col-md-12">
            <h2>总览：</h2>
            <div style="margin-left: 50px;margin-top:20px" class="col-md-4">
                <p>厨师 <b class="text-primary">${cook.name}</b> 基本服务费: <span style="color: red">${cook.price}元</span></p>
                <p class="zl-buyfood">代买食材服务费：<span style="color: red">30元</span></p>
                <p  id="zl-foodsize" class="text-primary ">四菜一汤</p>
                <br><br>
                <p class="zongjia" >总价：<span style="color: red">300元</span></p>
            </div>
            <div class="col-md-6 col-md-offset-1">
                <div class="user-info">
                    <form action="javascript:;" class="form-horizontal">
                       <div class="form-group">
                           <label for="trueName"  >真实姓名：</label>
                           <input  type="text" style="display: inline-block;width: auto" class="form-control"  id="trueName">
                       </div>
                        <div class="form-group">
                            <label for="userPhone">联系方式：</label>
                            <input type="text" style="display: inline-block;width: auto" class="form-control"  id="userPhone">
                        </div>
                        <div class="form-group">
                            <label for="serviceDate">服务时间：</label>
                            <input type="text" style="display: inline-block;width: auto" class="form-control"  data-date-format="yyyy-mm-dd hh:ii" id="serviceDate">
                        </div>
                        <div class="form-group">
                            <label for="userAddress">服务地址：</label>
                            <input type="text"  class="form-control"  id="userAddress">
                        </div>
                        <button id="submit-order" class="btn btn-primary btn-block">提交预约</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>




<%@include file="pub/footer.jsp"%>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/toastr.min.js"></script>
<script src="resources/js/bootstrap-switch.min.js"></script>
<script src="resources/js/dataformat.js"></script>
<script src="resources/js/bootstrap-datetimepicker.min.js"></script>
<script>
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "positionClass": "toast-bottom-full-width",
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };

    $('#serviceDate').datetimepicker({minView: "month", //选择日期后，不会再跳转去选择时分秒
            format: "yyyy-mm-dd", //选择日期后，文本框显示的日期格式
            autoclose:true //选择日期后自动关闭
    });
    $('#serviceDate').val(new Date().Format("yyyy-MM-dd"));


    var cookId = $("#cookId").html();
    var cookPrice = $("#cookPrice").html();
    var beilv = 1; //倍率
    var daimai = true;
    var total = 0;
    updateTotel();
    $("label[name='label-buyfood']").on("click",function(){
        if($(this).attr("content") == 1){
            daimai=true;
            $(".zl-buyfood").removeClass("hidden");
        }else{
            daimai = false;
            $(".zl-buyfood").addClass("hidden");
        }
        updateTotel()
    });
    $("label[name='label-foodsize']").click(function(){
       console.log($(this).attr("beilv"));
        beilv=$(this).attr("beilv");
         var $foodsize =  $("#zl-foodsize");
        if(beilv == 1){
            $foodsize.html("四菜一汤");
            $foodsize.removeClass();
            $foodsize.addClass("text-primary");

        }else if(beilv== 2){
            $foodsize.html("六菜一汤");
            $foodsize.removeClass();
            $foodsize.addClass("text-info");
        }else if(beilv==3){
            $foodsize.html("十菜两汤");
            $foodsize.removeClass();
            $foodsize.addClass("text-danger");
        }
        updateTotel();
    });

    function updateTotel(){
        console.log("update!");
        total = (cookPrice * beilv) + (daimai?30:0);
        console.log(total);
        $(".zongjia").find("span").html(total+"元");
    }

    //提交预约
    $("#submit-order").click(function(){
        console.log(this);
        var trueName = $("#trueName").val();
        var phone = $("#userPhone").val();
        var orderDate = $("#serviceDate").val();
        var address =  $("#userAddress").val();
        var type = $("#zl-foodsize").html();
        $(this).addClass("disabled");
        $.post('cook/submitorder.do',{
            cookId:cookId,
            trueName:trueName,
            phone:phone,
            orderDate:orderDate,
            address:address,
            daimai:daimai,
            type:type,
            price:total
        },function(result){
            console.log(result);
            if(result == true){
                toastr.success("预约成功，正在跳转...");
                setTimeout(function(){
                    location.href = "usercenter?position=order";
                },2000)
            }
        });
    });

</script>
</body>
</html>