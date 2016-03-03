<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>厨师浏览</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/app.css">
</head>
<body>
	<%@include file="pub/nav.jsp"%>

	<div class="container main-wrapper">
		<div class="col-md-12">
			<div class="filter-wrapper border-bottom">afaf</div>
		</div>
		<div class="col-md-12">
			<div class="list-wrapper">
				<div class="cook-list">
					<!--样式模板，实际无用-->
					<div class="cook-item">
						<img src="resources/img/holder200x250.png" alt="" class="cook-avatar">
						<div class="cook-info">
							<h4>
								编号:<span name="id">35266</span>
							</h4>
							<h3>
								姓名：<span name="name">张三</span>
							</h3>
							<span>性别：<span name="gender">男</span></span> <span>年龄:<span
								name="age">22</span></span>
							<p>
								简介：<span name="motto" class="motto">留得青山在，不怕没柴烧</span>
							</p>
							<p>
								擅长：<span name="skill">家常菜 西北菜</span>
							</p>
							<p class="text-primary acclaim">
								好评率：<span name="acclaim">90%</span>
							</p>
						</div>
						<div class="cook-price">
							<p class="text-price">
								<Strong><span name="price">399</span>元/次</Strong>
							</p>
							<p class="text-times">
								预定次数：<span name="times">2</span>次
							</p>
						</div>
						<div class="cook-operation">
							<a href="" class="btn btn-primary btn-lg">查看详情</a> <a href=""
								class="btn btn-danger btn-lg">预约</a>
						</div>
					</div>

					<div class="cook-item">
						<img src="resources/img/holder200x250.png" alt="" class="cook-avatar">
						<div class="cook-info">
							<h4>
								编号:<span name="id">35266</span>
							</h4>
							<h3>
								姓名：<span name="name">张三</span>
							</h3>
							<span>性别：<span name="gender">男</span></span> <span>年龄:<span
								name="age">22</span></span>
							<p>
								简介：<span name="motto" class="motto">留得青山在，不怕没柴烧</span>
							</p>
							<p>
								擅长：<span name="skill">家常菜 西北菜</span>
							</p>
							<p class="text-primary acclaim">
								好评率：<span name="acclaim">90%</span>
							</p>
						</div>
						<div class="cook-price">
							<p class="text-price">
								<Strong><span name="price">399</span>元/次</Strong>
							</p>
							<p class="text-times">
								预定次数：<span name="times">2</span>次
							</p>
						</div>
						<div class="cook-operation">
							<a href="" class="btn btn-primary btn-lg">查看详情</a> <a href=""
								class="btn btn-danger btn-lg">预约</a>
						</div>
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