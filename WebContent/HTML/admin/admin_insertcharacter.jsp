<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增角色</title>
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
			<form name="insertcharacter" id="insertcharacterform" method="get">

				角色名称:<br> <input type="text" id="charactername"
					name="charactername" style="width: 150px;"><br> 描述:
				<textarea
					style="overflow: scroll; overflow-x: hidden; height: 100px; width: 100%;"
					form="draftform" name="draftcontent" id="draftcontent"></textarea>
				权限配置:<br> 合同管理:<br> <input type="checkbox">起草合同 <input
					type="checkbox">定稿合同 <input type="checkbox">查询合同 <input
					type="checkbox">删除合同<br> 流程管理:<br> <input
					type="checkbox">会签合同<input type="checkbox">审批合同 <input
					type="checkbox">签订合同 <input type="checkbox">分配会签<input
					type="checkbox">分配审批 <input type="checkbox">分配签订<input
					type="checkbox">流程查询<br> 用户管理:<br> <input
					type="checkbox">新增用户 <input type="checkbox">编辑用户 <input
					type="checkbox">查询用户 <input type="checkbox">删除用户<br>
				角色管理:<br> <input type="checkbox">新增角色 <input
					type="checkbox">编辑角色 <input type="checkbox">查询角色 <input
					type="checkbox">删除角色<br> 权限管理:<br> <input
					type="checkbox">配置权限 <br>客户管理:<br> <input
					type="checkbox">新增客户 <input type="checkbox">编辑客户 <input
					type="checkbox">查询客户 <input type="checkbox">删除客户<br>
				<br> <input type="submit" value="提交" style="margin-left: 40px">
				<input type="button" value="重置" style="margin-left: 10px"
					onclick="window.location.href='admin_insertcharacter.jsp'">

			</form>
		</div>
	</div><div class="photo"></div>
</body>
</html>