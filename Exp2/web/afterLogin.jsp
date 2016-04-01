<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 04/01/2016
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <title>登录成功</title>
</head>
<body>
<div style="width:300px;margin-left:auto;margin-right:auto;margin-top:10%;">
    <h1 align="center">登录成功</h1>
    <h1 align="center">欢迎你！<%=request.getParameter("username")%></h1>
</div>
</body>
</html>
