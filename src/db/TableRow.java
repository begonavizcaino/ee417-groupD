package db;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TableRow {

	private int id;
	
	public TableRow(ResultSet rs) throws SQLException {
		id = rs.getInt("id");
	}

	public int getId() {
		return id;
	}
}
