<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>登入成功</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/app.css">
</head>
<body>
	<%@include file="pub/nav.jsp"%>
	<h1 class="text-primary text-center" style="margin-top: 100px">登入成功</h1>
	<p id="tiaozhuan" class="text-center">即将跳转</p>



	<%@include file="pub/footer.jsp"%>






	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script>
		var time = 3;
		$('#tiaozhuan').html("即将跳转："  + time + "秒" );
		setInterval(function(){
			if(time ==0){
				location.href= "index";
			}else{
				time = time-1;
				$('#tiaozhuan').html("即将跳转："  + time + "秒" );
			}
		},1000)
	</script>

</body>
</html>