package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConvMessageDao extends DaoId<ConvMessage> {
	
	private static final String tableName = "convmessage";

	@Override
	public void insert(ConvMessage data) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("INSERT INTO " + tableName + " (message, user_id, conv_id) VALUES (?, ?, ?)", 
				Statement.RETURN_GENERATED_KEYS);
		st.setString(1, data.getMessage());
		st.setInt(2, data.getUser_id());
		st.setInt(3, data.getConv_id());
		st.execute();
		try (ResultSet keys = st.getGeneratedKeys()) {
		    if(keys.next())
		    	data.setId(keys.getInt(1));
		}
	}

	@Override
	public void update(ConvMessage data) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("UPDATE " + tableName + " SET message = ?, user_id = ?, conv_id = ? WHERE id = ?");
		st.setString(1, data.getMessage());
		st.setInt(2, data.getUser_id());
		st.setInt(3, data.getConv_id());
		st.setInt(4, data.getId());
		st.execute();
	}

	@Override
	public ConvMessage createNew(ResultSet rs) throws SQLException {
		return new ConvMessage(rs);
	}

	@Override
	public String getTableName() {
		return tableName;
	}
}
