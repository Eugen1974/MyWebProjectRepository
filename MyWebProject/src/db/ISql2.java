package db;

import java.sql.SQLException;

@FunctionalInterface
public interface ISql2<T> {

	T get() throws SQLException;
}
