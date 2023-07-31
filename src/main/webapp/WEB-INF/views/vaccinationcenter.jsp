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
.buttons{
	display:flex;
	align-content: space-around;
}
.buttons input{
	margin:5px;
}
.customBorder{
	border: 2px outset #800080;
}
#table1width{
width:39.4%;
}
</style>

</head>
<body>
	<table border="1" class="customBorder" id="table1width">
		<tr>
			<td><a href="displayCitizens">Citizens</a></td>
			<td><a href="displayAllCenters">Vaccination Centers</a></td>
			<td><a href="logout">Log Out</a></td>
			<td>Welcome, admin</td>
		</tr>
	</table>
	<h2>Centers</h2>
	<table border="1" class="customBorder">
		<tr>
			<td>
				<form action="AddVCform" method="get">
					<input type="submit" value="Add New Center">
				</form>
			</td>
		</tr>
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>CITY</th>
			<th>Action</th>
		</tr>
		<c:forEach var="vc" items="${vcs}">
			<tr>
				<td>${vc.id}</td>
				<td>${vc.name}</td>
				<td>${vc.city}</td>
				<td class="buttons">
					<form action="editcenter" method="get">
						<input type="hidden" name="id" value="${vc.id}"> <input
							type="submit" value="Edit">
					</form>
					<form action="viewVaccinationCenterInfo">
						<input type="hidden" name="id" value="${vc.id}">
						<input type="submit" value="View">
					</form>
					<form action="deleteCenter" method="post">
						<input type="hidden" name="id" value="${vc.id}"> <input
							type="submit" value="Delete">
					</form>

				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
