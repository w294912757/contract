<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改合同</title>
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
			<form name="confirmform" id="confirmform" method="get">
				<h3>定稿合同</h3>
				合同名称:<font> XXX</font> <br>客户:<font> XXX</font><br>开始时间:<font>
					XXX</font> <br>结束时间:<font> XXX</font> <br> 合同内容:<br>
				<textarea
					style="overflow: scroll; overflow-x: hidden; height: 200px; width: 80%;"
					form="confirmform" name="confirmcontent" id="confirmcontent"></textarea>
				<br> 附件:<font style="color: black;">无文件 </font> <br> <br>
				<input type="submit" value="提交" style="margin-left: 40px"> <input
					type="button" value="重置"
					onclick="window.location.href=' admin_confirm.jsp'">
			</form>
		</div>
	</div>
	<div class="photo"></div>
</body>
</html>