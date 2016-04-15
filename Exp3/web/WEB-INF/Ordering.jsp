<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 2016/4/10
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>下单</title>
</head>
<body>
<h1 align="center">确认订单</h1>
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
	<form action="CheckOut" >
		<input type="hidden" name="product_id" value="<%=request.getAttribute("product_id")%>" readonly>
		<div class="form-group">
			<label>商品代码</label>
			<input type="text" name="product_code" class="form-control" value="<%=request.getAttribute("product_code")%>" readonly>
		</div>
		<div class="form-group">
			<label >商品名</label>
			<input type="text" name="product_name" class="form-control" value="<%=request.getAttribute("product_name")%>" readonly>
		</div>
		<div class="form-group">
			<label >商品产自</label>
			<input type="text" name="product_source" class="form-control" value="<%=request.getAttribute("product_source")%>" readonly>
		</div>
		<div class="form-group">
			<label >购买数量</label>
			<input type="number" name="number" class="form-control" placeholder="请输入购买数量">
		</div>
		<!--TODO:应该对购买数量做检查-->
		<button type="submit" class="btn btn-default">下单</button>
	</form>
</div>



</body>
</html>
