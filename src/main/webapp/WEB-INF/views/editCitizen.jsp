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
	padding: 10px;
}
table{
	width:30%;
}
.customBorder{
	border: 2px inset #800080;
}
</style>
</head>
<body>

	<form:form modelAttribute="citizen" method="POST"
		action="updateCitizen?id=${citizen.id}">
		<input type="hidden" name="vaccinationCentersId" value="${citizen.vaccinationCenters.id}">
		<table border="1" class="customBorder">
			<tr>
				<th><h2>Edit Citizen</h2></th>
			</tr>
			<tr>
				<td>Citizen Name: <form:input path="cName" /></td>
			</tr>
			<tr>
				<td>Citizen City: <form:select path="vaccinationCenters.city">
						<form:options items="${citynames}" />
					</form:select></td>
			</tr>
			<tr>
				<td>No. of Doses: <form:select path="noOfDoses">
						<form:option value="0">None</form:option>
						<form:option value="1">1</form:option>
						<form:option value="2">2</form:option>
					</form:select></td>
			</tr>
			<tr>
				<td>Vaccination Center: <form:select
						path="vaccinationCenters.name">
						<form:options items="${centerNames}" />
					</form:select></td>
			</tr>
			<tr>
				<td colspan="1"><input type="submit" value="Update Citizen" /></td>
			</tr>
		</table>
	</form:form>
</body>
</html>
