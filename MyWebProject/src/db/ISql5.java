package db;

import java.sql.Connection;
import java.sql.SQLException;

@FunctionalInterface
public interface ISql5 {

	void apply(Connection connection) throws SQLException;
}
