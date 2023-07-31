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
	padding:10px;
	text-align:center;
}
.customBorder{
	border: 2px inset #800080;
}
</style>
</head>
<body>
	<h2>Citizen Information</h2>
	<table border="1" class="customBorder">
		<tr>
			<th colspan="2">${citizen.cName}</th>
		</tr>
		<tr>
			<td>ID: </td><td>${citizen.id}</td>
		</tr>
		<tr>
			<td>City: </td><td>${citizen.vaccinationCenters.city}</td>
		</tr>
		<tr>
			<td>Number of Vaccines: </td><td>${citizen.noOfDoses}</td>
		</tr>
		<tr>
			<td>Vaccination status: </td><td>${citizen.vaccinationStatus}</td>
		</tr>
		<tr>
			<td>Allocated Vaccination Center: </td><td><a href="viewVaccinationCenterInfo?id=${citizen.vaccinationCenters.id}">${citizen.vaccinationCenters.name}</a></td>
		</tr>
	</table>
</body>
</html>