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
<%
    List<String> tableTitles = (List<String>)request.getAttribute("table_titles");
    List<String[]> tableLines = (List<String[]>)request.getAttribute("table_lines");
%>
<form action="UpdateUsers">
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
            out.print("<tr>");
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
</body>
</html>
