<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 2016/4/23
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>下单结果</title>
</head>
<body>
<html>
<head>
	<!-- Bootstrap CSS -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<!-- DataTables CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables-1.10.11/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/DataTables-1.10.11/js/jquery.js"></script>
	<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/DataTables-1.10.11/js/jquery.dataTables.js"></script>
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
<div class="page-header">
	<h1 class="text-center">下单成功</h1>
</div>
<%
	}
%>
<h2 align="center"><a href="ShopRecords.action">查看所有订单</a></h2>
</body>
</html>

</body>
</html>
