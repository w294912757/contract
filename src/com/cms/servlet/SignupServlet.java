package com.cms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 将输出转换为中文
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html");
	    
	    Statement st = null;
	    ResultSet rs = null;
	    PreparedStatement ptst = null;
	    
	    List<String> usernameList = new ArrayList<String>();
		
		// 获取参数
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		String repass = request.getParameter("repass");
		 
		// 注册验证信息
		if(!pass.equals(repass)){
			request.getSession().setAttribute("pwdFail", "yes");
			response.sendRedirect("signup.html");
        }
		else if(username == ""){
            request.getSession().setAttribute("userNull","yes");
            response.sendRedirect("signup.html");
        }
		else if(username.length() < 4){
			request.getSession().setAttribute("userLength", "yes");
			response.sendRedirect("signup.html");
		}
		else if(pass == ""){
			request.getSession().setAttribute("passNull", "yes");
			response.sendRedirect("signup.html");
		}
		else if(pass.length() < 6){
			request.getSession().setAttribute("passLength", "yes");
			response.sendRedirect("signup.html");
		}
		else {
			Connection conn = null;
			try {
				conn = new GetConnection().getConnection();
				
				try {
					//遍历user表中name字段
					String select = "select name from user";
					st = conn.createStatement();
					rs = st.executeQuery(select);
					
					//将name字段的所有数据存入集合中
					while (rs.next()){
						usernameList.add(rs.getString(1));
					}
					rs.close();
					st.close();
					
				} catch (SQLException e){
					e.printStackTrace();
				}
				
			    if(usernameList.contains(username)){
			    	request.getSession().setAttribute("userExist", "yes");
					response.sendRedirect("signup.html");
			    }
			    else {
			    	String insert = "insert into user(name,password) values(?,?)";
			    	try {
			    		ptst = conn.prepareStatement(insert);
			    		
			    		//设置ptst参数
			    		ptst.setString(1,username);
			    		ptst.setString(2,pass);
			    		
			    		//执行sql语句
			    		ptst.execute();
			    		
			    		//关闭ResultSet和Statement链接
			    		ptst.close();
			    	} catch (SQLException e) {
			    		e.printStackTrace();
			    	}
			    	
			    	//把用户消息放进session中
		            HttpSession session = request.getSession();
		            session.setAttribute("username",username);
		            session.setAttribute("pass",pass);
		            request.getRequestDispatcher("login.html").forward(request,response);
		            
			    }
			    
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} finally {
		    		try {
		    			//关闭Connection链接
		    			if (conn != null){
		    				conn.close();
		    			}
		    		} catch (SQLException e){
		    			e.printStackTrace();
		    		}
		    	}
		    }
            
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
