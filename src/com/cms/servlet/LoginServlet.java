package com.cms.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
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

		String username = request.getParameter("username");
		String pass = request.getParameter("pass");

		if (username != null && pass != null) {
			if (username.equals("admin") && pass.equals("admin")) {
				response.sendRedirect("admin.jsp");
				return;
			}
			String select = "select * from user " + "where name = '" + username + "' and password = '" + pass + "';";
			Database db = Database.getDatabase();
			ResultSet rs = db.parseQuery(select);

			int count = 0;
			try {
				while (rs.next()) {
					count += 1;
				}
			} catch (SQLException ex) {
				Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
			}

			if (count == 0) {
				// 不存在该用户
				response.getWriter().print("<script>alert('该用户不存在!');window.location.href='login.jsp'</script>");
			} else {
				// 成功登录
				HttpSession session=request.getSession();
				session.setAttribute("username", username);
				response.sendRedirect("main.jsp");
			}

		} else {
			response.sendRedirect("login.jsp");
		}
		// TODO Auto-generated method stub

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
