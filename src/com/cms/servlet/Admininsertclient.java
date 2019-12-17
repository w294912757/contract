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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Admininsertclient")
public class Admininsertclient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admininsertclient() {
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
		System.out.println(session.getAttribute("username"));
		String clientname = request.getParameter("clientname");
		String clienttelno = request.getParameter("clienttelno");
		String clientloc = request.getParameter("clientloc");
		String clientfax = request.getParameter("clientfax");
		String clientmail = request.getParameter("clientmail");
		String clientbankname = request.getParameter("clientbankname");
		String clientbankno = request.getParameter("clientbankno");
		String newclient = request.getParameter("newclient");

		try {
			String select = "select * from customer;";
			ResultSet rs = Database.getDatabase().parseQuery(select);
			List<String> customerList = new ArrayList<String>();

			while (rs.next()) {
				customerList.add(rs.getString(1));
			}
			if (customerList.size() == 0) {
				String insert = "insert into customer values(" + 1
						+ "," + "'" + clientname + "'" + "," + "'" + clientloc + "'" + "," + "'" + clienttelno + "'"
						+ "," + "'" + clientfax + "'" + "," + "'" + clientmail + "'" + "," + "'" + clientbankname + "'"
						+ "," + "'" + clientbankno + "'" + "," + "'" + newclient + "');";

				Database.getDatabase().parseUpdate(insert);
			} else {
				String contractid = customerList.get(customerList.size() - 1);
				int id = Integer.parseInt(contractid) + 1;
				String insert = "insert into customer values(" + id
						+ "," + "'" + clientname + "'" + "," + "'" + clientloc + "'" + "," + "'" + clienttelno + "'"
						+ "," + "'" + clientfax + "'" + "," + "'" + clientmail + "'" + "," + "'" + clientbankname + "'"
						+ "," + "'" + clientbankno + "'" + "," + "'" + newclient + "');";

				Database.getDatabase().parseUpdate(insert);
			}

			// 符合注册条件，插入数据库

			// 把用户消息放进session中

			response.getWriter().print("<script>alert('操作成功!');window.location.href='admin_insertclient.jsp'</script>");

		} catch (SQLException e) {
			e.printStackTrace();
		}

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
