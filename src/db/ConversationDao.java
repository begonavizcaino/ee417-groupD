package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConversationDao extends DaoId<Conversation> {
	
	private static final String tableName = "conversation";

	@Override
	public void insert(Conversation data) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("INSERT INTO " + tableName + " (title, image) VALUES (?, ?)", 
				Statement.RETURN_GENERATED_KEYS);
		st.setString(1, data.getTitle());
		st.setString(2, data.getImage());
		st.execute();
		try (ResultSet keys = st.getGeneratedKeys()) {
		    if(keys.next())
		    	data.setId(keys.getInt(1));
		}
	}

	@Override
	public void update(Conversation data) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("UPDATE " + tableName + " SET title = ?, image = ? WHERE id = ?");
		st.setString(1, data.getTitle());
		st.setString(2, data.getImage());
		st.setInt(3, data.getId());
		st.execute();
	}

	@Override
	public Conversation createNew(ResultSet rs) throws SQLException {
		return new Conversation(rs);
	}

	@Override
	public String getTableName() {
		return tableName;
	}
}
