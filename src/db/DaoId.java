package db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public abstract class DaoId<T extends TableRowId> extends Dao<T> {
	
	public T findOneById(int id) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("SELECT * FROM " + getTableName() + " WHERE id = ?");
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();
		if(rs.next())
			return createNew(rs);
		return null;
	}

	@Override
	public void delete(T data) throws SQLException {
		delete(data.getId());
	}

	public void delete(int id) throws SQLException {
		PreparedStatement st = Database.getDbConnection().prepareStatement("DELETE FROM " + getTableName() + " WHERE id = ?");
		st.setInt(1, id);
		st.execute();
	}
}
