<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增客户</title>
<script type="text/javascript">
	function reLogin() {
		var r = confirm("确认注销登录？")
		if (r == true) {
			window.location.href = "login.jsp"
		} else {

		}
	}
</script>
<link rel="stylesheet" type="text/css" href="CSS/background.css">
</head>
<body>
	<button onclick="reLogin()" style="float: right;">注销登录</button>
	<div style="width: 1500px; height: 50px; background-color: black;"></div>
	<div class="navigationbackground">
		<div class="navigation">

			<br> <a>查询统计</a><br> <a href="admin_infoquery.jsp">合同信息查询</a>
			<br> <a href="admin_processquery.jsp">合同流程查询</a> <br> <br>
			<a>基础数据管理</a><br> <a href="admin_contractmanage.jsp">合同信息管理</a>
			<br> <a href="admin_clientmanage.jsp">客户信息管理</a> <br> <br>
			<a>系统管理</a><br> <a href="admin_distribution.jsp">分配合同</a> <br>
			<a href="admin_authoritymanage.jsp">权限管理</a> <br>
				 

		</div>
	</div>

	<div class="mainbackground">
		<div class="mainview">

			<form name="insertclientform" id="insertclientform" method="get" action="Admininsertclient">
				<h3>添加客户</h3>
				客户名称:<input type="text" id="clientname" name="clientname"
					style="margin-left: 10px; width: 150px;"> <br>电话:<input
					type="text" id="clienttelno" name="clienttelno"
					style="margin-left: 42px; width: 150px;"><br>地址:<input
					type="text" id="clientloc" name="clientloc"
					style="margin-left: 10px; width: 150px;"> <br>传真:<input
					type="text" id="clientfax" name="clientfax"
					style="margin-left: 10px; width: 150px;"> <br> 邮编:<input
					type="text" id="clientmail" name="clientmail"
					style="margin-left: 10px; width: 150px;"> <br>银行名称:<input
					type="text" id="clientbankname" name="clientbankname"
					style="margin-left: 10px; width: 150px;"> <br>银行账号:<input
					type="text" id="clientbankno" name="clientbankno"
					style="margin-left: 10px; width: 150px;"> <br> 备注：<br>
				<textarea
					style="overflow: scroll; overflow-x: hidden; height: 200px; width: 100%;"
					form="insertclientform" name="newclient" id="newclient"></textarea>
				<br> <input type="submit" value="提交" style="margin-left: 40px">
				<input type="button" value="重置" style="margin-left: 10px"
					onclick="window.location.href='admin_insertclient.jsp'">
			</form>

		</div>
	</div><div class="photo"></div>
</body>
</html>