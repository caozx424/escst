<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="keywords" content="admin, dashboard, bootstrap, template, flat, modern, theme, responsive, fluid, retina, backend, html5, css, css3">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">
    <title>智慧工地大数据云服务平台</title>
    <link href="${ctx}/resources/static/css/style.css" rel="stylesheet">
</head>

<body id="login">
<div class="login-logo">
    <img src="${ctx}/resources/static/images/dllogo.png" alt=""/>
</div>
<div class="app-cam">
    <form action="${ctx}/login" method="POST">
        <p>
            用户名：<input type="text" name="username" class="text" value="<shiro:principal/>" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '用户名';}">
            密码：<input type="password" name="password" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '密码';}">
            自动登录：<input type="checkbox" name="rememberMe" value="true"><br/>
            <div class="error">${error}</div>
        </p>
        <div class="submit"><input type="submit" onclick="" value="登录"></div>
        <ul class="new">
            <li class="new_left"><p><a href="javascript:void(-1)">忘记密码 ?</a></p></li>
            <li class="new_right"><p class="sign"><a href="javascript:void(-1)">注册</a></p></li>
        </ul>
    </form>
</div>
</body>
</html>
