package com.cms.servlet;

import java.io.IOException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet("/SignServlet")
public class SignServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignServlet() {
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
		String s_content = request.getParameter("signcontent");
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("sid");
		String username = (String) session.getAttribute("username");
		String sql = "update contract_process set state = 1 where type = 4 and uname='"+username+"' and id = '" + sid + "';";
		Database.getDatabase().parseUpdate(sql);
		sql="update contract set s_content ='"+s_content+"' where id='"+sid+"';";
		Database.getDatabase().parseUpdate(sql);
		
		sql = "select * from contract_process where type=4 and id = '" + sid + "' and state = 0";
		ResultSet rs = Database.getDatabase().parseQuery(sql);
		
		try {
			if(!rs.next()) {
				String update = "update contract set type = 5 where id = '" + sid + "';";
				Database.getDatabase().parseUpdate(update);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("signed.jsp");

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
