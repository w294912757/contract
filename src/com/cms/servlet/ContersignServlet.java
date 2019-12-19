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
@WebServlet("/ContersignServlet")
public class ContersignServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContersignServlet() {
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
		HttpSession session = request.getSession();
		String tcid = (String) session.getAttribute("tcid");
		String username = (String) session.getAttribute("username");
		String sql = "update contract_process set state = 1 where type = 1 and uname='"+username+"' and id = '" + tcid + "';";
		Database.getDatabase().parseUpdate(sql);
		
		sql = "select * from contract_process where type=1 and id = '" + tcid + "' and state = 0";
		ResultSet rs = Database.getDatabase().parseQuery(sql);
		
		try {
			if(!rs.next()) {
				String update = "update contract set type = 2 where id = '" + tcid + "';";
				Database.getDatabase().parseUpdate(update);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("contersigned.jsp");

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
