<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 04/01/2016
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>检查登录信息</title>
</head>
<body>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String errType = "none";
    if(errType.equals("none") && username.length() == 0) {
        errType = "empty_username";
    }
    if(errType.equals("none") && password.length() == 0) {
        errType = "empty_password";
    }
    if(errType.equals("none") && !username.equals("abc")){
        errType = "wrong_username";
    }
    if(errType.equals("none") && !password.equals("123")) {
        errType = "wrong_password";
    }
    if(errType.equals("none")){
%>
<jsp:forward page="afterLogin.jsp">
    <jsp:param name="useruame" value="<%=username%>"/>
</jsp:forward>
<%
}
else {
%>
<jsp:forward page="index.jsp">
    <jsp:param name="errType" value="<%=errType%>"/>
</jsp:forward>
<%
    }
%>
</body>
</html>
