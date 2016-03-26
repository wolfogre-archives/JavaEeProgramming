<%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 03/23/2016
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <title>登录页面</title>
  </head>
  <body style="text-align:center;">
  <div style="width:300px;margin-left:auto;margin-right:auto;">
    <%
      String errInfo = request.getParameter("errInfo");
      if("yes".equals(errInfo))
        out.println("<div class=\"alert alert-danger\" role=\"alert\">用户名或密码错误！</div>");
    %>
    <form name="loginForm" method="post" action="judgeUser.jsp" >
      <div class="form-group">
        <label for="exampleInputEmail1">用户名</label>
        <input type="text" name="userName" class="form-control" id="exampleInputEmail1" placeholder="请输入用户名">
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">密码</label>
        <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="请输入密码">
      </div>
      <button type="submit" class="btn btn-default">登陆</button>
      <button type="reset" class="btn btn-default">重置</button>
    </form>
  </div>

  </body>
</html>
