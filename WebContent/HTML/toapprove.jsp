<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待审批合同</title>
<script type="text/javascript">
	function reLogin() {
		var r = confirm("确认注销登录？")
		if (r == true) {
			window.location.href = "login.jsp"
		} else {

		}
	}

	function Search() {
		alert("搜索")
	}
</script>
<link rel="stylesheet" type="text/css" href="CSS/background.css">
</head>
<body>
	<button onclick="reLogin()" style="float: right;">注销登录</button>
	<div style="width: 1500px; height: 100px;  "></div>
	<div class="navigationbackground">
		<div class="navigation">

			<br> <a>合同起草</a><br> <a href=" draft.jsp">起草合同</a>
			<br> <a href=" toconfirm.jsp">待定稿合同</a> <br> <a
				href=" confirmed.jsp">已定稿合同</a> <br> <a
				href=" query.jsp">流程查询</a> <br> <br> <a>合同会签</a><br>
			<a href=" tocontersign.jsp">待会签合同</a> <br> <a
				href=" contersigned.jsp">已会签合同</a> <br> <br> <a>合同审批</a><br>
			<a href=" toapprove.jsp">待审批合同</a> <br> <a
				href=" approved.jsp">已审批合同</a> <br> <br> <a>合同签订</a><br>
			<a href=" tosign.jsp">待签订合同</a> <br> <a
				href=" signed.jsp">已签订合同</a>

		</div>
	</div>

	<div class="mainbackground">
		<div class="mainview">
			<form name="toapproveform" id="toapproveform" method="get"
				action="approve.jsp">
				<h3>待审批合同</h3>
				查找待审批合同:<input type="text" id="contractname" name="contractname"
					style="margin-left: 26px; width: 150px;" placeholder="输入查找条件...">
				<button style="height: 20px; width: 55px; text-align: center;"
					id="searchbutton" onclick="Search()" type="button" >search</button>
				<br>

				<table border="1" style="width: 100%">
					<tr>
						<th style="width: 60%;">合同名称</th>
						<th>起草时间</th>
						<th>操作</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</div><div class="photo"></div>
</body>
</html>