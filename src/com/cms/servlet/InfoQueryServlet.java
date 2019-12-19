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
 * Servlet implementation class InfoQueryServlet
 */
@WebServlet("/InfoQueryServlet")
public class InfoQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InfoQueryServlet() {
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
		ResultSet rs = Database.getDatabase().parseQuery("select *from contract where id = '" + id + "';");
		try {
			while (rs.next()) {
				request.getSession().setAttribute("qid", id);
				request.getSession().setAttribute("qname", rs.getString("name"));
				request.getSession().setAttribute("qcustomer", rs.getString("customer"));
				request.getSession().setAttribute("qbegintime", rs.getString("beginTime"));
				request.getSession().setAttribute("qendtime", rs.getString("endTime"));
				request.getSession().setAttribute("qcontent", rs.getString("content"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("contractinfo.jsp");
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
