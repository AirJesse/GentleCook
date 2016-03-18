<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.foxlu.gentlecook.entity.User" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/app.css">
    <link rel="stylesheet" href="resources/css/usercenter.css">
</head>
<body>
    <%@include file="pub/nav.jsp"%>
    <div class="container">
        <div class="side-nav col-md-2">
            <ul class="list-unstyled">
                <li><button class="btn btn-default btn-lg" tar="userinfo">个人信息</button></li>
                <li><button class="btn btn-default btn-lg" tar="useroder">订单列表</button></li>
                <li><button class="btn btn-default btn-lg" tar="userpwd">密码设置</button></li>
            </ul>
        </div>

        <div class="main-wrapper col-md-10">
            <%if(session.getAttribute("currentUser")==null){
            	response.sendRedirect("login");}else{%>
            	<h2><%=((User)session.getAttribute("currentUser")).getUsername()%> 您好</h2>
            	<p>欢迎进入个人中心。</p>
            	<%} %>
        </div>

    </div>





    <%@include file="pub/footer.jsp"%>
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/dataformat.js"></script>
    <script>
        $("button").click(function(){
            var tar = $(this).attr("tar");
            var path = "resources/part/" + tar + ".html";
            $(".main-wrapper").load(path);
        });
    </script>
</body>
</html>