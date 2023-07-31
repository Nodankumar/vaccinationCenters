<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>R. Nodankumar</title>

<style>
table tr td {
	padding: 10px;
	text-align: center;
}
#table1Width{
	width:40%;
}
.customBorder{
	border: 2px inset #800080;
}
.buttons{
	display:flex;
	justify-content:space-between;
}
.buttons input{
	margin:5px;
}
</style>

</head>
<body>
	<table border="1" class="customBorder" id="table1Width">
		<tr>
			<td><a href="displayCitizens">Citizens</a></td>
			<td><a href="displayAllCenters">Vaccination Centers</a></td>
			<td><a href="logout">Log Out</a></td>
			<td>Welcome, admin</td>
		</tr>
	</table>
	<h3>Citizens</h3>
	<table border="1" class="customBorder">
		<tr>
			<td>
				<form action="addCitizen" method="get">
					<input type="submit" value="Add New Citizen">
				</form>
			</td>
		</tr>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>City</th>
			<th>No. of Doses</th>
			<th>Vaccination Status</th>
			<th>Vaccination Center</th>
			<th>Action</th>
		</tr>
		<c:forEach var="citizen" items="${citizens}">
			<tr>
				<td>${citizen.id}</td>
				<td>${citizen.cName}</td>
				<td>${citizen.vaccinationCenters.city}</td>
				<td>${citizen.noOfDoses}</td>
				<td>${citizen.vaccinationStatus}</td>
				<td>${citizen.vaccinationCenters.name}</td>
				<td class="buttons">
					<form action="editCitizenform" method="get">
						<input type="hidden" name="id" value="${citizen.id}"> <input
							type="submit" value="Edit">
					</form>
					<form action="viewCitizenInfo" method="get">
						<input type="hidden" name="id" value="${citizen.id}"> <input
							type="submit" value="View">
					</form>
					<form action="deleteCitizen" method="get">
						<input type="hidden" name="id" value="${citizen.id}"> <input
							type="submit" value="Delete">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
