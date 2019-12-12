package com.cms.servlet;

import java.io.IOException;

import java.sql.ResultSet;
import java.sql.SQLException;
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
		// 将输出转换为中文
		// request.setCharacterEncoding("UTF-8");
		// response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		// 获取参数
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		String repass = request.getParameter("repass");
		// 注册验证信息
		boolean check = false;
		if (!pass.equals(repass) && check == false) {
			// 两次输入密码不一致
			check = true;
			request.getSession().setAttribute("pwdFail", "yes");
			response.sendRedirect("signup.jsp");
		} else if (username.equals("") && check == false) {
			// 用户名为空
			check = true;
			request.getSession().setAttribute("userNull", "yes");
			response.sendRedirect("signup.jsp");
		} else if (username.length() < 4 && check == false) {
			// 用户名长度小于4
			check = true;
			request.getSession().setAttribute("userLength", "yes");
			response.sendRedirect("signup.jsp");
		} else if (pass.equals("") && check == false) {
			// 密码为空
			check = true;
			request.getSession().setAttribute("passNull", "yes");
			response.sendRedirect("signup.jsp");
		} else if (pass.length() < 6 && check == false) {
			// 密码长度小于6
			check = true;
			request.getSession().setAttribute("passLength", "yes");
			response.sendRedirect("signup.jsp");
		} else {
			try {

				String select = "select name from user;";
				ResultSet rs = Database.getDatabase().parseQuery(select);
				List<String> usernameList = new ArrayList<String>();

				// 将name字段的所有数据存入集合中
				while (rs.next()) {
					usernameList.add(rs.getString(1));
				}
				rs.close();

				if (usernameList.contains(username)) {
					// 该用户名已存在
					request.getSession().setAttribute("userExist", "yes");
					response.sendRedirect("signup.jsp");
				} else {
					// 符合注册条件，插入数据库
					String insert = "insert into user(name,password) values('" + username + "','" + pass + "');";
					Database.getDatabase().parseUpdate(insert);

					// 把用户消息放进session中
					HttpSession session = request.getSession();
					session.setAttribute("username", username);
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}

			} catch (SQLException e) {
				e.printStackTrace();
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
