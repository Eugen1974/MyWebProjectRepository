<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="styles/my.css" rel="stylesheet">
</head>
<body>
	<div align="center">
		<form action="start?action=autorization" method="post">
			<table>
				<tr>
					<td colspan="2">
						<h3 align="center">Авторизация user-a</h3>
					</td>
				</tr>
				<tr>
					<td>NickName</td>
					<td><input type="text" name="nameUser"></td>
				</tr>
				<tr>
					<td>Пароль</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="Отправить"></td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.html" />
</body>
</html>