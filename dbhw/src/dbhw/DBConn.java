package dbhw;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	public static Connection getMySqlConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://database-1.cdg5rjlrvadw.us-east-2.rds.amazonaws.com/";
			String dbName = "mydb";
			String userName = "admin";
			String password = "adkhrtuy";
			
			conn = DriverManager.getConnection(url+dbName, userName, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
