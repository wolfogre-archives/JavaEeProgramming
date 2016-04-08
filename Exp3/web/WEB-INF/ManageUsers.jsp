<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.wolfogre.DbDao" %>
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
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <title>用户表管理</title>
</head>
<body>
<table border=1px width=100%>
    <h3>联系人信息</h3>
    <tr>
        <th>编号</th> <th>姓名</th> <th>电话</th> <th>QQ</th> <th>Email</th>
    </tr>
    <%
        DbDao dbDao = new DbDao("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/shopdb","root", "DBlocal");
        ResultSet resultSet = dbDao.query("select * from user");
        while(resultSet.next()){
    %>
    <tr>
        <td><%=resultSet.getInt(1)%></td>
        <td><%=resultSet.getString("id")  %></td>
        <td><%=resultSet.getString(2)   %></td>
        <td><%=resultSet.getLong(3)   %></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
