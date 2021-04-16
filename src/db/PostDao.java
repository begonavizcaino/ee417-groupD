package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class PostDao extends DaoId<Post> {
	
	private static final String tableName = "posts";

	@Override
	public void insert(Post data) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("INSERT INTO " + tableName + " (parent_id, user_id, title, message) VALUES (?, ?, ?, ?)");
		st.setInt(1, data.getParentId());
		st.setInt(2, data.getUserId());
		st.setString(3, data.getTitle());
		st.setString(4, data.getMessage());
		st.execute();
	}

	@Override
	public void update(Post data) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("UPDATE " + tableName + " SET parent_id = ?, user_id = ?, title = ?, message = ? WHERE id = ?");
		st.setInt(1, data.getParentId());
		st.setInt(2, data.getUserId());
		st.setString(3, data.getTitle());
		st.setString(4, data.getMessage());
		st.setInt(5, data.getId());
		st.execute();
	}
	
	public ArrayList<Post> findCategories() throws SQLException {
		ArrayList<Post> ret = new ArrayList<Post>();
		PreparedStatement st = Database.getDbConnection().prepareStatement("SELECT * FROM " + getTableName() + " WHERE parent_id IS NULL");
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			ret.add(createNew(rs));
		}
		return ret;
	}

	@Override
	public Post createNew(ResultSet rs) throws SQLException {
		return new Post(rs);
	}

	@Override
	public String getTableName() {
		return tableName;
	}

}