<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客户详情</title>
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


			<form name="admincontractinfoform" id="admincontractinfoform"
				method="get">
				<h3>客户详情</h3>
				客户名称:<font id="customerid"> </font> <br> 地址:<font id="address">
				</font><br> 电话:<font id="tel"></font> <br> 传真:<font id="fax">
				</font> <br> 邮编:<font id="code"> </font> <br> 银行名称:<font
					id="bank"> </font> <br> 银行账号:<font id="account"> </font> <br>
				备注:<font id="content"> </font> <br> <br> <br> <input
					type="button" value="返回"
					onclick="window.location.href='admin_queryclient.jsp'">
			</form>

		</div>
	</div>
	<div class="photo"></div>
</body>
<script>
	var status1 = '${sessionScope.adminqcname}';
	document.getElementById("customerid").innerHTML = status1;
	var status2 = '${sessionScope.adminqcaddress}';
	document.getElementById("address").innerHTML = status2;
	var status3 = '${sessionScope.adminqctel}';
	document.getElementById("tel").innerHTML = status3;
	var status4 = '${sessionScope.adminqcfax}';
	document.getElementById("fax").innerHTML = status4;
	var status5 = '${sessionScope.adminqccode}';
	document.getElementById("code").innerHTML = status5;
	var status6 = '${sessionScope.adminqcbank}';
	document.getElementById("bank").innerHTML = status6;
	var status7 = '${sessionScope.adminqcaccount}';
	document.getElementById("account").innerHTML = status7;
	var status8 = '${sessionScope.adminqccontent}';
	document.getElementById("content").innerHTML = status8;
</script>
</html>