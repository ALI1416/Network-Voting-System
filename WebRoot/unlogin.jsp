<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta charset="utf-8">
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<style>
.top {
	width: 100%;
	height: 100%;
	position: fixed;
	display: flex;
	flex-direction: column;
}

.nav {
	margin: 5px 10px 0px 10px;
	height: 45px;
}

.frame {
	margin: 10px;
	border: 0px;
	overflow-y: scroll;
	flex: 1;
}
</style>
</head>
<body>
	<div class="top">
		<ul class="nav nav-tabs">
			<li class="active"><a href="<%=basePath%>post/check" target="frame">投票互填</a></li>
			<li class="pull-right"><a href="<%=basePath%>user/register">注册</a></li>
			<li class="pull-right"><a href="<%=basePath%>user/login">登录</a></li>
		</ul>
		<iframe class="frame" name="frame" src="<%=basePath%>post/check"></iframe>
	</div>
</body>
</html>