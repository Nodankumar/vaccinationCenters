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

.registerContainer {
	text-align: left;
	border: 2px inset #800080;
	padding: 10px;
}

.registerContainer form {
	display: flex;
	flex-direction: column;
	align-items: center;
}
table tr th,td{
	padding:10px;
}
.registerButton{
	margin:10px;
}
</style>
</head>
<body>
	<div class="registerContainer">
		<h3>Admin Registration</h3>
		<form action="registerUser" method="post">
			<table border="1">
				<tr>
					<th>Registration</th>
				</tr>
				<tr>
					<td>Name: <input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<td>Email: <input type="email" name="email" id="email"></td>
				</tr>
				<tr>
					<td>Password: <input type="password" name="password"
						id="password"></td>
				</tr>
			</table>
			<input type="submit" value="Register" class="registerButton">
		</form>
	</div>
</body>
</html>