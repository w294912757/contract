package test;
import java.sql.*;

public class Database {
	/*
	 * 此类为正式用类，请用Database.getDatabase().parseSql(yourString)来获得ResultSet返回值
	 */
	
	//单例模式
	private static Database database = null;
	
	//JDBC驱动名和连接URL
	private static final String JDBC = "com.mysql.cj.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC";
	
	//用户名与密码
	private static final String USER = "";
	private static final String PASSWORD = "19990907";
	
	//连接用变量
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	private Database() {
		try {
			//注册JDBC驱动
			Class.forName(JDBC);
			
			//打开链接
			System.out.println("连接数据库...");
			con = DriverManager.getConnection(DB_URL,USER,PASSWORD);
			
			//执行查询
			System.out.println("实例化Statement对象...");
			stmt = con.createStatement();
		}catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static Database getDatabase() {
		if(database == null) {
			database = new Database();
		}
		return database;
	}
	
	public ResultSet parseSql(String sql) {
		try {
			rs = stmt.executeQuery(sql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
