<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="styles/my.css" rel="stylesheet">
</head>
<body>
	<div align="center">
		<table>
			<tr>
				<td>idUser</td>
				<td>firstName</td>
				<td>secondName</td>
				<td>lastName</td>
				<td>password</td>
				<td>nameUser</td>
			</tr>
			<c:forEach items="${requestScope.ALL_USERS}" var="user">
				<tr>
					<td>${user.idUser}</td>
					<td>${user.firstName}</td>
					<td>${user.secondName}</td>
					<td>${user.lastName}</td>
					<td>${user.password}</td>
					<td>${user.nameUser}</td>
					<td><a href="start?action=update&idUser=${user.idUser}">Edit</a><td>
					<td><a href="start?action=view&idUser=${user.idUser}">Show</a></td>
					<td><a href="start?action=delete&idUser=${user.idUser}">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>