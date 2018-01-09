package db;

import java.sql.CallableStatement;
import java.sql.SQLException;

@FunctionalInterface
public interface ISql4<T> {

	T get(CallableStatement statement) throws SQLException;
}
