<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>删除角色</title>
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
			<form name="characterqueryform" id="characterqueryform" method="get"
				action="">
				<h3>删除角色</h3>
				查找角色:<input type="text" id="charactername" name="charactername"
					style="margin-left: 26px; width: 150px;" placeholder="输入查找条件...">
				<button style="height: 20px; width: 55px; text-align: center;"
					id="searchbutton">search</button>
				<br>

				<table border="1" style="width: 100%">
					<tr>
						<th style="width: 60%;">角色名</th>
						<th>操作</th>
					</tr>
					<tr>
						<td></td>
						<td style="text-align: center;"><input type="submit"
							value="删除"></td>
					</tr>
				</table>
			</form>
		</div>
	</div><div class="photo"></div>
</body>
</html>