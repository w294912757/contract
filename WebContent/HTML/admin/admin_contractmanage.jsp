<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>合同信息管理</title>
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
	<div style="width: 1500px; height: 100px;  "></div>
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
			<div class="mainview">
				<button id="insertcontract" name="insertcontract"
					style="margin-left: 26px; width: 150px; text-align: center;"
					value="info"
					onclick="window.location.href = 'admin_insertcontract.jsp'">新增合同</button>
				<br> <br>
				<button id="altercontract" name="altercontract"
					style="margin-left: 26px; width: 150px; text-align: center;"
					value="info"
					onclick="window.location.href = 'admin_altercontract.jsp'">修改合同</button>
				<br> <br>


			</div>
		</div>
	</div>
	<div class="photo"></div>
</body>
</html>