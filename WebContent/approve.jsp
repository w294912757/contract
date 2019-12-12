<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>审批合同</title>
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
			<a href=" toconfirm.jsp">待定稿合同</a> <br> <a
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
			<form name="approveform" id="approveform" method="get"
				action="tosign.jsp">
				<h3>审批合同</h3>
				合同名称:<font> XXX</font> <br>
				<div style="width: 100%">
					<div style="width: 20%; float: left; text-align: center;">
						<input type="radio" id="yes" name="choise"> 通过 <br> <input
							type="radio" id="no" name="choise"> 拒绝
					</div>
					<div style="width: 80%; float: right;">
						<textarea
							style="overflow: scroll; overflow-x: hidden; height: 100px; width: 100%;"
							form="approveform" name="approvecontent" id="approvecontent"
							placeholder="输入审批意见..."></textarea>
					</div>

				</div>
				<br> <br> <br> <br> <br> <br>
				<div style="width: 20%; margin-left: 200px">
					<input type="submit" value="提交"> <input type="button"
						value="重置" onclick="window.location.href=' approve.jsp'">
				</div>
			</form>
		</div>
	</div>
	<div class="photo"></div>
</body>
</html>