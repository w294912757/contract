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
 * Servlet implementation class AdminDistributorServlet
 */
@WebServlet("/AdminDistributorServlet")
public class AdminDistributorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminDistributorServlet() {
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
		List<String> contersign = new ArrayList<String>();
		List<String> sign = new ArrayList<String>();
		List<String> approve = new ArrayList<String>();
		List<String> confirm = new ArrayList<String>();
		int count = 0;
		String id = "";
		Enumeration<String> en = request.getParameterNames();
		while (en.hasMoreElements()) {
			String paramName = (String) en.nextElement();
			String[] values = request.getParameterValues(paramName);
			for (int i = 0; i < values.length; i++) {
				id = values[i];
				if (count == 0) {
					confirm.add((String) id);
				} else if (count == 1) {
					contersign.add((String) id);
				} else if (count == 2) {
					sign.add((String) id);
				} else if (count == 3) {
					approve.add((String) id);
				}
			}
			count++;
		}
		HttpSession session = request.getSession();
		String contractid = (String) session.getAttribute("contractid");
		for (int i = 0; i < confirm.size(); i++) {
			Database.getDatabase().parseUpdate("insert contract_process values ('" + contractid + "'" + "," + "'"
					+ confirm.get(i) + "'" + "," + 2+ ");");
		}
		for (int i = 0; i < contersign.size(); i++) {
			Database.getDatabase().parseUpdate("insert contract_process values ('" + contractid + "'" + "," + "'"
					+ contersign.get(i) + "'" + "," + 1 + ");");
		}
		for (int i = 0; i < sign.size(); i++) {
			Database.getDatabase().parseUpdate("insert contract_process values ('" + contractid + "'" + "," + "'"
					+ sign.get(i) + "'" + "," + 4 + ");");
		}
		for (int i = 0; i < approve.size(); i++) {
			Database.getDatabase().parseUpdate("insert contract_process values ('" + contractid + "'" + "," + "'"
					+ approve.get(i) + "'" + "," + 3 + ");");
		}

		Database.getDatabase().parseUpdate("update contract set type = 1 where id = '" + contractid + "';");

		response.getWriter().println(0);
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
