<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>R. Nodankumar</title>

<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.loginContainer {
	text-align: left;
	border: 2px solid #800080;
	padding: 10px;
}

.loginContainer form {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}

.loginContainer input {
	margin: 8px;
}
</style>
</head>
<body>
	<div class="loginContainer">
		<form action="login" method="post">
			<h2>Login</h2>
			Username: <input type="email" id="email" name="email">
			Password: <input type="password" id="password" name="password">
			<input type="submit" value="Login">
		</form>
		<form action="registerUser">
			<input type="submit" value="Registration">
		</form>
	</div>
</body>
</html>