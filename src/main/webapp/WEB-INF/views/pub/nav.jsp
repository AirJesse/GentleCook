<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.foxlu.gentlecook.entity.User" %>
<nav class="navbar navbar-default navbar-inverse">
        <div class="container">
            <div class="navbar-header">
                <a style="font-size: 2.5em" class="navbar-brand" href="index">君厨</a>
            </div>
            <p class="navbar-text">在线厨师预约</p>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="index">首页</a></li>
                <li><a href="cooks">浏览</a></li>
                <li><a href="usercenter">个人中心</a></li>
                <%if(session.getAttribute("currentUser") != null){%>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
                    <%=((User)session.getAttribute("currentUser")).getUsername()%>
                    <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="logout.pub">注销</a>
                    </ul>
                </li>
                <%} %>
            </ul>
        </div>
</nav>