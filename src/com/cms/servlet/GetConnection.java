package com.cms.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConnection {
	Connection conn = null;
	
	public Connection getConnection() throws ClassNotFoundException {
		String driver = "com.mysql.jdbc.Driver";            //驱动路径
		String url = "jdbc:mysql://localhost:/admin";       //数据库地址
		String user = "";                                   //访问数据库的用户名
		String password = "";                               //用户密码 
		
		Class.forName(driver);
		try {
			conn = DriverManager.getConnection(url, user, "");
		} catch(SQLException e){
			e.printStackTrace();
		}
		
		return conn;
	}

}
