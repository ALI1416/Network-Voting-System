<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.net.URLEncoder"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>css/toPage.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/toPage.js"></script>
</head>
<body>
	<h4>批量导入</h4>
	<a href="<%=basePath%>file/template.csv">下载模板</a>
	<form action="<%=basePath%>user/upload" method="post" enctype="multipart/form-data">
		上传文件<input type="file" name="file"><input type="submit" value="上传" class="btn btn-success">
	</form>
	<h4>批量导出</h4>
	<a href="<%=basePath%>user/download">导出文件</a>
	<table class="table table-striped table-bordered table-hover">
		<tr>
			<th>编号</th>
			<th>姓名</th>
			<th>密码</th>
			<th>性别</th>
			<th>出生年</th>
		</tr>
		<c:forEach items="${pageInfo.getList() }" var="i">
			<tr>
				<td>${i.id}</td>
				<td>${i.name}</td>
				<td>${i.pwd}</td>
				<td>${i.gender eq 1 ? '男':'女'}</td>
				<td>${i.year}</td>
			</tr>
		</c:forEach>
	</table>
	<div id="toPage"></div>
	<script>
		page_ctrl(${pageInfo.getPageNum()}, ${pageInfo.getPages()});
	</script>
</body>
</html>
