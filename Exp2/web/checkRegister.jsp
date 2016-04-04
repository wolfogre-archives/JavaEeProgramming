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
<%
    String errType = "none";
    if(errType.equals("none") && new_user.getPassword() == null || new_user.getPasswordAgain() == null)
        errType = "empty_password";
    if(errType.equals("none") && !new_user.getPassword().equals(new_user.getPasswordAgain()))
        errType = "diff_password";
    if(errType.equals("none")){
%>
<jsp:forward page="afterRegister.jsp"/>
<%
    }
    else {
%>
<jsp:forward page="register.jsp">
    <jsp:param name="errType" value="<%=errType%>"/>
</jsp:forward>
<%
    }
%>

</body>
</html>
