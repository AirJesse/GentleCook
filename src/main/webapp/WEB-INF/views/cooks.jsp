<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN" xmlns="http://www.w3.org/1999/html">
<head>
<meta charset="UTF-8">
<title>厨师浏览</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/app.css">
	<link rel="stylesheet" href="resources/css/toastr.min.css">
	<style>
		.comment{
			border-bottom: 1px #EEEEEE solid;
			margin-bottom: 20px;
		}
		.comment-user{
			display: inline-block;
		}
		.comment-date{
			display: inline-block;
			right: 0;
			float: right;
			vertical-align: bottom;
			margin-right: 20px;
			padding-top:2px;
		}
		.comment-type{
			display: inline-block;
			right: 0;
			float: right;
			margin-right: 30px;
		}
		.comment-area{
			text-align: left;
		}
		.comment-area textarea{
			width: 50%;
			display: block;
		}
		.comment-list{
			min-height: 200px;
			max-height: 500px;
			overflow: auto;
		}
	</style>
</head>
<body>
	<%@include file="pub/nav.jsp"%>

	<div class="container main-wrapper">
		<div class="col-md-12">
			<div class="filter-wrapper border-bottom">afaf</div>
		</div>
		<div class="col-md-12">
			<div class="list-wrapper">
				<div id="cook-list" class="cook-list">
					<!--样式模板，实际无用-->
					<!--<div id="cook-model" class="cook-item hidden">-->
						<!--<img src="resources/img/holder200x250.png" alt="" class="cook-avatar">-->
						<!--<div class="cook-info">-->
							<!--<h4>-->
								<!--编号:<span name="id">35266</span>-->
							<!--</h4>-->
							<!--<h3>-->
								<!--姓名：<span name="name">张三</span>-->
							<!--</h3>-->
							<!--<span>性别：<span name="gender">男</span></span> <span>年龄:<span-->
								<!--name="age">22</span></span>-->
							<!--<p>-->
								<!--简介：<span name="motto" class="motto">留得青山在，不怕没柴烧</span>-->
							<!--</p>-->
							<!--<p>-->
								<!--擅长：<span name="skill">家常菜 西北菜</span>-->
							<!--</p>-->
							<!--<p class="text-primary acclaim">-->
								<!--好评率：<span name="acclaim">90%</span>-->
							<!--</p>-->
						<!--</div>-->
						<!--<div class="cook-price">-->
							<!--<p class="text-price">-->
								<!--<Strong><span name="price">399</span>元/次</Strong>-->
							<!--</p>-->
							<!--<p class="text-times">-->
								<!--预定次数：<span name="times">2</span>次-->
							<!--</p>-->
						<!--</div>-->
						<!--<div class="cook-operation">-->
							<!--<button name="comment" onclick="showComments(this)"  class="btn btn-primary btn-lg">查看评论</button>-->
							<!--<a name="order" href="" class="btn btn-danger btn-lg">预约</a>-->
						<!--</div>-->
					<!--</div>-->
					<!--以上为样式模板-->
					<!--新样式模板-->
					<div id="cook-model" class="cook-item hidden">
						<img src="resources/img/holder200x250.png" alt="" class="cook-avatar">
						<div class="cook-info">
							<h4>
								编号:<span name="id">35266</span>
							</h4>
							<h3>
								姓名：<span name="name">张三</span>
							</h3>
							<p>
								<span style="white-space: pre-line" name="motto" class="motto">留得青山在，不怕没柴烧</span>
							</p>
							<span>性别：<span name="gender">男</span></span>
							<p>
								擅长：<span name="skill">家常菜 西北菜</span>
							</p>
							<p class="text-primary acclaim">
								好评率：<span name="acclaim">90%</span>
							</p>
						</div>
						<div class="cook-price">
							<p class="text-price">
								<Strong><span name="price">399</span>元起/次</Strong>
							</p>
							<p class="text-times">
								预定次数：<span name="times">2</span>次
							</p>
						</div>
						<div class="cook-operation">
							<button name="comment" onclick="showComments(this)"  class="btn btn-primary btn-lg">查看评论</button>
							<a name="order" href="" class="btn btn-danger btn-lg">预约</a>
						</div>
					</div>
					<!---->
				</div>
			</div>
		</div>
	</div>


	<!--comment Modal-->
	<div id="comment-modal" class="modal fade">
		<div id="comment-cook-id" class="hidden"></div>
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Modal title</h4>
				</div>
				<div class="modal-body">
					<div class="comment-list">
						<div class="comment">
							<h4 class="comment-user">小明</h4>
							<h5 class="comment-date">2015-3-15 13:42</h5>
							<h5 class="comment-type">好评</h5>
							<pre class="bg-info">ssssssssssssssssssssssss</pre>
						</div>
						<div class="comment">
							<h4>小明</h4>
							<pre class="bg-danger">agag</pre>
						</div>
						<div class="comment">
							<h4>小明</h4>
							<pre>粉色</pre>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="comment-area">
					</div>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="submit-comment" type="button" onclick="submitComment(this)" class="btn btn-primary">发表评价</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->


	<%@include file="pub/footer.jsp"%>
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/toastr.min.js"></script>
	<script src="resources/js/dataformat.js"></script>
	<script>
//		var $model = $("#cook-model").clone();
		$.post('cook/getcooks.pub',function(data){
			for(var i in data){
				var $model = $("#cook-model").clone();
				var cook = data[i];
				console.log(data[i]);
				$model.find('.cook-avatar').attr('src',cook.avatar);
				$model.find("span[name='id']").html(cook.id);
				$model.find("span[name='name']").html(cook.name);
				$model.find("span[name='gender']").html(cook.gender);
				$model.find("span[name='motto']").html(cook.motto);
				$model.find("span[name='skill']").html(cook.skill);
				$model.find("span[name='acclaim']").html(cook.acclaim);
				$model.find("span[name='price']").html(cook.price);
				$model.find("span[name='times']").html(cook.times);
				$model.find("button[name='comment']").attr("cook-id",cook.id);
				$model.find("button[name='comment']").attr("cook-name",cook.name);
				$model.find("a[name='order']").attr('href',"ordercook?id="+cook.id);
				$model.removeAttr("id");
				$model.removeClass("hidden");
				$("#cook-list").append($model);
			}
		});



		function showComments(obj){
			$modal = $("#comment-modal");
			$modal.find(".modal-title").html($(obj).attr("cook-name")+" 的评价");
			$("#submit-comment").attr("cook-id",$(obj).attr("cook-id"));
			$.get("cook/getcookcomments.pub",{
				id:$(obj).attr("cook-id")
			},function(data){
				var isLogin = data.isLogin;
				$(".comment-list").html("");
				if(isLogin){
					$("#submit-comment").removeAttr("disabled");
					//$("#comment-form").removeAttr("hidden");
					$(".comment-area").html("");
					$(".comment-area").append($("<h4 style='display: inline-block'>发表评论：</h4>"));
					$(".comment-area").append($("<input type='radio' name='radio-type' onclick='typeChange(this)' value='true' checked='checked'>好评</input>&nbsp;&nbsp;<input type='radio'  name='radio-type' onclick='typeChange(this)' value='false'>差评</input>"));
					$(".comment-area").append($("<textarea class='bg-info' comment-type='true' rows='5'></textarea>"));
				}else{
					$(".comment-area").html("");
					$(".comment-area").append($("<h4><a href='login'>登入之后才能发表评价</a></h4>"));
					$("#submit-comment").attr("disabled",true);
				}
				var comments = data.result;
				for(var i in comments){
					var comment = comments[i];

					var $commentDiv = $("<div class='comment'><h4 class='comment-user'></h4><h5 class='comment-date'></h5> <h4 class='comment-type '></h4> <pre class='comment-content'></pre></div>");
					if(comment.type){
						$commentDiv.find(".comment-type").html("好评");
						$commentDiv.find(".comment-type").addClass("text-success");
						$commentDiv.find(".comment-content").addClass("bg-info");
					}else{
						$commentDiv.find(".comment-type").html("差评");
						$commentDiv.find(".comment-type").addClass("text-warning");
						$commentDiv.find(".comment-content").addClass("bg-danger");
					}
					$commentDiv.find(".comment-user").html(comment.user.username);
					$commentDiv.find(".comment-date").html(new Date(comment.createDate).Format("yyyy-MM-dd hh:mm:ss"));
					$commentDiv.find(".comment-content").html(comment.content);
					$(".comment-list").append($commentDiv);
				}
				$("#comment-modal").modal();
			});
		}



		function submitComment(obj){
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
			if($(".comment-area textarea").val().length <= 6){
				toastr.error("评价字数需要大于6个字符");
			}else {


				console.log("发表评价:" + $(".comment-area textarea").val());
				var type = $(".comment-area textarea").attr("comment-type");
				console.log(type);
				$.ajax({
					url: "cook/submitcomment.do",
					dataType: "html",
					data: {
						content: $(".comment-area textarea").val(),
						id:$(obj).attr("cook-id"),
						type:type
					},
					type: "post",
					success: function () {
						$("#comment-modal").modal("hide");
						toastr.success("发布评价成功！");
					},
					error: function () {
						$("#comment-modal").modal("hide");
						toastr.error("发布评价失败，请刷新页面重试！");
					}

				});
			}
		}

function typeChange(obj){

	if($(obj).val() == "true"){
		$(".comment-area textarea").removeClass("bg-danger");
		$(".comment-area textarea").addClass("bg-info");
		$(".comment-area textarea").attr("comment-type","true");
	}else{
		$(".comment-area textarea").removeClass("bg-info");
		$(".comment-area textarea").addClass("bg-danger");
		$(".comment-area textarea").attr("comment-type","false");
	}
}


	</script>
</body>
</html>