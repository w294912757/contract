package com.cms.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConnection {
	Connection conn = null;
	
	public Connection getConnection() throws ClassNotFoundException {
		String driver = "com.mysql.jdbc.Driver";            //����·��
		String url = "jdbc:mysql://localhost:/admin";       //���ݿ��ַ
		String user = "";                                   //�������ݿ���û���
		String password = "";                               //�û����� 
		
		Class.forName(driver);
		try {
			conn = DriverManager.getConnection(url, user, "");
		} catch(SQLException e){
			e.printStackTrace();
		}
		
		return conn;
	}

}
