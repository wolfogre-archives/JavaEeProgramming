<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 2016/4/22
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/BootStrap/css/bootstrap.min.css">

  <title>用户登录</title>
</head>
<body>
<div class="page-header">
  <h1 class="text-center">用户登录</h1>
</div>
<%
  if(request.getAttribute("error") != null){
%>
<div class="alert alert-danger center-block" role="alert" style="width: 500px;" align="center">
  <strong>错误：</strong><%=request.getAttribute("error")%>
</div>
<%
  }
%>
<div class="panel panel-default center-block" style="width:400px;padding:30px">
  <form action="check-login.action">
    <div class="form-group">
      <label for="username">用户名</label>
      <input type="text" class="form-control" name="username" id="username" placeholder="请输入用户名" required>
    </div>
    <div class="form-group">
      <label for="password">密码</label>
      <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码" required>
    </div>

    <div class="text-center">
      <button type="submit" class="btn btn-success">&nbsp;&nbsp;&nbsp;&nbsp;登&nbsp;&nbsp;&nbsp;录&nbsp;&nbsp;&nbsp;&nbsp;</button>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <button type="reset" class="btn btn-warning">&nbsp;&nbsp;&nbsp;&nbsp;重&nbsp;&nbsp;&nbsp;置&nbsp;&nbsp;&nbsp;&nbsp;</button>
    </div>
    <div class="text-right">
      <br/>
      <a href="register.action">还没有账户？立即注册</a>
    </div>
  </form>
</div>
</body>
</html>