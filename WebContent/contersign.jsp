<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会签合同</title>
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
	<div style="width: 1500px; height: 100px;  "></div>
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
			<form name="contersignform" id="contersignform" method="get"
				action="ContersignServlet">
				<h3>会签合同</h3>
				合同名称:<font id="contractname"></font> <br>会签意见:<br>
				<textarea
					style="overflow: scroll; overflow-x: hidden; height: 200px; width: 80%;"
					form="contersignform" name="contersigncontent"
					id="contersigncontent"></textarea>
				<br> <br> <input type="submit" value="提交"
					style="margin-left: 40px"> <input type="button" value="重置"
					onclick="window.location.href=' contersign.jsp'">
			</form>
		</div>
	</div>
	<div class="photo"></div>
</body>
<script>
	var status1 = '${sessionScope.tcname}';
	document.getElementById("contractname").innerHTML = status1;
	var status2 = '${sessionScope.tccontent}';
	document.getElementById("contersigncontent").innerHTML = status2;
</script>
</html>