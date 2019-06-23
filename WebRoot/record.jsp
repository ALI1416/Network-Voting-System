<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>我的投票</title>
<meta charset="utf-8">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>css/toPage.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/toPage.js"></script>
</head>
<body>
	<div>
		<table class="table table-bordered table-hover">
			<tr>
				<th>主题</th>
				<th>选项</th>
				<th style="width: 80px;">票数</th>
				<th style="width: 180px;">投票时间</th>
				<th style="width: 80px;">查看详情</th>
			</tr>
			<c:forEach items="${list }" var="i">
				<tr>
					<td>${i.title }</td>
					<td>${i.introduce }</td>
					<td>${i.maxPoll }</td>
					<td>
						<fmt:formatDate value="${i.postDate }" pattern="yyyy年MM月dd日 HH:mm:ss" />
					</td>
					<td>
						<a href="<%=basePath%>post/check/${i.id }"><button class="btn btn-success btn-sm">查看详情</button></a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="toPage"></div>
	<script>
		page_ctrl(${pageNum}, ${pages});
	</script>
</body>
</html>