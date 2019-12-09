package com.cms.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 将输出转换为中文
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html");
		
		// 获取参数
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		 
		// 登录验证信息
		if (username.equals("admin") && pass.equals("123456")){
			// 如果验证成功，则转发main.html页面
			request.getRequestDispatcher("main.html").forward(request, response);
		}
		else{
			response.sendRedirect("login.html");
		}
	}

}
