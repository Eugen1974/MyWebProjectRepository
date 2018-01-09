package db;

import java.sql.CallableStatement;
import java.sql.SQLException;

@FunctionalInterface
public interface ISql1 {

	void apply(CallableStatement statement) throws SQLException;
}
