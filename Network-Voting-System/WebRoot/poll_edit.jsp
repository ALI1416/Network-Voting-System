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
<title>投票编辑</title>
<meta charset="utf-8">
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap.min.js"></script>
<style>
.a>tbody>tr>td {
	border: 0px;
}
</style>
<script type="text/javascript">
	function change() {
		var option = [];
		var introduce = $('textarea').val(); // 获取textarea
		var txt = $("table").find(':text'); // 获取所有文本框
		var id = $("table").find(':hidden');
		var title = txt.eq(0).val(); //标题
		for (var i = 1; i < txt.length; i++) {
			var a = {};
			a.optionText = txt.eq(i).val();
			a.id=id.eq(i-1).val();
			option.push(a);
		}
		$.ajax({
			url : "<%=basePath%>post/change",
			type : "post",
			data : JSON.stringify({
				id:${post.id},
				title : title,
				introduce : introduce,
				option : option
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(data) {
				if (data != 0) {
					alert("修改成功！");
					window.location.reload();
				} else {
					alert("修改失败！");
				}
			}
		});
	}
</script>
<body>
	<div>
		<table class="table a">
			<tr>
				<td style="width: 80px;">标题：</td>
				<td>
					<input type="text" id="title" class="form-control" value="${post.title }">
				</td>
			</tr>
			<tr>
				<td>介绍：</td>
				<td>
					<textarea class="form-control" rows="5" cols="10">${post.introduce }</textarea>
				</td>
			</tr>
			<tr>
				<td>权限：</td>
				<td>
					<input type="checkbox" checked />公开显示&emsp;<input type="checkbox" checked />公开投票&emsp;<input type="checkbox" checked />公开结果
				</td>
			</tr>
			<tr>
				<td style="width:80px;">最大投票数量：</td>
				<td>
					<div class="form-inline">
						<input type="text" class="form-control" size="2">&emsp;次
					</div>
				</td>
			</tr>
			<c:forEach items="${post.option }" var="i">
				<tr>
					<td>选项：</td>
					<td>
						<div class="form-inline">
							<input type="hidden" value="${i.id}"> <input type="text" class="form-control" size="60" value="${i.optionText}">
						</div>
					</td>
				<tr>
			</c:forEach>
			<tr>
				<td>
					<a href="<%=basePath%>post/delete/${post.id}"><button class="btn btn-danger" onClick="del()">删除投票</button></a>
				</td>
				<td>
					<button class="btn btn-success" onClick="change()">修改发布</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>