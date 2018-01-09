<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="styles/my.css" rel="stylesheet">
</head>
<body>
	<h2 align="center">Welcome&nbsp;${sessionScope.USER.lastName}&nbsp;${sessionScope.USER.firstName}&nbsp;${sessionScope.USER.secondName}&nbsp;!</h2>
	<hr>
	<jsp:include page="listAllUsers.jsp" />
	<jsp:include page="footer.html" />
</body>
</html>
