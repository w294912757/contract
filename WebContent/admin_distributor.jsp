<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分配合同</title>
<style type="text/css">
.test { <%if (true) {%> display:none; <%}%>
}
</style>
<script src="JS/jquery-3.4.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function reLogin() {
		var r = confirm("确认注销登录？")
		if (r == true) {
			window.location.href = "login.jsp"
		} else {

		}
	}

	function Select(id1, id2) {
		var myselect = document.getElementById(id1);
		var index = myselect.selectedIndex;
		var text = myselect.options[index].text;
		var value = myselect.options[index].value;
		var obj = document.getElementById(id2);
		obj.add(new Option(text, value))
		myselect.options.remove(index);
	}

	function Back(id1, id2) {
		var myselect = document.getElementById(id2);
		var index = myselect.selectedIndex;
		var text = myselect.options[index].text;
		var value = myselect.options[index].value;
		var obj = document.getElementById(id1);
		obj.add(new Option(text, value))
		myselect.options.remove(index);
	}
</script>
<style type="text/css">
.test { <%if (true) {%> display:none;
	visibility: hidden;
	<%}%>
}
</style>
<link rel="stylesheet" type="text/css" href="CSS/background.css">
</head>
<body>
	<button onclick="reLogin()" style="float: right;">注销登录</button>
	<div style="width: 1500px; height: 50px; background-color: black;"></div>
	<div class="navigationbackground">
		<div class="navigation">


			<br> <a>查询统计</a><br> <a href="admin_infoquery.jsp"
				class="test">合同信息查询</a> <br> <a href="admin_processquery.jsp">合同流程查询</a>
			<br> <br> <a>基础数据管理</a><br> <a
				href="admin_contractmanage.jsp">合同信息管理</a> <br> <a
				href="admin_clientmanage.jsp">客户信息管理</a> <br> <br> <a>系统管理</a><br>
			<a href="admin_distribution.jsp">分配合同</a> <br> <a
				href="admin_authoritymanage.jsp">权限管理</a> <br> <a
				href="admin_logmanage.jsp">日志管理</a> <br>

		</div>
	</div>

	<div class="mainbackground">
		<div class="mainview">
			<h3>流程配置</h3>
			<form name="distributorform" id="distributorform" method="get"
				action="">

				<div
					style="width: 100%; border: 1px solid #000; height: 150px; text-align: center;">
					分配定稿人:
					<p style="float: left;">待分配人员列表:</p>
					<p style="float: right;">已分配人员列表:</p>
					<br> <br> <select id="confirmer" name="confirmer"
						multiple size="5" style="float: left;">
					</select> <select id="toconfirm" name="toconfirm" multiple size="5"
						style="float: right;" form="distributorform">

					</select>

					<button onclick="Select('confirmer','toconfirm');" type="button">>></button>
					<br>
					<button onclick="Back('confirmer','toconfirm');" type="button"><<</button>



				</div>

				<div
					style="width: 100%; border: 1px solid #000; height: 150px; text-align: center;">
					分配会签人:
					<p style="float: left;">待分配人员列表:</p>
					<p style="float: right;">已分配人员列表:</p>
					<br> <br> <select id="contersigner" name="contersigner"
						multiple size="5" style="float: left;">
					</select> <select id="tocontersign" name="tocontersign" multiple size="5"
						style="float: right;" form="distributorform">

					</select>

					<button onclick="Select('contersigner','tocontersign');"
						type="button">>></button>
					<br>
					<button onclick="Back('contersigner','tocontersign');"
						type="button"><<</button>



				</div>
				<div
					style="width: 100%; border: 1px solid #000; height: 150px; text-align: center;">
					分配审批人:
					<p style="float: left;">待分配人员列表:</p>
					<p style="float: right;">已分配人员列表:</p>
					<br> <br> <select id="approver" name="approver" multiple
						size="5" style="float: left;">

					</select> <select id="toapprove" name="toapprove" multiple size="5"
						style="float: right;" form="distributorform">

					</select>

					<button onclick="Select('approver','toapprove');" type="button">>></button>
					<br>
					<button onclick="Back('approver','toapprove');" type="button"><<</button>



				</div>
				<div
					style="width: 100%; border: 1px solid #000; height: 150px; text-align: center;">
					分配签订人:
					<p style="float: left;">待分配人员列表:</p>
					<p style="float: right;">已分配人员列表:</p>
					<br> <br> <select id="signer" name="signer" multiple
						size="5" style="float: left;">

					</select> <select id="tosign" name="tosign" multiple size="5"
						style="float: right;" form="distributorform">

					</select>

					<button onclick="Select('signer','tosign');" type="button">>></button>
					<br>
					<button onclick="Back('signer','tosign');" type="button"><<</button>



				</div>

				<br> <input type="button" value="提交" style="margin-left: 40px"
					onclick="test()"> <input type="button" value="重置"
					onclick="window.location.href='admin_distributor.jsp'">
			</form>
		</div>
	</div>
	<div class="photo"></div>
</body>
<script type="text/javascript">
var testDataList = []; 
var testDataList2 = []; 
var testDataList3 = []; 
var testDataList4 = []; 
var data = [];
var init = function(){
	<%int j = 0;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver"); ////加载数据库驱动
				String url = "jdbc:mysql://localhost:3306/contract?useSSL=false&serverTimezone=UTC"; //指向数据库table1
				String username = "root"; //数据库用户名
				String password = "root"; //数据库用户密码
				Connection conn = DriverManager.getConnection(url, username, password); //连接数据库
				if (conn != null) {
					Statement stmt = null;
					ResultSet rs = null;
					String sql = "select uname from privilege a,role b where a.rname=b.NAME and b.process_contersign=1 order by uname; "; //实际查询语句
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					while (rs.next()) {
						List<Object> list = new ArrayList<Object>();
						list.add(rs.getString(1));%>
				<%if (list != null) {
							for (int i = 0; i < list.size(); i++) {
								if (list.get(i) == null) {%>
				    		data[<%=i%>]="";
				    			<%} else {%>
				    data[<%=i%>]='<%=list.get(i)%>';
	
<%}
							}
						}%>
	testDataList.push('<option value="'+data[0]+'">' + data[0]
				+ '</option>');
<%}

					String sql1 = "select uname from privilege a,role b where a.rname=b.NAME and b.process_approve=1 order by uname; "; //实际查询语句
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql1);
					while (rs.next()) {
						List<Object> list = new ArrayList<Object>();
						list.add(rs.getString(1));%>
				<%if (list != null) {
							for (int i = 0; i < list.size(); i++) {
								if (list.get(i) == null) {%>
				    		data[<%=i%>]="";
				    			<%} else {%>
				    data[<%=i%>]='<%=list.get(i)%>';
	
<%}
							}
						}%>
	testDataList2.push('<option value="'+data[0]+'">' + data[0]
				+ '</option>');
<%}

					String sql2 = "select uname from privilege a,role b where a.rname=b.NAME and b.process_sign=1 order by uname; "; //实际查询语句
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql2);
					while (rs.next()) {
						List<Object> list = new ArrayList<Object>();
						list.add(rs.getString(1));%>
				<%if (list != null) {
							for (int i = 0; i < list.size(); i++) {
								if (list.get(i) == null) {%>
				    		data[<%=i%>]="";
				    			<%} else {%>
				    data[<%=i%>]='<%=list.get(i)%>';
<%}
							}
						}%>
	testDataList3.push('<option value="'+data[0]+'">' + data[0]
				+ '</option>');
<%}

					String sql3 = "select uname from privilege a,role b where a.rname=b.NAME and b.contract_confirm=1 order by uname; "; //实际查询语句
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql3);
					while (rs.next()) {
						List<Object> list = new ArrayList<Object>();
						list.add(rs.getString(1));%>
				<%if (list != null) {
							for (int i = 0; i < list.size(); i++) {
								if (list.get(i) == null) {%>
				    		data[<%=i%>]="";
				    			<%} else {%>
				    data[<%=i%>]='<%=list.get(i)%>';
<%}
							}
						}%>
	testDataList4.push('<option value="'+data[0]+'">' + data[0]
				+ '</option>');
<%}

					conn.close();
				} else {
					out.print("连接失败！");
					conn.close();
				}
			} catch (Exception e) {
				out.print("数据库连接异常！");
			}%>
	}
	init();

	var setSelect = function() { //数据渲染表格
		document.getElementById('contersigner').innerHTML = testDataList
				.join('');
		document.getElementById('approver').innerHTML = testDataList2.join('');
		document.getElementById('signer').innerHTML = testDataList3.join('');
		document.getElementById('confirmer').innerHTML = testDataList4.join('');
	}
	setSelect();

	function test() {
		var tocontersign = new Array();
		var tosign = new Array();
		var toapprove = new Array();
		var toconfirm = new Array();

		var obj1 = document.getElementById("tocontersign");
		var obj2 = document.getElementById("tosign");
		var obj3 = document.getElementById("toapprove");
		var obj4 = document.getElementById("toconfirm");

		var len1 = obj1.length;
		var len2 = obj2.length;
		var len3 = obj3.length;
		var len4 = obj4.length;

		for (var i = 0; i < len1; i++) {
			var text = obj1.options[i].text;
			tocontersign.push(text);
		}
		for (var i = 0; i < len2; i++) {
			var text = obj2.options[i].text;
			tosign.push(text);
		}
		for (var i = 0; i < len3; i++) {
			var text = obj3.options[i].text;
			toapprove.push(text);
		}
		for (var i = 0; i < len4; i++) {
			var text = obj4.options[i].text;
			toconfirm.push(text);
		}

		$.ajax({
			type : "GET", //请求方式  
			url : "AdminDistributorServlet", //请求路径  
			cache : false,
			data : {//传参  
				"toconfirm" : toconfirm,
				"tocontersign" : tocontersign,
				"tosign" : tosign,
				"toapprove" : toapprove,
			},
			dataType : "json",
			success : function(data) {
				if (data == 0) {
					window.location.href = 'admin_distribution.jsp';
				}
			}
		});
	}
</script>
</html>