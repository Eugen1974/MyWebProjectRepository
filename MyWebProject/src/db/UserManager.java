package db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import others.NoDataFoundException;

public class UserManager {

	private UserManager() {
	}

	public static User getUserById(int idUser) {
		return getUser(statement -> {
			statement.setInt(1, idUser);
		}, "SELECT * FROM DICT_USERS WHERE ID_USER=?", "There is no user with id = " + idUser + " !");
	}

	public static User getUserByNickNameAndPassword(String nickName, String password) {
		return getUser(statement -> {
			statement.setString(1, nickName);
			statement.setString(2, password);
		}, "SELECT * FROM DICT_USERS WHERE NAME_USER=? AND PASSWORD=?",
				"There is no user with nickName " + nickName + " and password " + password + " !");
	}

	public static User getUser(ISql1 lambda, String sqlString, String errorMessage) {
		try (CallableStatement statement = UtilSql.getConnection().prepareCall(sqlString)) {
			lambda.apply(statement);
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					return new User(resultSet.getInt("ID_USER"), resultSet.getString("FIRST_NAME"),
							resultSet.getString("SECOND_NAME"), resultSet.getString("LAST_NAME"),
							resultSet.getString("PASSWORD"), resultSet.getString("NAME_USER"));
				}
				throw new NoDataFoundException(errorMessage);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public static List<User> getAllUsers() {
		return UtilSql.getResult1(resultSet -> {
			List<User> users = new ArrayList<>();
			while (resultSet.next()) {
				users.add(new User(resultSet.getInt("ID_USER"), resultSet.getString("FIRST_NAME"),
						resultSet.getString("SECOND_NAME"), resultSet.getString("LAST_NAME"),
						resultSet.getString("PASSWORD"), resultSet.getString("NAME_USER")));
			}
			return users;
		}, "SELECT * FROM DICT_USERS ORDER BY 1");
	}

	public static List<User> getUsersByName(String name) {
		return UtilSql.getResult2(statement -> {
			statement.setString(1, "%" + name.toUpperCase() + "%");
			try (ResultSet resultSet = statement.executeQuery()) {
				List<User> users = new ArrayList<>();
				while (resultSet.next()) {
					users.add(new User(resultSet.getInt("ID_USER"), resultSet.getString("FIRST_NAME"),
							resultSet.getString("SECOND_NAME"), resultSet.getString("LAST_NAME"),
							resultSet.getString("PASSWORD"), resultSet.getString("NAME_USER")));
				}
				return users;
			}
		}, "SELECT * FROM DICT_USERS WHERE UPPER(FIRST_NAME) LIKE ? ORDER BY 1");
	}

	public static void insertUser(User user) {
		UtilSql.executeTransaction1(statement -> {
			user.setIdUser(getNextId(statement.getConnection()));
			statement.setInt(1, user.getIdUser());
			statement.setString(2, user.getFirstName());
			statement.setString(3, user.getSecondName());
			statement.setString(4, user.getLastName());
			statement.setString(5, user.getPassword());
			statement.setString(6, user.getNameUser());
		}, "INSERT INTO DICT_USERS(ID_USER, FIRST_NAME, SECOND_NAME, LAST_NAME, PASSWORD, NAME_USER) VALUES (?, ?, ?, ?, ?, ?)");
	}

	public static void updateUser(User user) {
		UtilSql.executeTransaction1(statement -> {
			statement.setString(1, user.getFirstName());
			statement.setString(2, user.getSecondName());
			statement.setString(3, user.getLastName());
			statement.setString(4, user.getPassword());
			statement.setString(5, user.getNameUser());
			statement.setInt(6, user.getIdUser());
		}, "UPDATE DICT_USERS SET FIRST_NAME=?, SECOND_NAME=?, LAST_NAME=?, PASSWORD=?, NAME_USER=? WHERE ID_USER = ?");
	}

	public static void deleteUser(int idUser) {
		UtilSql.executeTransaction2(connection -> {
			try (PreparedStatement statement1 = connection.prepareStatement("DELETE FROM PURCHASES WHERE ID_USER = ?");
					PreparedStatement statement2 = connection
							.prepareStatement("DELETE FROM DICT_USERS WHERE ID_USER = ?")) {
				statement1.setInt(1, idUser);
				statement1.executeUpdate();

				statement2.setInt(1, idUser);
				statement2.executeUpdate();
			}
		});
	}

	public static int getNextId(Connection connection) {
		try (ResultSet resultSet = connection.createStatement().executeQuery("SELECT SEQ_ID.NEXTVAL FROM DUAL")) {
			resultSet.next();
			return resultSet.getInt(1);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
/*
	public static void main(String[] args) {
		System.out.println(UserManager.getUserByNickNameAndPassword("evg", "aaa") + "\n");
		System.out.println(UserManager.getUserById(3) + "\n");

		User user = new User(0, "FIRST_NAME", "SECOND_NAME", "LAST_NAME", "PASSWORD", "NAME_USER");
		UserManager.insertUser(user);
		System.out.println(UserManager.getUserById(user.getIdUser()));
		System.out.println("new id = " + user.getIdUser() + "\n");

		UserManager.getAllUsers().forEach(System.out::println);

		int id = 76;
		System.out.println("\n" + UserManager.getUserById(id));
		UserManager.updateUser(new User(id, "aaa", "bbb", "ccc", "ddd", "eee"));
		System.out.println(UserManager.getUserById(id) + "\n");

		UserManager.getUsersByName("п").forEach(System.out::println);

		UserManager.deleteUser(id);
		System.out.println(UserManager.getUserById(id));

		UtilSql.closeConnection();
	}
*/}
