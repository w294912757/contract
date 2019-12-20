<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>流程查询</title>
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

			<br> <a>合同起草</a><br> <a href=" draft.jsp"
				<%if (request.getSession().getAttribute("contract_draft").equals("0")) {%>
				style="display: none;" ;
			<%}%>>起草合同</a> <br> <a
				href=" toconfirm.jsp" <%if (request.getSession().getAttribute("contract_confirm").equals("0")) {%>
				style="display: none;" ;
			<%}%>>待定稿合同</a> <br> <a href=" confirmed.jsp" <%if (request.getSession().getAttribute("contract_confirm").equals("0")) {%>
				style="display: none;" ;
			<%}%>>已定稿合同</a>
			<br> <a href=" query.jsp">流程查询</a> <br> <br> <a>合同会签</a><br>
			<a href=" tocontersign.jsp" <%if (request.getSession().getAttribute("process_contersign").equals("0")) {%>
				style="display: none;" ;
			<%}%>>待会签合同</a> <br> <a
				href=" contersigned.jsp" <%if (request.getSession().getAttribute("process_contersign").equals("0")) {%>
				style="display: none;" ;
			<%}%>>已会签合同</a> <br> <br> <a>合同审批</a><br>
			<a href=" toapprove.jsp" <%if (request.getSession().getAttribute("process_approve").equals("0")) {%>
				style="display: none;" ;
			<%}%>>待审批合同</a> <br> <a href=" approved.jsp" <%if (request.getSession().getAttribute("process_approve").equals("0")) {%>
				style="display: none;" ;
			<%}%>>已审批合同</a>
			<br> <br> <a>合同签订</a><br> <a href=" tosign.jsp" <%if (request.getSession().getAttribute("process_sign").equals("0")) {%>
				style="display: none;" ;
			<%}%>>待签订合同</a>
			<br> <a href=" signed.jsp" <%if (request.getSession().getAttribute("process_sign").equals("0")) {%>
				style="display: none;" ;
			<%}%>>已签订合同</a>

		</div>
	</div>

	<div class="mainbackground">
		<div class="mainview">

			<button id="search" name="search"
				value="info"
				onclick="window.location.href = ' infoquery.jsp'" <%if (request.getSession().getAttribute("contract_query").equals("0")) {%>
				style="display: none;" ;}else{style="margin-left: 26px; width: 150px; text-align: center;";
			<%}%>>合同信息查询</button>
			<br> <br>
			<button id="search" name="search"
				value="process"
				onclick="window.location.href = ' processquery.jsp'" <%if (request.getSession().getAttribute("process_query").equals("0")) {%>
				style="display: none;" ;}else{style="margin-left: 26px; width: 150px; text-align: center;";
			<%}%>>合同流程查询</button>

		</div>
	</div><div class="photo"></div>
</body>
</html>