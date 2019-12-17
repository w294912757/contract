<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增用户</title>
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
			<a href="admin_authoritymanage.jsp">权限管理</a> <br> <a
				href="admin_logmanage.jsp">日志管理</a> <br>

		</div>
	</div>

	<div class="mainbackground">
		<div class="mainview">
			<form name="insertuser" id="insertuserform" method="get" action="Admininsertuser">
				<fieldset>
					<legend>新增用户</legend>
					<br> 用户名:<input type="text" id="username" name="username"
						style="margin-left: 26px; width: 150px;"><br> <font
						class="words">用户名须以字母开头，至少4位（可用字母、数字、下划线）。</font> <br> <br>
					密码:<input type="password" id="pass" name="pass"
						style="margin-left: 42px; width: 150px;"> <br> <font
						class="words">密码请勿设置过于简单，至少六位；建议使用数字、字母混合排列，区分大小写。</font> <br>
					<br>确认密码:<input type="password" id="repass" name="repass"
						style="margin-left: 10px; width: 150px;"> <br> <font
						class="words">重复密码设置一定要与上边密码设置一致</font> <br> <br> <input
						type="submit" value="提交"> <input type="button" value="重置"
						onclick="window.location.href='admin_insertuser.jsp'">
				</fieldset>

			</form>

		</div>
	</div>
	<div class="photo"></div>
</body>
</html>