<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>R. Nodankumar</title>
<style type="text/css">
table th, td {
	padding: 8px;
}

table {
	width: 30%;
}

.customBorder {
	border: 2px inset #800080;
}
</style>
</head>
<body>
	<form:form action="/addCitizen" method="post" modelAttribute="citizen">
		<table border="1" class="customBorder">
			<tr>
				<th>Add new Citizen</th>
			</tr>
			<tr>
				<td>Citizen Name <form:input path="cName" /></td>
			</tr>
			<tr>
				<td><form:label path="vaccinationCenters.name">Center Name:</form:label>
					<form:select path="vaccinationCenters.name">
						<form:options items="${centerNames}" />
					</form:select></td>
			</tr>
			<tr>
				<td><form:label path="vaccinationCenters.city">Citizen City:</form:label>
					<form:select path="vaccinationCenters.city">
						<form:options items="${cityNames}" />
					</form:select></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>
