package Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static Connection con;
	
	private static final String DRIVER  = "com.mysql.cj.jdbc.Driver";  // API
	private static final String URl = "jdbc:mysql://localhost:3306/loginmvc"; //URL 
	private static final String USERNAME = "root";
	private static final String PASSWORD = "root";
	
	public static Connection getConnection() {
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URl,USERNAME,PASSWORD);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	
	}
}
