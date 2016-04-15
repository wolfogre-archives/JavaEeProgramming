<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.wolfogre.DbDao" %>
<%@ page import="java.util.List" %>
<%@ page import="jdk.internal.util.xml.impl.Pair" %>
<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 2016/4/8
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <title>用户表管理</title>
</head>
<body>
<h1 align="center">用户信息管理</h1>

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

<div style="width:90%;" class="center-block">
	<p align="right" class="lead"><a href="Shopping" >继续购物</a></p>
	<form action="UpdateUsers">
		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
				<th width="10%">订单号号</th>
				<th>商品号</th>
				<th>商品名</th>
				<th>源产地</th>
				<th>购买数量</th>
				<th>购买日期</th>
			</tr>
			<%
				//String newLine[] = {String.valueOf(resultSet.getInt("id")), resultSet.getString("productCode"), resultSet.getString("productName"),resultSet.getString("productSource"),String.valueOf(resultSet.getInt("number")),String.valueOf(resultSet.getDate("shopDate")) };
				List<String[]> tableLines = (List<String[]>)request.getAttribute("table_lines");
				if(tableLines != null)
					for(String[] line: tableLines) {
						out.println("<tr>");
						for (String data : line) {
							out.println("<td>" + data + "</td>");
						}
						out.println("</tr>");
					}
			%>
		</table>
	</form>
</div>
</body>
</html>
