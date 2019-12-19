package com.cms.servlet;

import java.io.IOException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.Enumeration;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminQueryClientServlet
 */
@WebServlet("/AdminQueryClientServlet")
public class AdminQueryClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminQueryClientServlet() {
		// TODO Auto-generated constructor stub
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

		String id = "";
		Enumeration<String> en = request.getParameterNames();
		while (en.hasMoreElements()) {
			String paramName = (String) en.nextElement();
			String[] values = request.getParameterValues(paramName);
			for (int i = 0; i < values.length; i++) {
				id = values[i];
			}
		}
		ResultSet rs = Database.getDatabase().parseQuery("select *from customer where id = '" + id + "';");
		try {
			while (rs.next()) {
				request.getSession().setAttribute("adminqcid", id);
				request.getSession().setAttribute("adminqcname", rs.getString("name"));
				request.getSession().setAttribute("adminqcaddress", rs.getString("address"));
				request.getSession().setAttribute("adminqctel", rs.getString("tel"));
				request.getSession().setAttribute("adminqcfax", rs.getString("fax"));
				request.getSession().setAttribute("adminqccode", rs.getString("code"));
				request.getSession().setAttribute("adminqcbank", rs.getString("bank"));
				request.getSession().setAttribute("adminqcaccount", rs.getString("account"));
				request.getSession().setAttribute("adminqccontent", rs.getString("content"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("admin_clientinfo.jsp");
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
