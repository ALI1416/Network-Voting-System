<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<body>
	<div>
		<h4>标题：关于四六级考试情况的调查</h4>
		<h4>描述：本投票为了统计四六级考试和是否通过情况 本投票不会透露个人隐私</h4>
		<p>投票类型：单选&emsp;发布人：ck&emsp;发布时间：2019年06月15日 15:53:38</p>
		<table class="table">
			<tr>
				<td style="width: 100px;">已投票数量</td>
				<td>描述</td>
				<td>投票人</td>
			</tr>
			<tr>
				<td>7</td>
				<td>四六级都过了</td>
				<td>ck888、测试1、测试2、测试3、test1、test2、test3</td>
			</tr>
			<tr>
				<td>3</td>
				<td>四级过了六级还没过</td>
				<td>kkk、ckk、cck</td>
			</tr>
			<tr>
				<td>1</td>
				<td>四级过了还没报考六级</td>
				<td>zk</td>
			</tr>
			<tr>
				<td>1</td>
				<td>四级没过</td>
				<td>hhd</td>
			</tr>
			<tr>
				<td>2</td>
				<td>还没报考四级</td>
				<td>txf、yjm</td>
			</tr>
		</table>
	</div>
</body>
</html>