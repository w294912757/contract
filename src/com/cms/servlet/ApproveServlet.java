package com.cms.servlet;

import java.io.IOException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ContersignServlet
 */
@WebServlet("/ApproveServlet")
public class ApproveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApproveServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String choice = request.getParameter("choice");
		String a_content = request.getParameter("approvecontent");
		HttpSession session = request.getSession();
		String aid = (String) session.getAttribute("aid");
		String username = (String) session.getAttribute("username");
		String sql = "update contract_process set state = 1 where type = 3 and uname='"+username+"' and id = '" + aid + "';";
		Database.getDatabase().parseUpdate(sql);
		sql="update contract set a_content = '"+a_content+"' where id='"+aid+"';";
		Database.getDatabase().parseUpdate(sql);
		if(choice.equals("拒绝")) {
			sql="update contract set type =9 where id='"+aid+"';";
			Database.getDatabase().parseUpdate(sql);
		}else {
			sql = "select * from contract_process where type=3 and id = '" + aid + "' and state = 0";
			ResultSet rs = Database.getDatabase().parseQuery(sql);
			
			try {
				if(!rs.next()) {
					String update = "update contract set type = 4 where id = '" + aid + "';";
					Database.getDatabase().parseUpdate(update);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		response.sendRedirect("approved.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

}
