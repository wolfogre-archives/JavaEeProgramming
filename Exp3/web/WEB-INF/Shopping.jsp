<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 2016/4/9
  Time: 23:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>购物</title>
</head>
<body>
<h1 align="center">购物</h1>
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
	<p align="right" class="lead"><a href="index.jsp" >回到主页</a></p>
	<form action="Ordering">
		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
				<th width="10%">编号</th>
				<th>商品号</th>
				<th>商品名</th>
				<th>货源</th>
				<th width="80px"></th>
			</tr>
			<%
				List<String[]> tableLines = (List<String[]>)request.getAttribute("table_lines");
				if(tableLines != null)
					for(String[] line: tableLines) {
						out.println("<tr>");
						for (String data : line) {
							out.println("<td>" + data + "</td>");
						}
						out.println("<td><input type=\"submit\" name=\"btn_buy_" + line[0] + "\" value=\"买买买\"/></td>");
						out.println("</tr>");
					}
			%>
		</table>
	</form>
</div>
</body>
</html>
