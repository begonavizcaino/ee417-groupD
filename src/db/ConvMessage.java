package db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class ConvMessage extends TableRowId {
	private String message;
	private int user_id;
	private int conv_id;
	
	public ConvMessage(ResultSet rs) throws SQLException {
		super(rs);
		message = rs.getString("message");
		user_id = rs.getInt("user_id");
		conv_id = rs.getInt("conv_id");
	}
	
	public ConvMessage(String message, int user_id, int conv_id) {
		super();
		this.message = message;
		this.user_id = user_id;
		this.conv_id = conv_id;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getConv_id() {
		return conv_id;
	}

	public void setConv_id(int conv_id) {
		this.conv_id = conv_id;
	}

	public User getUser() throws SQLException {
		return Database.userDao.findOneById(user_id);
	}
	
	public Conversation getConversation() throws SQLException {
		return Database.conversationDao.findOneById(conv_id);
	}
}
