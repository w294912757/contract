<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分配合同</title>
<style type="text/css">
.test { <%if (true) {%> display:none; <%}%>
}
</style>
<script type="text/javascript">
	function reLogin() {
		var r = confirm("确认注销登录？")
		if (r == true) {
			window.location.href = "login.jsp"
		} else {

		}
	}

	function Select(id1, id2) {
		var myselect = document.getElementById(id1);
		var index = myselect.selectedIndex;
		var text = myselect.options[index].text;
		var value = myselect.options[index].value;
		var obj = document.getElementById(id2);
		obj.add(new Option(text, value))
		myselect.options.remove(index);
	}

	function Back(id1, id2) {
		var myselect = document.getElementById(id2);
		var index = myselect.selectedIndex;
		var text = myselect.options[index].text;
		var value = myselect.options[index].value;
		var obj = document.getElementById(id1);
		obj.add(new Option(text, value))
		myselect.options.remove(index);
	}
</script>
<style type="text/css">
.test{
<%if(true){%>
display:none;
visibility:hidden;
<%}%>
}
</style>
<link rel="stylesheet" type="text/css" href="CSS/background.css">
</head>
<body>
	<button onclick="reLogin()" style="float: right;">注销登录</button>
	<div style="width: 1500px; height: 50px; background-color: black;"></div>
	<div class="navigationbackground">
		<div class="navigation">


			<br> <a>查询统计</a><br> <a href="admin_infoquery.jsp"
				class="test">合同信息查询</a> <br> <a href="admin_processquery.jsp">合同流程查询</a>
			<br> <br> <a>基础数据管理</a><br> <a
				href="admin_contractmanage.jsp">合同信息管理</a> <br> <a
				href="admin_clientmanage.jsp">客户信息管理</a> <br> <br> <a>系统管理</a><br>
			<a href="admin_distribution.jsp">分配合同</a> <br> <a
				href="admin_authoritymanage.jsp">权限管理</a> <br> <a

				href="admin_logmanage.jsp">日志管理</a> <br>

		</div>
	</div>

	<div class="mainbackground">
		<div class="mainview">
			<h3>流程配置</h3>
			<form name="distributorform" id="distributorform" method="get"
				action="">
				<div
					style="width: 100%; border: 1px solid #000; height: 150px; text-align: center;">
					分配会签人:
					<p style="float: left;">待分配人员列表:</p>
					<p style="float: right;">已分配人员列表:</p>
					<br> <br> <select id="confirmer" name="confirmer"
						multiple size="5" style="float: left;">
						<option value="1">一</option>
						<option value="2">二</option>
						<option value="3">三</option>
						<option value="4">四</option>
						<option value="5">五</option>
					</select> <select id="toconfirm" name="toconfirm" multiple size="5"
						style="float: right;" form="distributorform">

					</select>

					<button onclick="Select('confirmer','toconfirm');" type="button">>></button>
					<br>
					<button onclick="Back('confirmer','toconfirm');" type="button"><<</button>



				</div>
				<div
					style="width: 100%; border: 1px solid #000; height: 150px; text-align: center;">
					分配审批人:
					<p style="float: left;">待分配人员列表:</p>
					<p style="float: right;">已分配人员列表:</p>
					<br> <br> <select id="approver" name="approver" multiple
						size="5" style="float: left;">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select> <select id="toapprove" name="toapprove" multiple size="5"
						style="float: right;" form="distributorform">

					</select>

					<button onclick="Select('approver','toapprove');" type="button">>></button>
					<br>
					<button onclick="Back('approver','toapprove');" type="button"><<</button>



				</div>
				<div
					style="width: 100%; border: 1px solid #000; height: 150px; text-align: center;">
					分配签订人:
					<p style="float: left;">待分配人员列表:</p>
					<p style="float: right;">已分配人员列表:</p>
					<br> <br> <select id="signer" name="signer" multiple
						size="5" style="float: left;">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select> <select id="tosign" name="tosign" multiple size="5"
						style="float: right;" form="distributorform">

					</select>

					<button onclick="Select('signer','tosign');" type="button">>></button>
					<br>
					<button onclick="Back('signer','tosign');" type="button"><<</button>



				</div>
				<br> <input type="submit" value="提交" style="margin-left: 40px">
				<input type="button" value="重置"
					onclick="window.location.href='admin_distributor.jsp'">
			</form>
		</div>
	</div>
	<div class="photo"></div>
</body>
</html>