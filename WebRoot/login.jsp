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
<title>登录</title>
<meta charset="utf-8">
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<style>
.b {
	width: 300px;
	margin: 10px auto;
}

.b div {
	padding: 5px 0px;
	text-align: center;
}

.a>tbody>tr>td {
	border: 0px;
}
</style>
<script type="text/javascript">
	function login() {
		var name = $("#name").val();
		var pwd = $("#pwd").val();
		if (name.length == 0) {
			alert("用户名不能为空");
			return;
		}
		if (pwd.length == 0) {
			alert("密码不能为空");
			return;
		}
		$.ajax({
			url : "<%=basePath%>user/login",
			type : "post",
			// data表示发送的数据
			data : JSON.stringify({
				name : name,
				pwd : pwd,
			}),
			// 定义发送请求的数据格式为JSON字符串
			contentType : "application/json;charset=UTF-8",
			//定义回调响应的数据格式为JSON字符串,该属性可以省略
			dataType : "json",
			//成功响应的结果
			success : function(data) {
				if (data != 0) {
					window.location.href = "<%=basePath%>";
				} else {
					alert("账号或密码错误!");
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="b">
		<div>
			<h2>登录</h2>
		</div>
		<table class="table a">
			<tr>
				<td>用&ensp;户&ensp;名：</td>
				<td>
					<input type="text" id="name" class="form-control">
				</td>
			</tr>
			<tr>
				<td>密&emsp;&emsp;码：</td>
				<td>
					<input type="password" id="pwd" class="form-control">
				</td>
			</tr>
		</table>
		<div>
			<input type="button" value="登录" class="btn btn-success btn-lg" onClick="login()">
		</div>
	</div>
</body>
</html>