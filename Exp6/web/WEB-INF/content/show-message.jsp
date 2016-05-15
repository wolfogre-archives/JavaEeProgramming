<%@ page import="com.wolfogre.domain.User" %>
<%@ page import="com.wolfogre.domain.Message" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 2016/4/22
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/BootStrap/css/bootstrap.min.css">

	<!-- DataTables CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/css/jquery.dataTables.min.css">

	<!-- jQuery -->
	<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/DataTables/js/jquery.js"></script>

	<!-- DataTables JS -->
	<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/DataTables/js/jquery.dataTables.min.js"></script>


	<title>用户信息</title>
	<script type="text/javascript" class="init">
		$(document).ready(function() {
			$('#data_table').DataTable({
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
<body>
<%
	User user = (User)session.getAttribute("user");
	List<Message> messageList = (List<Message>)request.getAttribute("messageList");
	HashMap<Integer, String> userMap = (HashMap<Integer, String>)request.getAttribute("userMap");
	if(user == null)
	{
		response.sendRedirect("login.action");
		return;
	}
%>
<div class="page-header">
	<h1 class="text-center">留言列表-<%=user.getLevel() == 0 ? "普通用户":"高级用户"%></h1>
</div>
<table id="data_table" class="display">
	<thead>
	<tr>
		<th width="150px">留言时间</th>
		<th width="100px">留言用户</th>
		<th>留言内容</th>
	</tr>
	</thead>
	<tbody>


<%

	for(Message m : messageList) {
%>
	<tr>
		<td><%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(m.getTime().getTime())%></td>
		<td><%=userMap.get(m.getUserId())%></td>
		<td><%=m.getContent()%></td>
	</tr>
<%
	}
%>
	</tbody>
</table>
<div class="panel panel-default center-block" style="width:400px;padding:30px">
	<form action="add-message.action">
		<div class="form-group">
			<label for="message">留言</label>
			<textarea class="form-control" name="message" id="message" placeholder="请输入留言" required></textarea>
		</div>
		<div class="text-center">
			<button type="submit" class="btn btn-success">&nbsp;&nbsp;&nbsp;&nbsp;发&nbsp;&nbsp;&nbsp;表&nbsp;&nbsp;&nbsp;&nbsp;</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="reset" class="btn btn-warning">&nbsp;&nbsp;&nbsp;&nbsp;重&nbsp;&nbsp;&nbsp;置&nbsp;&nbsp;&nbsp;&nbsp;</button>
		</div>

	</form>
</div>
</html>