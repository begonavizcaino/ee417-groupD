package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public abstract class Dao<T extends TableRow> {

	public T findOneBy(Map<String, String> pairs) throws SQLException {
		String sql = "SELECT * FROM " + getTableName();
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
			return createNew(rs);
		return null;
	}

	public ArrayList<T> findAll() throws SQLException {
		ArrayList<T> ret = new ArrayList<T>();
		PreparedStatement st = Database.getDbConnection().prepareStatement("SELECT * FROM " + getTableName());
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			ret.add(createNew(rs));
		}
		return ret;
	}

	public ArrayList<T> findBy(Map<String, String> pairs) throws SQLException {
		ArrayList<T> ret = new ArrayList<T>();
		String sql = "SELECT * FROM " + getTableName();
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
			ret.add(createNew(rs));
		}
		return ret;
	}

	public abstract void insert(T data) throws SQLException;

	public abstract void update(T data) throws SQLException;

	public abstract void delete(T data) throws SQLException;
	
	public abstract T createNew(ResultSet rs) throws SQLException;
	
	public abstract String getTableName();

}