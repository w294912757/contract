<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>定稿合同</title>
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
	<div style="width: 1500px; height: 100px; background-color: black;"></div>
	<div class="navigationbackground">
		<div class="navigation">

			<br> <a>合同起草</a><br> <a href=" draft.jsp">起草合同</a> <br>
			<a href=" toconfirm.jsp">待定稿合同</a> <br> <a href=" confirmed.jsp">已定稿合同</a>
			<br> <a href=" query.jsp">流程查询</a> <br> <br> <a>合同会签</a><br>
			<a href=" tocontersign.jsp">待会签合同</a> <br> <a
				href=" contersigned.jsp">已会签合同</a> <br> <br> <a>合同审批</a><br>
			<a href=" toapprove.jsp">待审批合同</a> <br> <a href=" approved.jsp">已审批合同</a>
			<br> <br> <a>合同签订</a><br> <a href=" tosign.jsp">待签订合同</a>
			<br> <a href=" signed.jsp">已签订合同</a>

		</div>
	</div>

	<div class="mainbackground">
		<div class="mainview">
			<form name="confirmform" id="confirmform" method="get"
				action="ConfirmServlet">
				<h3>定稿合同</h3>
				合同名称:<font id="contractid"> </font> <br>客户:<font
					id="customerid"> </font><br>开始时间:<font id="begintime">
				</font> <br>结束时间:<font id="endtime"> </font> <br> 合同内容:<br>
				<textarea
					style="overflow: scroll; overflow-x: hidden; height: 200px; width: 80%;"
					form="confirmform" name="confirmcontent" id="confirmcontent"></textarea>
				<br> 附件:<font style="color: black;" id="attachid">无文件 </font> <br>
				<br> <input type="submit" value="提交" style="margin-left: 40px">
				<input type="button" value="重置"
					onclick="window.location.href=' confirm.jsp'">
			</form>
		</div>
	</div>
	<div class="photo"></div>
</body>
<script>
	var status1 = '${sessionScope.cname}';
	document.getElementById("contractid").innerHTML = status1;
	var status2 = '${sessionScope.ccustomer}';
	document.getElementById("customerid").innerHTML = status2;
	var status3 = '${sessionScope.cbegintime}';
	document.getElementById("begintime").innerHTML = status3;
	var status4 = '${sessionScope.cendtime}';
	document.getElementById("endtime").innerHTML = status4;
</script>
</html>