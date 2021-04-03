package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public class UserDao implements Dao<User> {

	@Override
	public User findOneById(int id) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("SELECT * From USERS WHERE id = ?");
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();
		if(rs.next())
			return new User(rs);
		return null;
	}

	@Override
	public User findOneBy(Map<String, String> pairs) throws SQLException {
		String sql = "SELECT * From USERS";
		int i = 0;
		for (int j = 0; j < pairs.size(); j++) {
			if(i == 0) {
				sql += " WHERE ? = ?";
				i++;
			} else {
				sql += ", ? = ?";
			}
		}
		PreparedStatement st = Database.getDbConnection().prepareStatement(sql);
		for (Map.Entry<String, String> pair : pairs.entrySet()) {
			st.setString(i++, pair.getKey());
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
		PreparedStatement st = Database.getDbConnection().prepareStatement("SELECT * From USERS");
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			ret.add(new User(rs));
		}
		return ret;
	}

	@Override
	public ArrayList<User> findBy(Map<String, String> pairs) throws SQLException {
		ArrayList<User> ret = new ArrayList<User>();
		String sql = "SELECT * From USERS";
		int i = 0;
		for (int j = 0; j < pairs.size(); j++) {
			if(i == 0) {
				sql += " WHERE ? = ?";
				i++;
			} else {
				sql += ", ? = ?";
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
		PreparedStatement st = Database.getDbConnection().prepareStatement("INSERT INTO users (id, username, password) VALUES (?, ?, ?)");
		st.setInt(1, data.getId());
		st.setString(2, data.getUsername());
		st.setString(3, data.getPassword());
		st.execute();
	}

	@Override
	public void update(User data) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("UPDATE users SET username = ?, password = ? WHERE id = ?");
		st.setString(1, data.getUsername());
		st.setString(2, data.getPassword());
		st.setInt(3, data.getId());
		st.execute();
	}

	@Override
	public void delete(int id) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("DELETE FROM users WHERE id = ?");
		st.setInt(1, id);
		st.execute();
	}

}
