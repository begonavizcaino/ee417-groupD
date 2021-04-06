package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
	private static final String jdbcUrl = "jdbc:mysql://ee417.cyhgg00hth8k.eu-west-3.rds.amazonaws.com/ee417";
	private static final String user = "ee417";
	private static final String pass = "ee417groupd";
	
	public static Dao<User> userDao = new UserDao();
	
	private static Connection con = null;
	
	public static java.sql.Connection getDbConnection() throws SQLException {
		if(con != null) return con;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			System.out.println("The jdbc driver could not be found, please ensure you coppied the mysql connector to your tomcat/lib directory!");
			e1.printStackTrace();
		}
        return (con = DriverManager.getConnection(jdbcUrl, user, pass));
	}
}