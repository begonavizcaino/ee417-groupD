package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public class UserDao implements Dao<User> {
	
	private static final String tableName = "users";

	@Override
	public User findOneById(int id) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("SELECT * FROM " + tableName + " WHERE id = ?");
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();
		if(rs.next())
			return new User(rs);
		return null;
	}

	@Override
	public User findOneBy(Map<String, String> pairs) throws SQLException {
		String sql = "SELECT * FROM " + tableName;
		int i = 0;
		for (Map.Entry<String, String> pair : pairs.entrySet()) {
			if(i == 0) {
				sql += " WHERE " + pair.getKey() + " = ?";
				i++;
			} else {
				sql += " AND " + pair.getKey() + " = ?";
			}
		}
		PreparedStatement st = Database.getDbConnection().prepareStatement(sql);
		for (Map.Entry<String, String> pair : pairs.entrySet()) {
			st.setString(i++, pair.getValue());
		}
		ResultSet rs = st.executeQuery();
		if(rs.next())
			return new User(rs);
		return null;
	}

	@Override
	public ArrayList<User> findAll() throws SQLException {
		ArrayList<User> ret = new ArrayList<User>();
		PreparedStatement st = Database.getDbConnection().prepareStatement("SELECT * FROM " + tableName);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			ret.add(new User(rs));
		}
		return ret;
	}

	@Override
	public ArrayList<User> findBy(Map<String, String> pairs) throws SQLException {
		ArrayList<User> ret = new ArrayList<User>();
		String sql = "SELECT * FROM " + tableName;
		int i = 0;
		for (int j = 0; j < pairs.size(); j++) {
			if(i == 0) {
				sql += " WHERE ? = ?";
				i++;
			} else {
				sql += " AND ? = ?";
			}
		}
		PreparedStatement st = Database.getDbConnection().prepareStatement(sql);
		for (Map.Entry<String, String> pair : pairs.entrySet()) {
			st.setString(i++, pair.getKey());
			st.setString(i++, pair.getValue());
		}
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			ret.add(new User(rs));
		}
		return ret;
	}

	@Override
	public void insert(User data) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("INSERT INTO " + tableName + " (id, username, password, role) VALUES (?, ?, ?, ?)");
		st.setInt(1, data.getId());
		st.setString(2, data.getUsername());
		st.setString(3, data.getPassword());
		st.setString(4, data.getRole().toString());
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
	public void delete(int id) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("DELETE FROM " + tableName + " WHERE id = ?");
		st.setInt(1, id);
		st.execute();
	}

}
