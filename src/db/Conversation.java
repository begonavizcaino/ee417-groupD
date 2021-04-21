package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class Conversation extends TableRowId {
	private String title;
	private String image;
	
	public Conversation(ResultSet rs) throws SQLException {
		super(rs);
		title = rs.getString("title");
		image = rs.getString("image");
	}
	
	public Conversation(int userId, String title, String image) {
		super();
		this.title = title;
		this.image = image;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public ArrayList<ConvMessage> getMessages() throws SQLException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("parent_id", getId());
		return Database.convMessageDao.findBy(map);
	}
	
	public ConvMessage getLastMessage() throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("SELECT * FROM " + Database.convMessageDao.getTableName() + 
				" WHERE conv_id = ? ORDER BY id DESC LIMIT 1");
		st.setInt(1, getId());
		ResultSet rs = st.executeQuery();
		if(rs.next())
			return new ConvMessage(rs);
		return null;
	}

	public ArrayList<ConvMessage> getLastMessages(int i) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("SELECT * FROM " + Database.convMessageDao.getTableName() + 
				" WHERE conv_id = ? ORDER BY id DESC LIMIT ?");
		st.setInt(1, getId());
		st.setInt(2, i);
		ResultSet rs = st.executeQuery();
		ArrayList<ConvMessage> res = new ArrayList<ConvMessage>();
		while(rs.next())
			res.add(new ConvMessage(rs));
		return res;
	}
}
