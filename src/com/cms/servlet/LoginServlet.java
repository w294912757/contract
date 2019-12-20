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
			select = "select * from role a, privilege b where b.uname = '" + username + "'and a.name=b.rname;";
			rs = db.parseQuery(select);

			try {
				while (rs.next()) {
					request.getSession().setAttribute("contract_draft", rs.getString("contract_draft"));
					request.getSession().setAttribute("contract_confirm", rs.getString("contract_confirm"));
					request.getSession().setAttribute("contract_query", rs.getString("contract_query"));
					request.getSession().setAttribute("contract_delete", rs.getString("contract_delete"));
					request.getSession().setAttribute("process_contersign", rs.getString("process_contersign"));
					request.getSession().setAttribute("process_approve", rs.getString("process_approve"));
					request.getSession().setAttribute("process_sign", rs.getString("process_sign"));
					request.getSession().setAttribute("process_distribute_contersign",
							rs.getString("process_distribute_contersign"));
					request.getSession().setAttribute("process_distribute_approve",
							rs.getString("process_distribute_approve"));
					request.getSession().setAttribute("process_distribute_sign",
							rs.getString("process_distribute_sign"));
					request.getSession().setAttribute("process_query", rs.getString("process_query"));
					request.getSession().setAttribute("user_insert", rs.getString("user_insert"));
					request.getSession().setAttribute("user_alter", rs.getString("user_alter"));
					request.getSession().setAttribute("user_query", rs.getString("user_query"));
					request.getSession().setAttribute("user_delete", rs.getString("user_delete"));
					request.getSession().setAttribute("role_insert", rs.getString("role_insert"));
					request.getSession().setAttribute("role_alter", rs.getString("role_alter"));
					request.getSession().setAttribute("role_query", rs.getString("role_query"));
					request.getSession().setAttribute("role_delete", rs.getString("role_delete"));
					request.getSession().setAttribute("authority_distribute", rs.getString("authority_distribute"));
					request.getSession().setAttribute("customer_insert", rs.getString("customer_insert"));
					request.getSession().setAttribute("customer_alter", rs.getString("customer_alter"));
					request.getSession().setAttribute("customer_query", rs.getString("customer_query"));
					request.getSession().setAttribute("customer_delete", rs.getString("customer_delete"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			request.getSession().setAttribute("username", username);
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
