<%@ page import="com.wolfogre.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 2016/4/22
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<!-- Bootstrap CSS -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<title>用户信息</title>
</head>
<body>
<div class="page-header">
	<h1 class="text-center">用户信息</h1>
</div>
<%
	User user = (User)request.getAttribute("user");
%>
<h2 class="text-center">用户编号：<%=user.getId()%></h2>
<h2 class="text-center">用户名：<%=user.getUsername()%></h2>
<h2 class="text-center">用户密码：<%=user.getPassword()%></h2>
<h2 class="text-center"><a href="login.action">退出</a> </h2>
</body>
</html>