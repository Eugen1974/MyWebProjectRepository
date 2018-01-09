package db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.PooledConnection;

import oracle.jdbc.pool.OraclePooledConnection;

public class UtilSql {

	private static PooledConnection connection;

	static {
		try {
			connection = new OraclePooledConnection("jdbc:oracle:thin:@KRR-SQL23:1521:develop", "DEV", "START123");
		} catch (SQLException e) {
			e.printStackTrace();
			System.exit(0);
		}
	}

	private UtilSql() {
	}

	public static Connection getConnection() {
		try {
			Connection connection_ = connection.getConnection();
			connection_.setAutoCommit(false);
			return connection_;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public static void closeConnection() {
		try {
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public static void executeTransaction1(ISql1 lambda, String sqlString) {
		try (Connection connection = UtilSql.getConnection();
				CallableStatement statement = connection.prepareCall(sqlString)) {
			lambda.apply(statement);
			statement.execute();
			connection.commit();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public static void executeTransaction2(ISql5 lambda) {
		try (Connection connection = UtilSql.getConnection()) {
			lambda.apply(connection);
			connection.commit();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public static <T> T getResult1(ISql3<T> lambda, String sqlString) {
		try (CallableStatement statement = UtilSql.getConnection().prepareCall(sqlString);
				ResultSet resultSet = statement.executeQuery()) {
			return lambda.get(resultSet);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public static <T> T getResult2(ISql4<T> lambda, String sqlString) {
		try (CallableStatement statement = UtilSql.getConnection().prepareCall(sqlString)) {
			return lambda.get(statement);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
