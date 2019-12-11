package com.cms.servlet;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class test {
	public static void main(String[] arg){
		try {
			String username = "songlan";
			String pass = "456123";
			Database.getDatabase().parseUpdate("insert into user(name,password) values('"+username+"','"+pass+"');");
			ResultSet rs = Database.getDatabase().parseQuery("select * from user;");
			List<String> usernameList = new ArrayList<String>();
			while (rs.next()){
				usernameList.add(rs.getString(2));
			}
			rs.close();
			System.out.println(usernameList);
	
		} catch (SQLException e){
			e.printStackTrace();
		}
	}

}
