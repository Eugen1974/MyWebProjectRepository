<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="styles/my.css" rel="stylesheet">
</head>
<body>
	<div align="center">
		<form action="start?action=insert" method="post">
			<input type="hidden" name="idUser" value="${requestScope.USER.idUser}">
			<table>
				<tr>
					<td colspan="2">
						<h3 align="center">Регистрация или корректировка user-a</h3>
					</td>
				</tr>
				<tr>
					<td>Имя</td>
					<td><input type="text" name="firstName" value="${requestScope.USER.firstName}"></td>
				</tr>
				<tr>
					<td>Отчество</td>
					<td><input type="text" name="secondName" value="${requestScope.USER.secondName}"></td>
				</tr>
				<tr>
					<td>Фамилия</td>
					<td><input type="text" name="lastName" value="${requestScope.USER.lastName}"></td>
				</tr>
				<tr>
					<td>Пароль</td>
					<td><input type="password" name="password" value="${requestScope.USER.password}"></td>
				</tr>
				<tr>
					<td>NickName</td>
					<td><input type="text" name="nameUser" value="${requestScope.USER.nameUser}"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="Отправить"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>