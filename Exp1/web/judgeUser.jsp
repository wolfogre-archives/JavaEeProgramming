<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 03/25/2016
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆结果</title>
</head>
<body>
<%
    String name = request.getParameter("userName");
    String password = request.getParameter("password");
    if(name.equals("abc")&& password.equals("123")) {
%>
<jsp:forward page="afterLogin.jsp">
    <jsp:param name="userName" value="<%=name%>"/>
</jsp:forward>
<%
}
else {
%>
<jsp:forward page="index.jsp"/>
<%
    }
%>
</body>
</html>
