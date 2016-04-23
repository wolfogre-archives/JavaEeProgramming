<%@ page import="com.wolfogre.domain.Product" %>
<%@ page import="java.util.List" %>

<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 2016/4/22
  Time: 10:35
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
	<!-- DataTables CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables-1.10.11/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/DataTables-1.10.11/js/jquery.js"></script>
	<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/DataTables-1.10.11/js/jquery.dataTables.js"></script>
	<title>购物</title>
	<script type="text/javascript" class="init">
		$(document).ready(function() {
			$('#product').DataTable({
				language: {
					"sProcessing": "处理中...",
					"sLengthMenu": "显示 _MENU_ 项结果",
					"sZeroRecords": "没有匹配结果",
					"sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
					"sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
					"sInfoFiltered": "(由 _MAX_ 项结果过滤)",
					"sInfoPostFix": "",
					"sSearch": "搜索:",
					"sUrl": "",
					"sEmptyTable": "表中数据为空",
					"sLoadingRecords": "载入中...",
					"sInfoThousands": ",",
					"oPaginate": {
						"sFirst": "首页",
						"sPrevious": "上页",
						"sNext": "下页",
						"sLast": "末页"
					},
					"oAria": {
						"sSortAscending": ": 以升序排列此列",
						"sSortDescending": ": 以降序排列此列"
					}
				}
			});
		});
	</script>
</head>
<div class="page-header">
	<h1 class="text-center">购物</h1>
</div>
<body>

<table id="product" class="display" cellspacing="0" width="100%">
	<thead>
	<tr>
		<th>商品编号</th>
		<th>商品代码</th>
		<th>商品名称</th>、
		<th>商品产地</th>
		<th></th>
	</tr>
	</thead>

	<tbody>

	<%
		List<Product> productList = (List<Product>)request.getAttribute("productList");
		for(Product product : productList)
		{
	%>
	<tr>
		<td><%=product.getId()%></td>
		<td><%=product.getProductCode()%></td>
		<td><%=product.getProductName()%></td>
		<td><%=product.getProductSource()%></td>
		<td><a href="Order.action?id=<%=product.getId()%>">买买买！！！</a></td>
	</tr>
	<%
		}
	%>
	</tbody>
</table>

</body>
</html>
