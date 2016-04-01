<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 04/01/2016
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <title>注册成功</title>
</head>
<body>
<jsp:useBean id="me"
             class="com.wolfogre.UserBean">
    <jsp:setProperty name="me" property="username"
                     value="Jason Song"/>
    <jsp:setProperty name="me" property="age"
                     value="23"/>
    <jsp:setProperty name="me" property="sex"
                     value="male"/>
</jsp:useBean>

<p>My Name:
    <jsp:getProperty name="me" property="username"/>
</p>
<p>My Last Name:
    <jsp:getProperty name="me" property="age"/>
</p>
<p>My Age:
    <jsp:getProperty name="me" property="sex"/>
</p>
</body>
</html>
