<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
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
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <title>用户表管理</title>
</head>
<body>
<%
    String exception = "";
    try {
        //加载数据库驱动
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/shopdb";
        Connection conn = DriverManager.getConnection(url, "root", "DBlocal");

%>
<table border=1px width=100%>
    <h3>联系人信息</h3>
    <tr>
        <th>编号</th> <th>姓名</th> <th>电话</th> <th>QQ</th> <th>Email</th>
    </tr>
    <%
        String sql="select * from user";
        //System.out.println(sql);
        PreparedStatement pstm =conn.prepareStatement(sql);
        // System.out.println("======");
        ResultSet rt =pstm.executeQuery();
        //System.out.println("++++++");
        while(rt.next()){
            int  no = rt.getInt(1);
            // String name=  rt.getString(2);
    %>
    <tr>
        <td><%=no  %></td>
        <td><%=rt.getString("id")  %></td>
        <td><%=rt.getString(2)   %></td>
        <td><%=rt.getLong(3)   %></td>
    </tr>

    <%
        }
        } catch (Exception ex) {
            exception = ex.getMessage() + ex.getLocalizedMessage();
        }
    %>
</table>

    <%=exception%>
</body>
    <p>连接</p>
</html>
