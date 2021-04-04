package db;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public interface Dao<T extends TableRow> {
	T findOneById(int id) throws SQLException;
	T findOneBy(Map<String, String> pairs) throws SQLException;
	ArrayList<T> findAll() throws SQLException;
	ArrayList<T> findBy(Map<String, String> pairs) throws SQLException;
	
	void insert(T data) throws SQLException;
	void update(T data) throws SQLException;
	void delete(int id) throws SQLException;
}
