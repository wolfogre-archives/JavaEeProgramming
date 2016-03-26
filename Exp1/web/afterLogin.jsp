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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <title>登陆成功</title>
</head>
<body style="text-align:center;">
<div class="jumbotron" style="width:50%;margin-left:auto;margin-right:auto;">
    <h1>
        <%
            String name = request.getParameter("userName");
            out.println("欢迎你:" + name);
        %>
    </h1>
    <p><a class="btn btn-primary btn-lg" href="index.jsp" role="button">重新登陆</a></p>
</div>
</body>
</html>
