package com.cms.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html");

		String type = "";
		String username = null;
		String pass = null;
		int count = 0;
		Enumeration<String> en = request.getParameterNames();
		while (en.hasMoreElements()) {
			String paramName = (String) en.nextElement();
			String[] values = request.getParameterValues(paramName);
			switch (count) {
			case 0: {
				type = values[0];
				break;
			}
			case 1: {
				username = values[0];
				break;
			}
			case 2: {
				pass = values[0];
				break;
			}
			}
			count++;
		}

		if (username == null && pass == null) {
			response.getWriter().println(1);
			return;
		}

		String select = "select * from user where name = '" + username + "' and password = '" + pass + "';";
		Database db = Database.getDatabase();
		ResultSet rs = db.parseQuery(select);

		count = 0;
		try {
			while (rs.next()) {
				count += 1;
			}
		} catch (SQLException ex) {
			response.getWriter().println(1);
		}

		if (count == 0) {
			// 不存在该用户
			response.getWriter().println(0);
		} else {
			// 成功登录
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			if (type.equals("user")) {
				response.getWriter().println(2);
			} else {
				response.getWriter().println(3);
			}
		}

	}
	// TODO Auto-generated method stub

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

}
