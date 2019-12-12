<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>合同管理系统</title>
<link rel="stylesheet" type="text/css" href="CSS/background.css">
<script type="text/javascript">
	
</script>
</head>
<body>
	<div>

		<form name="login" id="loginform" method="get" action="LoginServlet">
			<fieldset>

				<legend>登录</legend>
				<br> 用户名:<input type="text" name="username" id="username"
					style="margin-left: 26px; width: 150px;"><br> <br>
				密码:<input type="password" name="pass" id="pass"
					style="margin-left: 42px; width: 150px;"><br> <br>


				<input type="submit" value="登录">
				<button style="width: 50px; height: 25px;"
					onclick="window.location.href='signup.jsp'" type="button">注册</button>
			</fieldset>
		</form>



	</div>
	<div class="photo"></div>
</body>
</html>