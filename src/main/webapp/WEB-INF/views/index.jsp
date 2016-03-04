<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>君厨 -v0.1</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/app.css">
<style>
.middle-text {
	color: #000000;
	font-size: 25px;
	font-weight: 200;
	margin-bottom: 20px;
	text-align: center;
}

.middle-wrapper {
	margin-top: 35px;
}

.middle-title {
	color: #8C8C8C;
	font-size: 22px;
	font-weight: 300;
	margin-bottom: 20px;
	text-align: center;
}
.middle-item{
    text-align: center;
    margin-top:15px;
}
.middle-item-title{
    color: #E7694F;
    font-size: 20px;
    font-weight: bold;
    margin-top: 10px;
}

.middle-img-chef-hat {
	background-image: url("resources/img/chef-hat.png");
	background-color: white;
	background-position: center center;
	background-repeat: no-repeat;
	background-size: initial;
	min-height: 100px;
}
.middle-img-equipment{
    background-image: url("resources/img/equipment.png");
    background-color: white;
    background-position: center center;
    background-repeat: no-repeat;
    background-size: initial;
    min-height: 100px;
}
.middle-img-calendar{
    background-image: url("resources/img/calendar.png");
    background-color: white;
    background-position: center center;
    background-repeat: no-repeat;
    background-size: initial;
    min-height: 100px;
}
.middle-img-heart{
    background-image: url("resources/img/heart.png");
    background-color: white;
    background-position: center center;
    background-repeat: no-repeat;
    background-size: initial;
    min-height: 100px;
}
</style>
</head>
<body>
	<%@include file="pub/nav.jsp"%>
	<div id="homebg">
		<div id="hello" class="text-center">
			<span class="big-title">君厨</span>
			<h2>是谁来自山川湖海 却囿于昼夜 厨房与爱</h2>
			<div id="hello-info">
				<button class="btn btn-primary btn-lg">登入</button>
				<button class="btn btn-primary btn-lg">注册</button>
			</div>
		</div>
	</div>
	<div class="container">
		<div
			class="middle-wrapper col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
			<div class="middle-text">您将以最低200元的价格请一位专业的大厨到您自家的厨房，繁琐劳累的烹饪任务将从您计划中排除，便捷而又精致，尽情享受与家人的美好时光。</div>
		</div>
		<div class="col-sm-12">
			<div class="middle-title">---服务特点---</div>
		</div>
		<div class="col-sm-10 col-sm-offset-1">
			<div class="row">
                <div class="col-xs-12 col-sm-3">
                    <div class="middle-item">
                        <div class="middle-img-chef-hat"></div>
                        <h4 class="middle-item-title">使用厨房</h4>
                        <p>大厨烹饪，服务，清洁，一切都在1小时内完成。</p>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-3">
                    <div class="middle-item">
                        <div class="middle-img-equipment"></div>
                        <h4 class="middle-item-title">准备工作</h4>
                        <p>大厨自带专业烹饪设备与指定的上等食材。</p>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-3">
                    <div class="middle-item">
                        <div class="middle-img-calendar"></div>
                        <h4 class="middle-item-title">计划之中</h4>
                        <p>设定您喜欢的晚餐时间，免除劳心琐事。</p>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-3">
                    <div class="middle-item">
                        <div class="middle-img-heart"></div>
                        <h4 class="middle-item-title">美好时光</h4>
                        <p>享受精致菜肴，分享更多的时间给相爱之人</p>
                    </div>
                </div>
			</div>
		</div>
	</div>


	<%@include file="pub/footer.jsp"%>






	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>