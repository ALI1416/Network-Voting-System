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
<title>我的信息</title>
<meta charset="utf-8">
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>js/jquery-3.4.1.min.js"></script>
<style>
.b {
	width: 300px;
	margin: 10px auto;
}

.a>tbody>tr>td {
	border: 0px;
}
</style>
<script type="text/javascript">
	function pwd() {
		$("#showPwd").toggle();
	}
	function change() {
		var gender = $('input:radio[name="gender"]:checked').val();
		var year = $("#year").val();
		if (year.length == 0) {
			alert("出生年不能为空");
			return;
		}
		$.ajax({
			url : "<%=basePath%>user/change",
			type : "post",
			data : JSON.stringify({
				id : ${sessionScope.id },
				gender : gender,
				year : year
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(data) {
				if (data != 0) {
					alert("修改成功！");
				} else {
					alert("修改失败！");
				}
			}
		});
	}
	function changePwd() {
		var pwd = $("#pwd").val();
		var newPwd = $("#newPwd").val();
		var newPwd2 = $("#newPwd2").val();
		if (pwd.length == 0 || newPwd.length == 0 || newPwd2.length == 0) {
			alert("密码不能为空");
			return;
		}
		if (newPwd != newPwd2) {
			alert("新密码与确认密码密码不一致");
			return;
		}
		$.ajax({
			url : "<%=basePath%>user/changePwd",
			type : "post",
			data : JSON.stringify({
				id : ${sessionScope.id },
				name : newPwd, //newPwd临时占用name
				pwd : pwd,
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(data) {
				if (data != 0) {
					alert("密码修改成功！");
				} else {
					alert("密码错误！");
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="b">
		<table class="table a">
			<tr>
				<td>用&ensp;户&ensp;名：</td>
				<td>${user.name }</td>
			</tr>
			<tr>
				<td>性&emsp;&emsp;别：</td>
				<td>
					<input type="radio" name="gender" value="1" ${user.gender eq 1 ? 'checked':''}>男&emsp;&emsp;<input type="radio" name="gender" value="0" ${user.gender eq 0 ? 'checked':''}>女
				</td>
			</tr>
			<tr>
				<td>出&ensp;生&ensp;年：</td>
				<td>
					<input type="text" id="year" class="form-control" value="${user.year }">
				</td>
			</tr>
			<tr>
				<td>
					<button class="btn btn-danger" onclick="pwd()">修改密码</button>
				</td>
				<td>
					<button class="btn btn-success btn-group-justified" onclick="change()">修改信息</button>
				</td>
			</tr>
		</table>
		<table class="table a" id="showPwd" style="display:none;">
			<tr>
				<td>旧&ensp;密&ensp;码：</td>
				<td>
					<input type="password" id="pwd" class="form-control">
				</td>
			</tr>
			<tr>
				<td>新&ensp;密&ensp;码：</td>
				<td>
					<input type="password" id="newPwd" class="form-control">
				</td>
			</tr>
			<tr>
				<td>确认密码：</td>
				<td>
					<input type="password" id="newPwd2" class="form-control">
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<button class="btn btn-success btn-group-justified" onclick="changePwd()">修改密码</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>