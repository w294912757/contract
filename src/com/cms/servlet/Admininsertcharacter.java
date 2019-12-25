package com.cms.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
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
@WebServlet("/Admininsertcharacter")
public class Admininsertcharacter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admininsertcharacter() {
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
		String charactername = request.getParameter("charactername");
		String description = request.getParameter("description");
		String checkboxes[] = request.getParameterValues("authority");
		List<String> author = Arrays.asList(checkboxes);
		int contract_draft = 0;
		int contract_confirm = 0;
		int contract_query = 0;
		int contract_delete = 0;
		int process_contersign = 0;
		int process_approve = 0;
		int process_sign = 0;
		int process_distribute_contersign = 0;
		int process_distribute_approve = 0;
		int process_distribute_sign = 0;
		int process_query = 0;
		int user_insert = 0;
		int user_alter = 0;
		int user_query = 0;
		int user_delete = 0;
		int role_insert = 0;
		int role_alter = 0;
		int role_query = 0;
		int role_delete = 0;
		int authority_distribute = 0;
		int customer_insert = 0;
		int customer_alter = 0;
		int customer_query = 0;
		int customer_delete = 0;

		if (author.contains("起草合同")) {
			contract_draft = 1;
		}
		if (author.contains("定稿合同")) {
			contract_confirm = 1;
		}
		if (author.contains("查询合同")) {
			contract_query = 1;
		}
		if (author.contains("删除合同")) {
			contract_delete = 1;
		}
		if (author.contains("会签合同")) {
			process_contersign = 1;
		}
		if (author.contains("审批合同")) {
			process_approve = 1;
		}
		if (author.contains("签订合同")) {
			process_sign = 1;
		}
		if (author.contains("分配会签")) {
			process_distribute_contersign = 1;
		}
		if (author.contains("分配审批")) {
			process_distribute_approve = 1;
		}
		if (author.contains("分配签订")) {
			process_distribute_sign = 1;
		}
		if (author.contains("流程查询")) {
			process_query = 1;
		}
		if (author.contains("新增用户")) {
			user_insert = 1;
		}
		if (author.contains("编辑用户")) {
			user_alter = 1;
		}
		if (author.contains("查询用户")) {
			user_query = 1;
		}
		if (author.contains("删除用户")) {
			user_delete = 1;
		}
		if (author.contains("新增角色")) {
			role_insert = 1;
		}
		if (author.contains("编辑角色")) {
			role_alter = 1;
		}
		if (author.contains("查询角色")) {
			role_query = 1;
		}
		if (author.contains("删除角色")) {
			role_delete = 1;
		}
		if (author.contains("配置权限")) {
			authority_distribute = 1;
		}
		if (author.contains("新增客户")) {
			customer_insert = 1;
		}
		if (author.contains("编辑客户")) {
			customer_alter = 1;
		}
		if (author.contains("查询客户")) {
			customer_query = 1;
		}
		if (author.contains("删除客户")) {
			customer_delete = 1;
		}

		try {
			String select = "select * from role;";
			ResultSet rs = Database.getDatabase().parseQuery(select);
			List<String> contractList = new ArrayList<String>();

			while (rs.next()) {
				contractList.add(rs.getString(1));
			}
			if (contractList.contains(charactername)) {
				response.getWriter().print("<script>alert('存在同名角色!');window.location.href='admin_insertcharacter.jsp'</script>");
			} else {
				String insert = "insert into role values('" + charactername + "'" + "," + "'" + description + "'" + ","
						+ "'" + "admin" + "'" + "," + contract_draft + "," + contract_confirm + "," + contract_query
						+ "," + contract_delete + "," + process_contersign + "," + process_approve + "," + process_sign
						+ "," + process_distribute_contersign + "," + process_distribute_approve + ","
						+ process_distribute_sign + "," + process_query + "," + user_insert + "," + user_alter + ","
						+ user_query + "," + user_delete + "," + role_insert + "," + role_alter + "," + role_query + ","
						+ role_delete + "," + authority_distribute + "," + customer_insert + "," + customer_alter + ","
						+ customer_query + "," + customer_delete + ");";

				Database.getDatabase().parseUpdate(insert);
			}
			response.getWriter().print("<script>alert('操作成功!');window.location.href='admin_insertcharacter.jsp'</script>");

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
