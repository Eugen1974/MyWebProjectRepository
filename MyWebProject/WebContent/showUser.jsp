<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="styles/my.css" rel="stylesheet">
</head>
<body>
	<div align="center">
		<table border="1">
			<tr>
				<td colspan="2">
					<h3 align="center">Просмотр user-a</h3>
				</td>
			</tr>
			<tr>
				<td>Id</td>
				<td>${requestScope.USER.idUser}</td>
			</tr>
			<tr>
				<td>Имя</td>
				<td>${requestScope.USER.firstName}</td>
			</tr>
			<tr>
				<td>Отчество</td>
				<td>${requestScope.USER.secondName}</td>
			</tr>
			<tr>
				<td>Фамилия</td>
				<td>${requestScope.USER.lastName}</td>
			</tr>
			<tr>
				<td>Пароль</td>
				<td>${requestScope.USER.password}</td>
			</tr>
			<tr>
				<td>NickName</td>
				<td>${requestScope.USER.nameUser}</td>
			</tr>
		</table>
	</div>
	<jsp:include page="footer.html" />
</body>
</html>