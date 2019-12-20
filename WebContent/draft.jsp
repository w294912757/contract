<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>起草合同</title>
<script type="text/javascript">
	function reLogin() {
		var r = confirm("确认注销登录？")
		if (r == true) {
			window.location.href = "login.jsp";
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
			<form name="draftform" id="draftform" method="get"
				action="DraftServlet">
				<h3>起草合同</h3>
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
					onclick="window.location.href=' draft.jsp'">
			</form>
		</div>


	</div>
	<div class="photo"></div>
</body>
</html>