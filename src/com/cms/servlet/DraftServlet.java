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
@WebServlet("/DraftServlet")
public class DraftServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DraftServlet() {
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
		String username = (String) session.getAttribute("username");
		String contractname = request.getParameter("contractname");
		String begintime = request.getParameter("begintime");
		String endtime = request.getParameter("endtime");
		String client = request.getParameter("client");
		String draftcontent = request.getParameter("draftcontent");
		DateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");

		if (contractname.equals("")) {
			response.getWriter().print("<script>alert('用户名不能为空!');window.location.href='draft.jsp'</script>");

		} else if (begintime.equals("")) {
			response.getWriter().print("<script>alert('开始时间不能为空!');window.location.href='draft.jsp'</script>");

		} else if (endtime.equals("")) {
			response.getWriter().print("<script>alert('结束时间不能为空!');window.location.href='draft.jsp'</script>");

		} else if (draftcontent.equals("")) {
			response.getWriter().print("<script>alert('合同内容不能为空!');window.location.href='draft.jsp'</script>");


		} else {
			try {
				Date date = formatter.parse(begintime);

			} catch (Exception e) {
				response.getWriter().print("<script>alert('开始时间格式错误!');window.location.href='draft.jsp'</script>");

			}
			try {
				Date date = formatter.parse(endtime);

			} catch (Exception e) {
				response.getWriter().print("<script>alert('结束时间格式错误!');window.location.href='draft.jsp'</script>");

			}

			try {
				String select = "select * from contract;";
				ResultSet rs = Database.getDatabase().parseQuery(select);
				List<String> contractList = new ArrayList<String>();

				while (rs.next()) {
					contractList.add(rs.getString(1));
				}
				if (contractList.size() == 0) {
					String insert = "insert into contract values(" + 1 + "," + "'" + contractname + "'" + "," + 0 + ","
							+ "'" + username + "'" + "," + "'" + client + "'" + "," + "'" + draftcontent + "'" + ","
							+ "'" + begintime + "'" + "," + "'" + endtime + "','','','');";

					Database.getDatabase().parseUpdate(insert);
				} else {
					String contractid = contractList.get(contractList.size() - 1);
					int id = Integer.parseInt(contractid) + 1;
					String insert = "insert into contract values(" + id + "," + "'" + contractname + "'" + "," + 0 + ","
							+ "'" + username + "'" + "," + "'" + client + "'" + "," + "'" + draftcontent + "'" + ","
							+ "'" + begintime + "'" + "," + "'" + endtime + "','','','');";

					Database.getDatabase().parseUpdate(insert);
				}

				// 符合注册条件，插入数据库

				// 把用户消息放进session中
				response.getWriter().print("<script>alert('结束时间格式错误!');window.location.href='draft.jsp'</script>");
				response.sendRedirect("tocontersign.jsp");

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
		doPost(request, response);
	}

}
