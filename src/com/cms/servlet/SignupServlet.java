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
		// �����ת��Ϊ����
	    //request.setCharacterEncoding("UTF-8");
	    //response.setCharacterEncoding("UTF-8");
	    //response.setContentType("text/html");
	    
	    
	    ResultSet rs = null;
	    List<String> usernameList = new ArrayList<String>();
		
		// ��ȡ����
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		String repass = request.getParameter("repass");
		 
		// ע����֤��Ϣ
		if(pass.equals(repass)==false){
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
			try {
				
				String select = "select name from user;";
				rs = Database.getDatabase().parseQuery(select);
					
				//��name�ֶε��������ݴ��뼯����
				while (rs.next()){
					usernameList.add(rs.getString(1));
				}
				rs.close();
				
				if(usernameList.contains(username)){
				    request.getSession().setAttribute("userExist", "yes");
					response.sendRedirect("signup.html");
				 }
				 else {
				    String insert = "insert into user(name,password) values('"+username+"','"+pass+"');";
				    Database.getDatabase().parseUpdate(insert);
				    	
				    //���û���Ϣ�Ž�session��
			        HttpSession session = request.getSession();
			        session.setAttribute("username",username);
			        request.getRequestDispatcher("login.html").forward(request,response);
				}

		
			} catch (SQLException e){
				e.printStackTrace();
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
