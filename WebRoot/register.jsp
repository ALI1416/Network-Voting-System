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
<title>注册</title>
<meta charset="utf-8">
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap.min.js"></script>
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
	function register() {
		var name = $("#name").val();
		var pwd = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		var gender = $('input:radio[name="gender"]:checked').val();
		var year = $("#year").val();
		if (name.length == 0) {
			alert("用户名不能为空");
			return;
		}
		if (pwd.length == 0 || pwd2.length == 0) {
			alert("密码不能为空");
			return;
		}
		if (pwd != pwd2) {
			alert("密码不一致");
			return;
		}
		if (year.length == 0) {
			alert("出生年不能为空");
			return;
		}
		$.ajax({
			url : "<%=basePath%>user/register",
			type : "post",
			data : JSON.stringify({
				name : name,
				pwd : pwd,
				gender : gender,
				year : year
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(data) {
				if (data != 0) {
					window.location.href = "<%=basePath%>user/login";
				} else {
					alert("用户名已存在!");
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="b">
		<div>
			<h2>注册</h2>
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
			<tr>
				<td>确认密码：</td>
				<td>
					<input type="password" id="pwd2" class="form-control">
				</td>
			</tr>
			<tr>
				<td>性&emsp;&emsp;别：</td>
				<td>
					<input type="radio" name="gender" value="1" checked>男&emsp;&emsp;<input type="radio" name="gender" value="0">女
				</td>
			</tr>
			<tr>
				<td>出&ensp;生&ensp;年：</td>
				<td>
					<input type="text" id="year" class="form-control">
				</td>
			</tr>
		</table>
		<div>
			<input type="button" value="注册" class="btn btn-success btn-lg" onclick="register()">
		</div>
	</div>
</body>
</html>