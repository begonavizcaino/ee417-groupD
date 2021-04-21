package db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class Post extends TableRowId {
	private int userId;
	private int parentId;
	private String title;
	private String message;
	
	public Post(ResultSet rs) throws SQLException {
		super(rs);
		userId = rs.getInt("user_id");
		parentId = rs.getInt("parent_id");
		title = rs.getString("title");
		message = rs.getString("message");
	}
	
	public Post(int userId, int parentId, String title, String message) {
		super();
		this.userId = userId;
		this.parentId = parentId;
		this.title = title;
		this.message = message;
	}

	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public int getParentId() {
		return parentId;
	}
	
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getDate() {
		return "not implemented";// TODO: add date
	}
	
	public ArrayList<AttachedContent> getAttachedContent() throws SQLException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("post_id", getId());
		return Database.attachedContentDao.findBy(map);
	}
	
	public String getFirstAttachedContent() throws SQLException {
		ArrayList<AttachedContent> arr = this.getAttachedContent();
		return "data:image/jpeg;base64," + arr.get(0).getContent();
	}
	
	public Post getParentPost() throws SQLException {
		return parentId >= 0 ? Database.postDao.findOneById(parentId) : null;
	}
	
	public ArrayList<Post> getComments() throws SQLException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("parent_id", getId());
		return Database.postDao.findBy(map);
	}
	
	public User getUser() throws SQLException {
		return Database.userDao.findOneById(userId);
	}
}
