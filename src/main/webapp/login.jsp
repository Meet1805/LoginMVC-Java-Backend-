<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
</head>
<body>
<h2>User Login</h2>
<form action="login" method="post">
Email:
<input type="email" name="email" required>
<br><br>
Password:
<input type="password" name="password" required>
<br><br>
<input type="submit" value="Login">
</form>
<br>
<a href="register.jsp">
New User? Register Here
</a>
</body>
</html>