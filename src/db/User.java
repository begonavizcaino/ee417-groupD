package db;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User extends TableRowId {

	private String username;
	private String password;
	private Role role;
	private String picture;
	private String firstName;
	private String lastName;
	private String nationality;
	private String studyIn;
	private Date birth;
	
	public User(ResultSet rs) throws SQLException {
		super(rs);
		username = rs.getString("username");
		password = rs.getString("password");
		role = Role.valueOf(rs.getString("role"));
		picture = rs.getString("picture");
		firstName = rs.getString("firstName");
		lastName = rs.getString("lastName");
		nationality = rs.getString("nationality");
		studyIn = rs.getString("studyin");
		birth = rs.getDate("birth");
	}

	public User(String username, String password, Role role, String picture, String firstName, String lastName,
			String nationality, String studyIn, Date birth) {
		super();
		this.username = username;
		this.password = password;
		this.role = role;
		this.picture = picture;
		this.firstName = firstName;
		this.lastName = lastName;
		this.nationality = nationality;
		this.studyIn = studyIn;
		this.birth = birth;
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

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getStudyIn() {
		return studyIn;
	}

	public void setStudyIn(String studyIn) {
		this.studyIn = studyIn;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}
}
