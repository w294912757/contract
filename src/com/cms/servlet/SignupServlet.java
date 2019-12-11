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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// �����ת��Ϊ����
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		Statement st = null;
		ResultSet rs = null;
		PreparedStatement ptst = null;

		List<String> usernameList = new ArrayList<String>();

		// ��ȡ����
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		String repass = request.getParameter("repass");

		// ע����֤��Ϣ
		if (!pass.equals(repass)) {
			request.getSession().setAttribute("pwdFail", "yes");
			response.sendRedirect("signup.html");
		} else if (username == "") {
			request.getSession().setAttribute("userNull", "yes");
			response.sendRedirect("signup.html");
		} else if (username.length() < 4) {
			request.getSession().setAttribute("userLength", "yes");
			response.sendRedirect("signup.html");
		} else if (pass == "") {
			request.getSession().setAttribute("passNull", "yes");
			response.sendRedirect("signup.html");
		} else if (pass.length() < 6) {
			request.getSession().setAttribute("passLength", "yes");
			response.sendRedirect("signup.html");
		} else {
			Connection conn = null;
			try {
				conn = new GetConnection().getConnection();

				try {
					// ����user����name�ֶ�
					String select = "select name from user";
					st = conn.createStatement();
					rs = st.executeQuery(select);

					// ��name�ֶε��������ݴ��뼯����
					while (rs.next()) {
						usernameList.add(rs.getString(1));
					}
					rs.close();
					st.close();

				} catch (SQLException e) {
					e.printStackTrace();
				}

				if (usernameList.contains(username)) {
					request.getSession().setAttribute("userExist", "yes");
					response.sendRedirect("signup.html");
				} else {
					String insert = "insert into user(name,password) values(?,?)";
					try {
						ptst = conn.prepareStatement(insert);

						// ����ptst����
						ptst.setString(1, username);
						ptst.setString(2, pass);

						// ִ��sql���
						ptst.execute();

						// �ر�ResultSet��Statement����
						ptst.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}

					// ���û���Ϣ�Ž�session��
					HttpSession session = request.getSession();
					session.setAttribute("username", username);
					session.setAttribute("pass", pass);
					request.getRequestDispatcher("login.html").forward(request, response);

				}

			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} finally {
				try {
					// �ر�Connection����
					if (conn != null) {
						conn.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

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
