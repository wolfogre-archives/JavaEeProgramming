<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 2016/4/13
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>下单结果</title>
</head>
<body>
<h1 align="center">下单结果q</h1>
<%
	String error = (String)request.getAttribute("error");
	//TODO:这里却显示error为空
	if(error != null && !error.isEmpty()){
%>
<div style="width:50%; height:30px" class="center-block" align="center">
	<p style="font-size:large;height:100%" class="bg-danger"><strong>错误：<%=error%></strong></p>
</div>
<%
	}
%>
</body>
</html>
