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
@WebServlet("/Admininsertuser")
public class Admininsertuser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admininsertuser() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
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
			response.getWriter().print("<script>alert('两次输入的密码不一致!');window.location.href='admin_insertuser.jsp'</script>");
		} else if (username.equals("") && check == false) {
			// 用户名为空
			check = true;
			response.getWriter().print("<script>alert('用户名不能为空!');window.location.href='admin_insertuser.jsp'</script>");
		} else if (username.length() < 4 && check == false) {
			// 用户名长度小于4
			check = true;
			response.getWriter().print("<script>alert('用户名长度不得小于4!');window.location.href='admin_insertuser.jsp'</script>");
		} else if (pass.equals("") && check == false) {
			// 密码为空
			check = true;
			response.getWriter().print("<script>alert('密码不能为空!');window.location.href='admin_insertuser.jsp'</script>");
		} else if (pass.length() < 6 && check == false) {
			// 密码长度小于6
			check = true;
			response.getWriter().print("<script>alert('密码长度不得小于6!');window.location.href='admin_insertuser.jsp'</script>");
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
					response.getWriter().print("<script>alert('存在同名用户!');window.location.href='admin_insertuser.jsp'</script>");
				} else {
					// 符合注册条件，插入数据库
					String insert = "insert into user(name,password) values('" + username + "','" + pass + "');";
					Database.getDatabase().parseUpdate(insert);
					insert = "insert into privilege(uname,rname) values('" + username + "','" + "newuser');";
					Database.getDatabase().parseUpdate(insert);

					// 把用户消息放进session中
					response.sendRedirect("admin_insertuser.jsp");
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
