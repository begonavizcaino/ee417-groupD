package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AttachedContentDao extends DaoId<AttachedContent> {
	
	private static final String tableName = "attachedcontent";

	@Override
	public void insert(AttachedContent data) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("INSERT INTO " + tableName + " (content, post_id) VALUES (?, ?)");
		st.setString(1, data.getContent());
		st.setInt(2, data.getPostId());
		st.execute();
	}

	@Override
	public void update(AttachedContent data) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("UPDATE " + tableName + " SET content = ?, post_id = ? WHERE id = ?");
		st.setString(1, data.getContent());
		st.setInt(2, data.getPostId());
		st.setInt(3, data.getId());
		st.execute();
	}

	@Override
	public AttachedContent createNew(ResultSet rs) throws SQLException {
		return new AttachedContent(rs);
	}

	@Override
	public String getTableName() {
		return tableName;
	}

}
