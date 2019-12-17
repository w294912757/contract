<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mysql.jdbc.Driver" %>   
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<style>
    .table-normal {
        width: 80%;
        border: 1px solid #ccc;
        border-collapse: collapse;
    }

    .table-normal th,
    .table-normal td {
        padding: 8px;
        border: 1px solid #ccc;
        text-align: left;
    }
</style>

<body>
<div>
<form name="tocontersign" id="tocontersignform" action="TocontersignServlet" method="get">
<h3>待会签合同</h3>
				查找待会签合同:<input type="text" id="contractname" name="contractname"
					style="margin-left: 26px; width: 150px;" placeholder="输入查找条件...">
				<button style="height: 20px; width: 55px; text-align: center;"
					id="searchbutton" onclick="Search()" type="button">search</button>
				<br>
    <table class="table-normal" id="outBoxTab"
    data-pagination="true" data-side-pagination="client" data-page-size="3">
        <thead>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>USER_ID</th>
                <th>CUSTOMER</th>
                <th>CONTENT</th>
                <th>BeginTime</th>
                <th>EndTime</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody> </tbody>
    </table>
    </form>
    <button type="button" id="pre" >首页</button>
    <button type="button" id="up" >上一页</button>
    <input type="text" id="change"  value="1">
    <button type="button" id="skip">跳转</button>
    <button type="button" id="down" >下一页</button>
    <button type="button" id="end" >尾页</button>
    </div>
</body>

<script>
   var num = 0;
    var nowPage = 0, //当前页
        count = 10, //每页显示多少条消息
        pageAll = 0; //总页数
    var testDataList = []; //创建一个存放数据的数组
    <%try {  
    	Class.forName("com.mysql.cj.jdbc.Driver");  ////加载数据库驱动
    	String url = "jdbc:mysql://localhost:3306/contract?useSSL=false&serverTimezone=UTC"; //指向数据库table1
    	String username = "root";  //数据库用户名
    	String password = "19990907";  //数据库用户密码
    	Connection conn = DriverManager.getConnection(url, username, password);  //连接数据库
    	if(conn != null){        
    		Statement stmt = null;  
    		ResultSet rs = null;  
    		String sql ="select * from contract;";  //查询语句
    		stmt = conn.createStatement();  
    		rs = stmt.executeQuery(sql);
    		while (rs.next()) {
    			List<Object> list = new ArrayList<Object>();
    			list.add(rs.getString(1));
    			list.add(rs.getString(2));
    			list.add(rs.getString(3));
    			list.add(rs.getString(4));
    			list.add(rs.getString(5));
    			list.add(rs.getString(6));
    			list.add(rs.getString(7));
    			%>
    			var data = new Array();
    			<%
    			   if(list!=null)
    			   {
    			    for(int i=0;i<list.size();i++)
    			    {
    			  %>
    			    data[<%=i%>]='<%=list.get(i)%>';
    			  <%   }
    			   }
    			  %>
    			  num++;
    			testDataList.push(`<tr>
    					<td id="contractid" name="contractid">`+data[0]+`</td>
    					<td>`+data[1]+`</td>
    					<td>`+data[2]+`</td>
    					<td>`+data[3]+`</td>
    					<td>`+data[4]+`</td>
    					<td>`+data[5]+`</td>
    					<td>`+data[6]+`</td>
    	                <td>
    	                 <input type="submit" value="会签" > 
    	                </td>
    	                </tr>`);
    			<%
    		}  			
    	}else{  
    			out.print("连接失败！");  
            }           
        }catch (Exception e) {        
                out.print("数据库连接异常！");  
        }
    %>
    
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
    
</script>

</html>