package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao extends DaoId<User> {
	
	private static final String tableName = "users";

	@Override
	public void insert(User data) throws SQLException {
		int i=1;
		PreparedStatement st = Database.getDbConnection().prepareStatement("INSERT INTO " + tableName + 
				" (username, password, role, picture, firstname, lastname, nationality, sudyin, birth) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
		st.setString(i++, data.getUsername());
		st.setString(i++, data.getPassword());
		st.setString(i++, data.getRole().toString());
		st.setString(i++, data.getPicture());
		st.setString(i++, data.getFirstName());
		st.setString(i++, data.getLastName());
		st.setString(i++, data.getNationality());
		st.setString(i++, data.getStudyIn());
		st.setDate(i++, data.getBirth());
		st.execute();
	}

	@Override
	public void update(User data) throws SQLException {
		int i=1;
		PreparedStatement st = Database.getDbConnection().prepareStatement("UPDATE " + tableName
				+ " SET username = ?, password = ?, role = ?, picture = ?, firstname = ?, lastname = ?, nationality = ?, sudyin = ?, birth = ? "
				+ "WHERE id = ?");
		st.setString(i++, data.getUsername());
		st.setString(i++, data.getPassword());
		st.setString(i++, data.getRole().toString());
		st.setString(i++, data.getPicture());
		st.setString(i++, data.getFirstName());
		st.setString(i++, data.getLastName());
		st.setString(i++, data.getNationality());
		st.setString(i++, data.getStudyIn());
		st.setDate(i++, data.getBirth());
		st.setInt(i++, data.getId());
		st.execute();
	}

	@Override
	public String getTableName() {
		return tableName;
	}

	@Override
	public User createNew(ResultSet rs) throws SQLException {
		return new User(rs);
	}

}
