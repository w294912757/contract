package com.cms.servlet;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class test2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String username = "admin1";
		String pass = "123456";
		String repass = "123456";
		
		if(pass.equals(repass)==false){
			//request.getSession().setAttribute("pwdFail", "yes");
			System.out.println("pwdFail");
        }
		if(username == ""){
            //request.getSession().setAttribute("userNull","yes");
			System.out.println("userNull");
        }
		if(username.length() < 4){
			//request.getSession().setAttribute("userLength", "yes");
			System.out.println("userLength");
		}
		if(pass == ""){
			//request.getSession().setAttribute("passNull", "yes");
			System.out.println("passNull");
		}
		if(pass.length() < 6){
			//request.getSession().setAttribute("passLength", "yes");
			System.out.println("passLength");
		}
		else{
			try {
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

}
