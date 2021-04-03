package db;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User extends TableRow {

	private String username;
	private String password;
	
	public User(ResultSet rs) throws SQLException {
		super(rs);
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}	
}
