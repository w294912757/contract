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
 * Servlet implementation class AdminAuthorityServlet
 */
@WebServlet("/AdminAuthorityServlet")
public class AdminAuthorityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminAuthorityServlet() {
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
		List<String> nameList = new ArrayList<String>();
		List<String> roleList = new ArrayList<String>();
		System.out.println("into doPost");
        int count  =0;
		String id = "";
		Enumeration<String> en = request.getParameterNames();
		while(en.hasMoreElements()){    
            String  paramName=(String)en.nextElement();                        
            String[]  values=request.getParameterValues(paramName);    
            for(int  i=0;i<values.length;i++){ 
            	id = values[i];
            	if(count == 0) {
    				nameList.add((String)id);
    			}else if(count == 1){
    				roleList.add((String)id);
    			}
            }   
            count++;
		}  
		
		for(int i = 0;i < nameList.size();i++) {
			Database.getDatabase().parseUpdate("update privilege set rname = '"+roleList.get(i)+"' where uname = '"+nameList.get(i)+"';");
		}
		
		response.sendRedirect("admin_authoritydistribute.jsp");
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
