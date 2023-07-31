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
.customBorder{
	border: 2px outset #800080;
}
.container{
	border: 1px ridge #800080;
	padding:10px;
	width:34%;
}
#table2Width{
	width:40%;
}
</style>
</head>
<body>
	<div class="container">
	<table border="1" class="customBorder">
		<tr>
			<td><a href="displayCitizens">Citizens</a></td>
			<td><a href="displayAllCenters">Vaccination Centers</a></td>
			<td><a href="logout">Log Out</a></td>
			<td>Welcome, admin</td>
		</tr>
	</table>
	<h3>Center Information</h3>
	<table border="1" class="customBorder" id="table2Width">
		<tr>
			<th colspan="2">Name</th>
		</tr>
		<tr>
			<td colspan="2">${vaccinationcenter.name}</td>
		</tr>
		<tr>
			<td>ID:</td>
			<td>${vaccinationcenter.id}</td>
		</tr>
		<tr>
			<td>City:</td>
			<td>${vaccinationcenter.city}</td>
		</tr>
	</table>
	<hr />
	<h3>All Citizes Of this Center</h3>
	<table border="1" class="customBorder">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Action</th>
		</tr>
		<c:forEach var="cl" items="${citizensList}">
			<tr>
				<td>${cl.id}</td>
				<td>${cl.cName}</td>
				<td><a href="viewCitizenInfo?id=${cl.id}">View</a></td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>
