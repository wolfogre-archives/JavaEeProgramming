<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 03/25/2016
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆成功</title>
</head>
<body>
<%
    String name = request.getParameter("userName");
    out.println("欢迎你:" + name);
%>
</body>
</html>
