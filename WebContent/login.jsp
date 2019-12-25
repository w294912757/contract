<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>合同管理系统</title>
<link rel="stylesheet" type="text/css" href="CSS/background.css">
<script type="text/javascript" src="JS/jquery-3.4.1.min.js">
	
</script>
</head>
<body>
	<div class="loginbackground">
	<div class="login">

		<form name="login" id="loginform" method="get" action="LoginServlet">
			<fieldset>

				<legend>登录</legend>
				<br> 用户名:<input type="text" name="username" id="username"
					style="margin-left: 26px; width: 150px;"><br> <br>
				密码:<input type="password" name="pass" id="pass"
					style="margin-left: 42px; width: 150px;"><br> <br>


				<input type="button" value="用户登录" onclick="user()"> <input
					type="button" value="管理员登录" onclick="admin()">
				<button style="width: 50px; height: 25px;"
					onclick="window.location.href='signup.jsp'" type="button">注册</button>
			</fieldset>
		</form>



	</div>
	</div>
	<div class="photo1"></div>
</body>
<script>
	function user() {
		var type = "user";
		var username = $("#username").val();
		var password = $("#pass").val();
		$.ajax({
			type : "GET", //请求方式  
			url : "LoginServlet", //请求路径  
			cache : false,
			data : {//传参  
				"type" : type,
				"username" : username,
				"password" : password,
			},
			dataType : "json",
			success : function(data) {
				if (data == 0) {
					alert("该用户未注册！");
				} else if (data == 1) {
					alert("用户名和密码不能为空！");
				} else if (data == 2) {
					window.location.href = 'main.jsp';
				} else if (data == 3) {
					window.location.href = 'admin.jsp';
				}
			}
		});
	}
	function admin() {
		var type = "admin";
		var username = $("#username").val();
		var password = $("#pass").val();
		$.ajax({
			type : "GET", //请求方式  
			url : "LoginServlet", //请求路径  
			cache : false,
			data : {//传参  
				"type" : type,
				"username" : username,
				"password" : password,
			},
			dataType : "json",
			success : function(data) {
				if (data == 0) {
					alert("该用户未注册！");
				} else if (data == 1) {
					alert("用户名和密码不能为空！");
				} else if (data == 2) {
					window.location.href = 'main.jsp';
				} else if (data == 3) {
					window.location.href = 'admin.jsp';
				}
			}
		});
	}
</script>
</html>