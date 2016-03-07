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
				<form id="login-form" action="login.pub" method="post">
					<div class="form-group">
						<input class="form-control" name="username" type="text" placeholder="用户名">
					</div>
					<div class="form-group">
						<input class="form-control" name="password" type="passowrd" placeholder="密码">
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-block btn-success">
					</div>
				</form>
			</div>
		</div>

	</div>



<%@include file="pub/footer.jsp"%>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/bootstrapValidator.min.js"></script>
<script src="resources/js/jquery.form.js"></script>
<script src="resources/js/app.js"></script>

</body>
</html>