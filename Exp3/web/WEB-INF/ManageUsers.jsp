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
<%--
将jsp放在WEB-INF文件夹下可以阻止用户直接访问jsp，
而必须访问Servlet，再由Servlet来跳转，
但这不是最佳办法，访问Servlet本身就不是最佳办法，
继续学习
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
	<p align="right" class="lead"><a href="index.jsp" >回到主页</a></p>
	<form action="UpdateUsers">
		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
				<th width="10%">编号</th>
				<th>用户名</th>
				<th>密码</th>
				<th width="60px"><input type="submit" name="delete_data" value="删除"/></th>
			</tr>
			<%
				List<String[]> tableLines = (List<String[]>)request.getAttribute("table_lines");
				if(tableLines != null)
					for(String[] line: tableLines) {
						out.println("<tr>");
						for (String data : line) {
							out.println("<td>" + data + "</td>");
						}
						out.println("<td><input  type=\"checkbox\" name=\"cb_delete_" + line[0] + "\"/></td>");
						out.println("</tr>");
					}
			%>
			<tr>
				<td><input type="text" class="form-control" placeholder="编号" readonly></td>
				<td><input type="text" name="new_username" class="form-control" placeholder="输入用户名"></td>
				<td><input type="text" name="new_password" class="form-control" placeholder="输入密码"></td>
				<td><input type="submit" name="new_data" value="新增"/></td>

			</tr>
		</table>
	</form>
</div>










<%--
<table border=1px width=100%>
    <h3>用户信息</h3>
    <tr>
    <%
        if(tableTitles != null)
        for(String title: tableTitles) {
            out.print("<th>" + title + "</th>");
        }
    %>
        <th>操作</th>
        <!--<th>编号</th> <th>姓名</th> <th>密码</th><th><input type="submit" name="delete_data" value="删除所选"/></th>-->
    </tr>
    <%
        for(String[] line: tableLines) {
            out.print("<tr><td>");
            for (String data : line) {
                out.print("<td>" + data + "</td>");
            }
            out.print("<td><input type=\"checkbox\" name=\"cb_delete_\"></td>");
            out.print("</tr>");
        }
    %>
    <tr>
        <td><input disabled="disabled" type="text" name="id" class="form-control" placeholder="由系统分配"></td>

        <td><input type="text" name="new_username" class="form-control" placeholder="用户名"></td>
        <td><input type="text" name="new_password" class="form-control" placeholder="密码"></td>
        <td><input type="submit" name="new_data" value="新增记录"/></td>
    </tr>

</table>

</form>
--%>
</body>
</html>
