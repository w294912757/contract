package test;
import java.sql.*;

public class Start {
	//JDBC驱动名和连接URL
	static final String JDBC = "com.mysql.cj.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC";
	static final String USER = "root";
	static final String PASSWORD = "19990907";

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String sql = "select * from student";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			//注册JDBC驱动
			Class.forName(JDBC);
			
			//打开链接
			System.out.println("连接数据库...");
			con = DriverManager.getConnection(DB_URL,USER,PASSWORD);
			
			//执行查询
			System.out.println("实例化Statement对象...");
			stmt = con.createStatement();
	        rs = stmt.executeQuery(sql);
	        
	        //显示结果
	        while(rs.next()){
	        	System.out.println(rs.getString("sno"));
	        }
	        
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
