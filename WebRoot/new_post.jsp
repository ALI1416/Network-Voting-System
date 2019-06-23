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
<title>新发布</title>
<meta charset="utf-8">
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<style>
.a>tbody>tr>td {
	border: 0px;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".btn-danger").on("click", function() {
			$(this).parent().parent().parent().remove();
		});
	});
	function add() {
		$("#add").after("<tr><td>选项：</td><td><div class='form-inline'><input type='text' class='form-control' size='60'>&emsp;<input type='button' class='btn btn-danger' value='删除'></div></td></tr>");
		$(function() {
			$(".btn-danger").on("click", function() {
				$(this).parent().parent().parent().remove();
			});
		});
	}
	function post() {
		var option = [];
		var introduce = $('textarea').val(); // 获取textarea
		var txt = $("table").find(':text'); // 获取所有文本框
		var title = txt.eq(0).val(); //标题
		var max_poll = txt.eq(1).val(); //最大选择数量
		var poll_type = $('input:radio[name="poll_type"]:checked').val();//投票类型
		var open_show = $('#open_show').is(':checked')?0:1;
		var open_poll = $('#open_poll').is(':checked')?0:1;
		var open_result = $('#open_result').is(':checked')?0:1;
		for (var i = 2; i < txt.length; i++) {
			var a = {};
			a.optionText = txt.eq(i).val();
			option.push(a);
		}
		$.ajax({
			url : "<%=basePath%>post/add",
			type : "post",
			data : JSON.stringify({
				userId : ${sessionScope.id },
				title : title,
				introduce : introduce,
				maxPoll:max_poll,
				pollType:poll_type,
				openShow:open_show,
				openPoll:open_poll,
				openResult:open_result,
				option : option
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(data) {
				if (data != 0) {
					alert("发布成功！");
				} else {
					alert("发布失败！");
				}
			}
		});
	}
</script>
</head>
<body>
	<div>
		<table class="table a">
			<tr>
				<td>类型：</td>
				<td>
					<input type="radio" name="poll_type" value="0" checked />单选&emsp;<input type="radio" name="poll_type" value="1" />多选&emsp;<input type="radio" name="poll_type" value="2" />多次
				</td>
			</tr>
			<tr>
				<td style="width: 80px;">标题：</td>
				<td>
					<input type="text" id="title" class="form-control">
				</td>
			</tr>
			<tr>
				<td>介绍：</td>
				<td>
					<textarea class="form-control" rows="5" cols="10"></textarea>
				</td>
			</tr>
			<tr>
				<td>权限：</td>
				<td>
					<input id="open_show" type="checkbox" checked />公开显示&emsp;<input id="open_poll" type="checkbox" checked />公开投票&emsp;<input id="open_result" type="checkbox" checked />公开结果
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
			<tr id="add">
				<td>
					<input type="button" class="btn btn-primary btn-group-justified" value="新增" onClick="add()">
				</td>
				<td>
					<input type="button" class="btn btn-success btn-group-justified" value="发布" onClick="post()">
				</td>
			</tr>
			<tr>
				<td>选项：</td>
				<td>
					<div class="form-inline">
						<input type="text" class="form-control" size="60">&emsp;<input type="button" class="btn btn-danger" value="删除">
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>