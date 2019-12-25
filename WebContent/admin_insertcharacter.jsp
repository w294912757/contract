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
	<div style="width: 1500px; height: 50px;"></div>
	<div class="navigationbackground">
		<div class="navigation">

			<br> <a>查询统计</a><br> <a href="admin_infoquery.jsp"
				<%if (request.getSession().getAttribute("contract_query").equals("0")) {%>
				style="display: none;" ;
			<%}%>>合同信息查询</a> <br> <a
				href="admin_processquery.jsp"
				<%if (request.getSession().getAttribute("process_query").equals("0")) {%>
				style="display: none;" ;
			<%}%>>合同流程查询</a> <br> <br> <a>基础数据管理</a><br>
			<a href="admin_contractmanage.jsp">合同信息管理</a> <br> <a
				href="admin_clientmanage.jsp">客户信息管理</a> <br> <br> <a>系统管理</a><br>
			<a href="admin_distribution.jsp">分配合同</a> <br> <a
				href="admin_authoritymanage.jsp"
				<%if (request.getSession().getAttribute("authority_distribute").equals("0")) {%>
				style="display: none;" ;
			<%}%>>权限管理</a> <br>


		</div>
	</div>

	<div class="mainbackground">
		<div class="mainview">
			<form name="insertcharacter" id="insertcharacterform" method="get"
				action="Admininsertcharacter">

				角色名称:<br> <input type="text" id="charactername"
					name="charactername" style="width: 150px;"><br> 描述:
				<textarea
					style="overflow: scroll; overflow-x: hidden; height: 100px; width: 100%;"
					name="description" id="description"></textarea>
				权限配置:<br> 合同管理:<br> <input type="checkbox" name="authority"
					value="起草合同">起草合同 <input type="checkbox" name="authority"
					value="定稿合同">定稿合同 <input type="checkbox" name="authority"
					value="查询合同">查询合同 <input type="checkbox" name="authority"
					value="删除合同">删除合同<br> 流程管理:<br> <input
					type="checkbox" name="authority" value="会签合同">会签合同<input
					type="checkbox" name="authority" value="审批合同">审批合同 <input
					type="checkbox" name="authority" value="签订合同">签订合同 <input
					type="checkbox" name="authority" value="分配会签">分配会签<input
					type="checkbox" name="authority" value="分配审批">分配审批 <input
					type="checkbox" name="authority" value="分配签订">分配签订<input
					type="checkbox" name="authority" value="流程查询">流程查询<br>
				用户管理:<br> <input type="checkbox" name="authority" value="新增用户">新增用户
				<input type="checkbox" name="authority" value="编辑用户">编辑用户 <input
					type="checkbox" name="authority" value="查询用户">查询用户 <input
					type="checkbox" name="authority" value="删除用户">删除用户<br>
				角色管理:<br> <input type="checkbox" name="authority" value="新增角色">新增角色
				<input type="checkbox" name="authority" value="编辑角色">编辑角色 <input
					type="checkbox" name="authority" value="查询角色">查询角色 <input
					type="checkbox" name="authority" value="删除角色">删除角色<br>
				权限管理:<br> <input type="checkbox" name="authority" value="配置权限">配置权限
				<br>客户管理:<br> <input type="checkbox" name="authority"
					value="新增客户">新增客户 <input type="checkbox" name="authority"
					value="编辑客户">编辑客户 <input type="checkbox" name="authority"
					value="查询客户">查询客户 <input type="checkbox" name="authority"
					value="删除客户">删除客户<br> <br> <input type="submit"
					value="提交" style="margin-left: 40px"> <input type="button"
					value="重置" style="margin-left: 10px"
					onclick="window.location.href='admin_insertcharacter.jsp'">

			</form>
		</div>
	</div>
	<div class="photo"></div>
</body>
</html>