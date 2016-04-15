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
<%
	String error = (String)request.getAttribute("error");
	if(error != null && !error.isEmpty()){
%>
<div style="width:50%; height:30px" class="center-block" align="center">
	<p style="font-size:large;height:100%" class="bg-danger"><strong>错误：<%=error%></strong></p>
</div>
<%
	} else{
%>
<h1 align="center">下单成功</h1>
</body>
<%
	}
%>
<h2 align="center"><a href="ShopRecords">查看所有订单</a></h2>
</html>
