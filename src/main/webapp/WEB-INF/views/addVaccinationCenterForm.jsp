<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>R. Nodankumar</title>
<style>
table{
	width:30%;
}
table th, td{
	padding: 10px;
}
.customBorder{
	border: 2px inset #800080;
}
</style>
</head>
<body>
	<form action="AddVC" method="post">
	<table border="1" class="customBorder">
		<tr>
			<th>Add new Vaccination center</th>
		</tr>
		<tr>
			<td>Center Name <input type="text" name="centerName"></td>
		</tr>
		<tr>
			<td>Center City <select name="centerCity">
			<option value="Warangal">warangal</option>
			<option value="Hyderabad">Hyderabad</option>
			<option value="Mulugu">Mulugu</option>
			<option value="Mumbai">Mumbai</option>
			<option value="Pune">Pune</option>
			<option value="Bengaluru">Bengaluru</option>
			</select>
			</td>
		</tr>
		<tr><td><input type="submit" value="submit"></td></tr>
	</table>
	</form>
</body>
</html>