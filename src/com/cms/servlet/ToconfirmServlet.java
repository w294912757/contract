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

import com.mysql.cj.protocol.Resultset;

/**
 * Servlet implementation class ConfirmServlet
 */
@WebServlet("/ToconfirmServlet")
public class ToconfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ToconfirmServlet() {
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

		// 查询相关信息
		ResultSet rs = Database.getDatabase().parseQuery("select * from contract where id ='" + id + "';");
		try {
			while (rs.next()) {
				request.getSession().setAttribute("cid", id);
				request.getSession().setAttribute("cname", rs.getString("name"));
				request.getSession().setAttribute("ccustomer", rs.getString("customer"));
				request.getSession().setAttribute("cbegintime", rs.getDate("beginTime"));
				request.getSession().setAttribute("cendtime", rs.getDate("endTime"));
				request.getSession().setAttribute("ccontent", rs.getString("content"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect("confirm.jsp");

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
