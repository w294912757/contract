<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增合同</title>
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
			<form name="draftform" id="draftform" method="get">
				<h3>新增合同</h3>
				合同名称:<input type="text" id="contractname" name="contractname"
					style="margin-left: 10px; width: 150px;"> <font
					style="color: red;"> *</font> <br>客户:<input type="text"
					id="client" name="client" style="margin-left: 42px; width: 150px;"><br>开始时间:<input
					type="text" id="begintime" name="begintime"
					style="margin-left: 10px; width: 150px;"><font
					style="color: red;"> *正确的格式：yyyy-mm-dd</font> <br>结束时间:<input
					type="text" id="endtime" name="endtime"
					style="margin-left: 10px; width: 150px;"> <font
					style="color: red;"> *正确的格式：yyyy-mm-dd</font> <br> 合同内容: <font
					style="color: red;">* </font><br>
				<textarea
					style="overflow: scroll; overflow-x: hidden; height: 200px; width: 100%;"
					form="draftform" name="draftcontent" id="draftcontent"></textarea>
				<br> 附件: <input type="button" value="浏览..."> <font
					style="color: black;">未选择文件 </font> <br> <br> <input
					type="submit" value="提交" style="margin-left: 40px"> <input
					type="button" value="重置" style="margin-left: 10px"
					onclick="window.location.href=' admin_draft.jsp'">
			</form>
		</div>
	</div>
	<div class="photo"></div>
</body>
</html>