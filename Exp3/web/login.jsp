<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 2016/4/9
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>用户登录</title>
</head>
<body>
<h1 align="center">登录</h1>
<%
	String error = (String)request.getAttribute("error");
	if(error != null && !error.isEmpty()){
%>
<div style="width:50%; height:30px" class="center-block" align="center">
	<p style="font-size:large;height:100%" class="bg-danger"><strong>错误：<%=error%></strong></p>
</div>
<%
	}
%>
<div style="width:30%;" class="center-block">
	<p align="right" class="lead"><a href="index.jsp" >回到主页</a></p>
	<form action="CheckUser" >
		<div class="form-group">
			<label>用户名</label>
			<input type="text" name="username" class="form-control" placeholder="请输入用户名">
		</div>
		<div class="form-group">
			<label >密码</label>
			<input type="password" name="password" class="form-control" placeholder="请输入密码">
		</div>
		<button type="submit" class="btn btn-default">登陆</button>
		<button type="reset" class="btn btn-default">重置</button>
	</form>
</div>

</body>
</html>
