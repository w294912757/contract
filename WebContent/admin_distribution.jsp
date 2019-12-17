<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分配合同</title>
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

			<br> <a>查询统计</a><br> <a href="admin_infoquery.jsp">合同信息查询</a>
			<br> <a href="admin_processquery.jsp">合同流程查询</a> <br> <br>
			<a>基础数据管理</a><br> <a href="admin_contractmanage.jsp">合同信息管理</a>
			<br> <a href="admin_clientmanage.jsp">客户信息管理</a> <br> <br>
			<a>系统管理</a><br> <a href="admin_distribution.jsp">分配合同</a> <br>
			<a href="admin_authoritymanage.jsp">权限管理</a> <br> <a
				href="admin_logmanage.jsp">日志管理</a> <br>

		</div>
	</div>

	<div class="mainbackground">
		<div class="mainview">
			<div class="mainview">
				
					<h3>合同信息查询</h3>
					查找合同:<input type="text" id="contractname" name="contractname"
						style="margin-left: 26px; width: 150px;" placeholder="输入查找条件...">
					<button style="height: 20px; width: 55px; text-align: center;"
						id="searchbutton">search</button>
					<br>

					<form name="tbform" id="tbform" action="AdminDistributionServlet" method="get">
    <table class="table-normal" id="outBoxTab"
    data-pagination="true" data-side-pagination="client" data-page-size="3">
        <thead>
            <tr>
                <th>合同编号</th>
                <th>合同名称</th>
                <th>起草人</th>
                <th>合同内容</th>
                <th>开始时间</th>
            </tr>
        </thead>
        <tbody> </tbody>
    </table>
    <button type="button" id="pre" >首页</button>
    <button type="button" id="up" >上一页</button>
    <input type="text" id="change"  value="1">
    <button type="button" id="skip">跳转</button>
    <button type="button" id="down" >下一页</button>
    <button type="button" id="end" >尾页</button>
    <input type="button" name="go" id="go" value="分配"  onclick="findButton()"/>
    </form>

			</div>
		</div>
	</div>
	<div class="photo"></div>
</body>
<script type="text/javascript">
var num = 0;
var nowPage = 0, //当前页
    count = 5, //每页显示多少条消息
    pageAll = 0; //总页数
var testDataList = []; //创建一个存放数据的数组
var allName = new Array();
var nameCount = 0;
<%
int j = 0;
try {  
	Class.forName("com.mysql.cj.jdbc.Driver");  ////加载数据库驱动
	String url = "jdbc:mysql://localhost:3306/contract?useSSL=false&serverTimezone=UTC"; //指向数据库table1
	String username = "root";  //数据库用户名
	String password = "root";  //数据库用户密码
	Connection conn = DriverManager.getConnection(url, username, password);  //连接数据库
	if(conn != null){        
		Statement stmt = null;  
		ResultSet rs = null;  
		//String sql ="select * from contract;";  //查询语句
		String sql ="select * from contract;";  //实际查询语句
		stmt = conn.createStatement();  
		rs = stmt.executeQuery(sql);
		while (rs.next()) {
			List<Object> list = new ArrayList<Object>();
			list.add(rs.getString(1));
			list.add(rs.getString(2));
			list.add(rs.getString(3));
			list.add(rs.getString(5));
			list.add(rs.getString(6));
			%>
			var data=new Array();
			allName[nameCount]='<%=list.get(0)%>';
			nameCount++;
			<%
			   if(list!=null)
			   {
			    for(int i=0;i<list.size();i++)
			    {
			    	if(list.get(i)==null){
			    		%>
			    		data[<%=i%>]="";
			    			<%
			    	}else{
			  %>
			    data[<%=i%>]='<%=list.get(i)%>';
			  <%   }
			   }
			   }
			  %>
				  num++;
				testDataList.push('<tr>'+
					'<td><input name="ctct" type="radio" value="'+data[0]+'">'+data[0]+'</td>'+
					'<td>'+data[1]+'</td>'+
					'<td>'+data[2]+'</td>'+
					'<td>'+data[3]+'</td>'+
					'<td>'+data[4]+'</td>'+
	                '</tr>');
			<%
			j++;
		}  			
		conn.close();
	}else{  
			out.print("连接失败！");  
			conn.close();
        }           
    }catch (Exception e) {        
            out.print("数据库连接异常！");  
    }
%>
function findButton() {
	var myForm = document.getElementById("tbform");
	var i;
	var isFound = false;
	if(!myForm.ctct[0]){
		 if(myForm.ctct.checked) {
			  isFound = true;
		  }
		 if(isFound ==false){
				alert("请选择要分配的合同！");
				return;
			}
			//alert("You selected \""+myForm.ctct[i].value+"\".");
			myForm.submit();
	}else{
		  for(i=0;i<myForm.ctct.length; i++) {
			  if(myForm.ctct[i].checked) {
				  isFound = true;
			   break;
			  }
			}
			if(isFound ==false){
				alert("请选择要分配的合同！");
				return;
			}
			//alert("You selected \""+myForm.ctct[i].value+"\".");
			myForm.submit();
	}
}



pageAll = (testDataList.length) / count; //计算总页数
var setPage = function () {
	for(var i = 0;i < pageAll;i++){
		
	}
}



var setTable = function () { //数据渲染表格
    var onePageData = []; //用来存放一页的数据
    /*
        i + nowPage * count 表示当前是第几条数据
        (nowPage + 1) * count 表示到下一条数据 之间 有几条数据  即当前页 的页尾数据的是第几条 不是最后一页的情况下都是五条
         var begin = (nowPage + 1) * count 
         var end = i + nowPage * count)
         begin-end==5

         testDataList.length 表示所有数据个数
    */
    for (var i = 0;
        (i + nowPage * count < (nowPage + 1) * count) && i + nowPage * count < testDataList.length; i++) { //满足当前数据小于没到当前页的最后一条数据 ，并且当前数据没到最后一条数据
        {
        	if(nowPage >= pageAll-1){
        		onePageData.push(testDataList[i + (nowPage+1) * count]);
        	}
            onePageData.push(testDataList[i + nowPage * count]);
        }
    }
    outBoxTab.querySelector('tbody').innerHTML = onePageData.join(''); //渲染当前页数据
}
setTable();
pre.onclick = function () { 
    if (nowPage == 0) 
        return
    nowPage = 0;
    setTable();
    document.getElementById("change").value = nowPage+1;
}
up.onclick = function () { //上一页
    if (nowPage == 0) //当前页数是第一页则返回
        return
    nowPage--;
    setTable();
    document.getElementById("change").value = nowPage+1;
}
down.onclick = function () {//下一页
    if (nowPage >= pageAll-1) //当前页数是最后一页则返回  这么写是因为总页数不一定是整数
        return
    nowPage++;
    setTable();
    document.getElementById("change").value = nowPage+1;
    debugger
}
end.onclick = function () {
    if (nowPage >= pageAll-1) 
        return
    nowPage = Math.ceil(pageAll - 1);
    setTable();
    document.getElementById("change").value = nowPage+1;
    debugger
}
skip.onclick = function(){
	var curPage=document.getElementById("change").value * 1;
    if (!/^[1-9]\d*$/.test(curPage)) {
        alert("请输入正整数");
        return ;
    }
    if (curPage > pageAll+1) {
        alert("超出数据页面");
        return ;
    }
    nowPage=curPage-1;
    setTable();
    document.getElementById("change").value = nowPage+1;
}
searchbutton.onclick = function(){
	var onePageData = []; 
	var name = document.getElementById("contractname");
    outBoxTab.querySelector('tbody').innerHTML = onePageData.join('');
	
    for (var i = 0;i < nameCount;i++){
    	if(name.value ==allName[i]){
    		onePageData.push(testDataList[i]);
    	}
    }
    outBoxTab.querySelector('tbody').innerHTML = onePageData.join('');
}

</script>
</html>