package com.cms.servlet;

import java.io.IOException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
<<<<<<< HEAD
=======
import java.util.Enumeration;
>>>>>>> master
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TocontersignServlet
 */
@WebServlet("/TocontersignServlet")
public class TocontersignServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TocontersignServlet() {
		// TODO Auto-generated constructor stub
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 将输出转换为中文
		// request.setCharacterEncoding("UTF-8");
		// response.setCharacterEncoding("UTF-8");
<<<<<<< HEAD
		String contractid = request.getParameter("contractid");
		System.out.println("CTM");
=======
		String id = "";
		Enumeration<String> en = request.getParameterNames();
		while(en.hasMoreElements()){    
            String  paramName=(String)en.nextElement();                        
            String[]  values=request.getParameterValues(paramName);    
            for(int  i=0;i<values.length;i++){ 
            	id = values[i];
            }   
		}  
		request.getSession().setAttribute("contractid", id);
		response.sendRedirect("contersign.jsp");
		
		
>>>>>>> master
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
