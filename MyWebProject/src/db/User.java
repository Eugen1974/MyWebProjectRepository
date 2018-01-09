package db;

import java.util.Objects;

public class User {

	private int idUser;
	private String firstName;
	private String secondName;
	private String lastName;
	private String password;
	private String nameUser;

	public User() {
	}

	public User(int idUser) {
		this(idUser, null, null, null, null, null);
	}

	public User(int idUser, String firstName, String secondName, String lastName, String password, String nameUser) {
		this.idUser = idUser;
		this.firstName = firstName;
		this.secondName = secondName;
		this.lastName = lastName;
		this.password = password;
		this.nameUser = nameUser;
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getSecondName() {
		return secondName;
	}

	public void setSecondName(String secondName) {
		this.secondName = secondName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNameUser() {
		return nameUser;
	}

	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}

	@Override
	public String toString() {
		return "User [idUser=" + idUser + ", firstName=" + firstName + ", secondName=" + secondName + ", lastName="
				+ lastName + ", password=" + password + ", nameUser=" + nameUser + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(idUser, firstName, secondName, lastName, password, nameUser);
	}

	@Override
	public boolean equals(Object ob) {
		if (ob instanceof User) {
			User temp = (User) ob;
			return idUser == temp.idUser
				   && Objects.equals(firstName,  temp.firstName)
				   && Objects.equals(secondName, temp.secondName) 
				   && Objects.equals(lastName,   temp.lastName)
				   && Objects.equals(password,   temp.password) 
				   && Objects.equals(nameUser,   temp.nameUser);
		}
		return false;
	}

	@Override
	public User clone() {
		return new User(idUser, firstName, secondName, lastName, password, nameUser);
	}
}
