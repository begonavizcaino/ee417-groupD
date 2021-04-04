package db;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User extends TableRow {

	private String username;
	private String password;
	private Role role;
	
	public User(ResultSet rs) throws SQLException {
		super(rs);
		username = rs.getString("username");
		password = rs.getString("password");
		role = Role.valueOf(rs.getString("role"));
	}

	public User(String username, String password, Role role) throws SQLException {
		super();
		this.username = username;
		this.password = password;
		this.role = role;
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
}
