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
		// �����ת��Ϊ����
		// request.setCharacterEncoding("UTF-8");
		// response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		// ��ȡ����
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");

		// ��¼��֤��Ϣ
		if (username != null && pass != null) {

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
				// �û������������
				// ��ʾ��

				response.sendRedirect("login.html");
			} else {
				// �����֤�ɹ�����ת��main.htmlҳ��
				request.getRequestDispatcher("main.html").forward(request, response);
			}

		} else {
			response.sendRedirect("login.html");
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
