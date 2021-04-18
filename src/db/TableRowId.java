package db;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TableRowId extends TableRow {

	private int id;
	
	public TableRowId(ResultSet rs) throws SQLException {
		id = rs.getInt("id");
	}

	public TableRowId() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
