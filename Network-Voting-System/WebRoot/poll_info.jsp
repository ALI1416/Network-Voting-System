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
<title>投票详情</title>
<meta charset="utf-8">
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function poll() {
		var option = $('input:radio[name="radio"]:checked').val();
		$.ajax({
			url : "<%=basePath%>record/add",
			type : "post",
			data : JSON.stringify({
				userId : ${sessionScope.id },
				optionId : option,
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(data) {
				if (data != 0) {
					alert("投票成功!");
					window.location.reload();
				} else {
					alert("投票失败!");
				}
			}
		});
	}
</script>
<body>
	<div>
		<h4>标题：${post.title }</h4>
		<h4>描述：${post.introduce }</h4>
		<p>投票类型：单选&emsp;发布人：ck&emsp;发布时间：<fmt:formatDate value="${post.postDate }" pattern="yyyy年MM月dd日 HH:mm:ss" /></p>
		<table class="table">
			<tr>
				<td style="width: 50px;">选项</td>
				<td style="width: 100px;">已投票数量</td>
				<td>描述</td>
			</tr>
			<tr>
				<td>
					<input type="radio" name="radio" value="${post.option[0].id }" checked>
				</td>
				<td>${post.option[0].optionNum}</td>
				<td>${post.option[0].optionText}</td>
			</tr>
			<c:forEach items="${post.option }" var="i" begin="1">
				<tr>
					<td>
						<input type="radio" name="radio" value="${i.id }">
					</td>
					<td>${i.optionNum}</td>
					<td>${i.optionText}</td>
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td>
					<button class="btn btn-success" onClick="poll()">投票</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>