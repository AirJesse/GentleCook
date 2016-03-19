<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登入</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/app.css">
    <link rel="stylesheet" href="resources/css/bootstrapValidator.min.css">
	<style>
		#top-title{
			text-align: center;
			margin-top: 33px;
			margin-bottom: 46px;
			font-size: 30px;
			font-weight: bold;
			color: #E7694F;
		}
		#login-form div{
			margin-bottom:20px;
		}
	</style>
</head>
<body>
<%@include file="pub/nav.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h1 id="top-title">登入到君厨</h1>
			</div>
			<div class="col-sm-6 col-sm-offset-3 col-lg-4 col-lg-offset-4">
				<form id="login-form" action="javascript:;"  method="post">
					<div class="form-group">
						<input class="form-control" name="username" type="text" placeholder="用户名">
					</div>
					<div class="form-group">
						<input class="form-control" name="password" type="password" placeholder="密码">
					</div>
					<div class="form-group">
						<button id="login-btn"  class="btn btn-block btn-success">登入</button>
					</div>
				</form>
				<p id="failed-login" class="text-danger text-center hidden" >用户名或密码错误！</p>
			</div>
		</div>
	</div>



<%@include file="pub/footer.jsp"%>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/bootstrapValidator.min.js"></script>
<script src="resources/js/jquery.form.js"></script>
<script src="resources/js/app.js"></script>
<script>
	$("#login-btn").click(function(){
		$.post("login.pub",{
			username:$("input[name='username']").val(),
			password:$("input[name='password']").val()
		},function(data){
			console.log(data);
			if(data =='successlogin'){
				window.location.href = "index";
			}else{
				console.log(1211);
				$("#failed-login").removeClass("hidden");
			}
		});
	})

</script>

</body>
</html>