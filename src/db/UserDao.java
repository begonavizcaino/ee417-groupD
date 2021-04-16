package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao extends DaoId<User> {
	
	private static final String tableName = "users";

	@Override
	public void insert(User data) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("INSERT INTO " + tableName + " (username, password, role) VALUES (?, ?, ?)");
		st.setString(1, data.getUsername());
		st.setString(2, data.getPassword());
		st.setString(3, data.getRole().toString());
		st.execute();
	}

	@Override
	public void update(User data) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("UPDATE " + tableName + " SET username = ?, password = ?, role = ? WHERE id = ?");
		st.setString(1, data.getUsername());
		st.setString(2, data.getPassword());
		st.setString(3, data.getRole().toString());
		st.setInt(4, data.getId());
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
