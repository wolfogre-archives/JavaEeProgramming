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
    <title>登录页面</title>
  </head>
  <body>
  <div align = "center">
    <form name="loginForm" method="post" action="judgeUser.jsp" >
      <table>
        <tr>
          <td>用户:<input type="text" name="userName" id="userName"></td>
        </tr>
        <tr>
          <td>密码:<input type="password" name="password" id="password"></td>
        </tr>
        <tr>
          <td><input type="submit" value="登录" style="background-color:pink"> <input type="reset" value="重置" style="background-color:red"></td>
        </tr>
      </table>
    </form>
  </div>
  </body>
</html>
