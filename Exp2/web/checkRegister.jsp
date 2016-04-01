<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 04/01/2016
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>检查注册信息</title>
</head>
<body>
<jsp:useBean id="new_user" class="com.wolfogre.UserBean" scope="request"/>
<jsp:setProperty name="new_user" property="*"/>
<jsp:getProperty name="new_user" property="username"/>
</body>
</html>
