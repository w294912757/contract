<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>合同详情</title>
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


			<form name="admincontractinfoform" id="admincontractinfoform"
				method="get">
				<h3>合同详情</h3>
				合同名称:<font id="contractid"> </font> <br>客户:<font
					id="customerid"> </font><br>开始时间:<font id="begintime">
				</font> <br>结束时间:<font id="endtime"> </font> <br> 合同内容:<br>
				<font id="content"> </font><br> <br> <input type="button"
					value="返回" onclick="window.location.href=' admin.jsp'">
			</form>

		</div>
	</div>
	<div class="photo"></div>
</body>
<script>
	var status1 = '${sessionScope.adminqname}';
	document.getElementById("contractid").innerHTML = status1;
	var status2 = '${sessionScope.adminqcustomer}';
	document.getElementById("customerid").innerHTML = status2;
	var status3 = '${sessionScope.adminqbegintime}';
	document.getElementById("begintime").innerHTML = status3;
	var status4 = '${sessionScope.adminqendtime}';
	document.getElementById("endtime").innerHTML = status4;
	var status5 = '${sessionScope.adminqcontent}';
	document.getElementById("content").innerHTML = status5;
</script>
</html>