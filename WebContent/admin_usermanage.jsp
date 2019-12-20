<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户管理</title>
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

			<br> <a>查询统计</a><br> <a href="admin_infoquery.jsp" <%if (request.getSession().getAttribute("contract_query").equals("0")) {%>
				style="display: none;" ;
			<%}%>>合同信息查询</a>
			<br> <a href="admin_processquery.jsp" <%if (request.getSession().getAttribute("process_query").equals("0")) {%>
				style="display: none;" ;
			<%}%>>合同流程查询</a> <br> <br>
			<a>基础数据管理</a><br> <a href="admin_contractmanage.jsp">合同信息管理</a>
			<br> <a href="admin_clientmanage.jsp">客户信息管理</a> <br> <br>
			<a>系统管理</a><br> <a href="admin_distribution.jsp" >分配合同</a> <br>
			<a href="admin_authoritymanage.jsp" <%if (request.getSession().getAttribute("authority_distribute").equals("0")) {%>
				style="display: none;" ;
			<%}%>>权限管理</a> <br>
				 

		</div>
	</div>

	<div class="mainbackground">
		<div class="mainview">
			<button id="insertuser" name="insertuser"
				value="info" onclick="window.location.href = 'admin_insertuser.jsp'" <%if (request.getSession().getAttribute("user_insert").equals("0")) {%>
				style="display: none;" ;}else{style="margin-left: 26px; width: 150px; text-align: center;";
			<%}%>>新增用户</button>
			<br> <br>

			<button id="deleteuser" name="deleteuser"
				value="info" onclick="window.location.href = 'admin_deleteuser.jsp'" <%if (request.getSession().getAttribute("user_delete").equals("0")) {%>
				style="display: none;" ;}else{style="margin-left: 26px; width: 150px; text-align: center;";
			<%}%>>删除用户</button>
			<br> <br>

		</div>
	</div>
	<div class="photo"></div>
</body>
</html>