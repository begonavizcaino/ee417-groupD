package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDao extends DaoId<User> {
	
	private static final String tableName = "users";

	@Override
	public void insert(User data) throws SQLException {
		int i=1;
		PreparedStatement st = Database.getDbConnection().prepareStatement("INSERT INTO " + tableName + 
				" (username, password, role, picture, firstname, lastname, nationality, studyin, birth, bio) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
				Statement.RETURN_GENERATED_KEYS);
		st.setString(i++, data.getUsername());
		st.setString(i++, data.getPassword());
		st.setString(i++, data.getRole().toString());
		st.setString(i++, data.getPicture());
		st.setString(i++, data.getFirstName());
		st.setString(i++, data.getLastName());
		st.setString(i++, data.getNationality());
		st.setString(i++, data.getStudyIn());
		st.setDate(i++, data.getBirth());
		st.setString(i++, data.getBio());
		st.execute();
		try (ResultSet keys = st.getGeneratedKeys()) {
		    if(keys.next())
		    	data.setId(keys.getInt(1));
		}
	}

	@Override
	public void update(User data) throws SQLException {
		int i=1;
		PreparedStatement st = Database.getDbConnection().prepareStatement("UPDATE " + tableName
				+ " SET username = ?, password = ?, role = ?, picture = ?, firstname = ?, lastname = ?, nationality = ?, studyin = ?, birth = ?, bio = ? "
				+ "WHERE id = ?");
		st.setString(i++, data.getUsername());
		st.setString(i++, data.getPassword());
		st.setString(i++, data.getRole().toString());
		st.setString(i++, data.getPicture());
		st.setString(i++, data.getFirstName());
		st.setString(i++, data.getLastName());
		st.setString(i++, data.getNationality());
		st.setString(i++, data.getStudyIn());
		st.setDate(i++, data.getBirth());
		st.setString(i++, data.getBio());
		st.setInt(i++, data.getId());
		st.execute();
	}

	@Override
	public String getTableName() {
		return tableName;
	}

	@Override
	public User createNew(ResultSet rs) throws SQLException {
		return new User(rs);
	}

}
