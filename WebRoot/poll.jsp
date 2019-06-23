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
<title>投票互填</title>
<meta charset="utf-8">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>css/toPage.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/toPage.js"></script>
<style type="text/css">
.a>tbody>tr>td {
	border: 0px;
}
</style>
<script type="text/javascript">
	function check() {
		var title = $("#title").val();
		window.location.href = "<%=basePath%>post/check?title=" + title;
	}
</script>
</head>
<body>
	<div>
		<table class="table a">
			<tr>
				<td style="width: 80px;">主题：</td>
				<td>
					<input type="text" id="title" class="form-control" value="${title }" />
				</td>
			</tr>
			<!-- 			 <tr> -->
			<!-- 				<td>类型：</td> -->
			<!-- 				<td> -->
			<!-- 					<input type="checkbox" value="1" />单选&emsp;<input type="checkbox" value="2" />多选&emsp;<input type="checkbox" value="4" />多次 -->
			<!-- 				</td> -->
			<!-- 			</tr>  -->
			<!-- 			<tr> -->
			<!-- 				<td>时间范围：</td> -->
			<!-- 				<td> -->
			<!-- 					<div class="form-inline"> -->
			<!-- 						<input type="date" id="before" class="form-control" />&emsp;到&emsp;<input type="date" id="after" class="form-control" />&emsp;&emsp; <input type="button" class="btn btn-success" value="搜索" -->
			<%-- 							onClick="check()" />&emsp;&emsp; <a href="<%=basePath%>post/newPost"><input type="button" class="btn btn-danger" value="发布新的投票"></a> --%>
			<!-- 					</div> -->
			<!-- 				</td> -->
			<!-- 			</tr> -->
			<tr>
				<td>
					<input type="button" class="btn btn-success" value="搜索" onClick="check()" />
				</td>
				<td>
					<a href="<%=basePath%>post/newPost"><input type="button" class="btn btn-danger" value="发布新的投票"></a>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<table class="table table-bordered table-hover">
			<tr>
				<th>主题</th>
				<th style="width: 180px;">发布时间</th>
				<th style="width: 80px;">查看详情</th>
			</tr>
			<c:forEach items="${pageInfo.getList() }" var="i">
				<tr>
					<td>${i.title }</td>
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
		page_ctrl(${pageInfo.getPageNum()}, ${pageInfo.getPages()});
	</script>
</body>
</html>