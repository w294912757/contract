package com.cms.servlet;

import java.sql.ResultSet;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Database db = Database.getDatabase();
		db.parseUpdate(""); // 除select语句外
		ResultSet rs = db.parseQuery(""); // select语句
	}

}
