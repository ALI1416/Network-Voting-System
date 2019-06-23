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
<script type="text/javascript" src="<%=basePath%>js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
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
<script>
	$(function() {
		$("a").on("click", function() {
			$("li").removeClass("active");
			$(this).parent().addClass("active");
		});
	});
</script>
</head>
<body>
	<div class="top">
		<ul class="nav nav-tabs">
			<li class="active"><a href="<%=basePath%>post/check" target="frame">投票互填</a></li>
			<li><a href="<%=basePath%>post/myPost/${sessionScope.id }" target="frame">我的发布</a></li>
			<li><a href="<%=basePath%>record/myRecord/${sessionScope.id }" target="frame">我的投票</a></li>
			<li><a href="<%=basePath%>user/myInfo/${sessionScope.id }" target="frame">我的信息</a></li>
			<li class="pull-right"><a href="<%=basePath%>user/logout">退出</a></li>
		</ul>
		<iframe class="frame" name="frame" src="<%=basePath%>post/check"></iframe>
	</div>
</body>
</html>