package db;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AttachedContent extends TableRowId {
	private String content;
	
	private int postId;

	public AttachedContent(ResultSet rs) throws SQLException {
		super(rs);
		content = rs.getString("content");
		postId = rs.getInt("post_id");
	}

	public AttachedContent(int postId, String content) {
		super();
		this.postId = postId;
		this.content = content;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}
	
	public Post getPost() throws SQLException {
		return Database.postDao.findOneById(postId);
	}
}
