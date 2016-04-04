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
<jsp:useBean id="new_user" class="com.wolfogre.UserBean" scope="request"/>

<div style="width:50%;margin-left:auto;margin-right:auto;">
    <h1 align="center">恭喜！注册成功！</h1>
    <div style="width:300px;margin-left:auto;margin-right:auto;background-color:antiquewhite">
        <h2>注册名：<jsp:getProperty name="new_user" property="username"/></h2>
        <h2>密码：<jsp:getProperty name="new_user" property="password"/></h2>
        <h2>性别：<%="male".equals(new_user.getSex())?"男":"女"%></h2>
        <h2>国籍：<%
            if("CN".equals(new_user.getCountry()))
                out.print("中国");
            if("US".equals(new_user.getCountry()))
                out.print("美国");
            if("JP".equals(new_user.getCountry()))
                out.print("日本");
            if("DE".equals(new_user.getCountry()))
                out.print("德国");
            if("OTHER".equals(new_user.getCountry()))
                out.print("其它");
        %></h2>
        <h2>邮箱：<jsp:getProperty name="new_user" property="mail"/></h2>
        <h2>电话：<jsp:getProperty name="new_user" property="telephone"/></h2>
    </div>
    <h1 align="center">但是很遗憾，您尚未访问<a href="http://blog.wolfogre.com">狼煞博客</a></h1>
    <h1 align="center">访问1000次以后便可以<a href="index.jsp">登录</a></h1>
</div>

</body>
</html>
