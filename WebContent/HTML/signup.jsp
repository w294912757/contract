<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>合同管理系统</title>

<link rel="stylesheet" type="text/css" href="CSS/background.css">

<script type="text/javascript">
	var status1 = '${sessionScope.pwdFail}';
	if (status1 == 'yes') {
		alert("两次密码输入不一样，请重新输入")
	}

	var status2 = '${sessionScope.userNull}';
	if (status2 == 'yes') {
		alert("用户名不可为空，请重新输入")
	}

	var status3 = '${sessionScope.userLength}';
	if (status3 == 'yes') {
		alert("用户名长度不可小于4，请重新输入")
	}

	var status4 = '${sessionScope.passNull}';
	if (status4 == 'yes') {
		alert("密码不可为空，请重新输入")
	}

	var status5 = '${sessionScope.passLength}';
	if (status5 == 'yes') {
		alert("密码长度不可小于6，请重新输入")
	}

	var status6 = '${sessionScope.userExist}';
	if (status6 == 'yes') {
		alert("用户名已存在，请重新输入")
	}
</script>
</head>
<body>
	<div>

		<form name="signup" id="signupform" method="get"
			action="SignupServlet">

			<fieldset>
				<legend>注册</legend>
				<br> 用户名:<input type="text" id="username" name="username"
					style="margin-left: 26px; width: 150px;"><br> <font
					class="words">用户名须以字母开头，至少4位（可用字母、数字、下划线）。</font> <br> <br>
				密码:<input type="password" id="pass" name="pass"
					style="margin-left: 42px; width: 150px;"> <br> <font
					class="words">密码请勿设置过于简单，至少六位；建议使用数字、字母混合排列，区分大小写。</font> <br>
				<br>确认密码:<input type="password" id="repass" name="repass"
					style="margin-left: 10px; width: 150px;"> <br> <font
					class="words">重复密码设置一定要与上边密码设置一致</font> <br> <br> <input
					type="submit" value="提交">
				<button onclick="window.location.href = 'login.jsp'"
					style="width: 125px; height: 25px; text-align: center;"
					type="button">返回登陆页面</button>

			</fieldset>

		</form>


	</div>
	<div class="photo"></div>
</body>
</html>