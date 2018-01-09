package db;

import java.sql.ResultSet;
import java.sql.SQLException;

@FunctionalInterface
public interface ISql3<T> {

	T get(ResultSet resultSet) throws SQLException;
}
