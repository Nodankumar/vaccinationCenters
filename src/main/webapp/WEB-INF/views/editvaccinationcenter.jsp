<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>R. Nodankumar</title>
<style>
table{
	width:40%;
}
th, td {
	padding: 20px;
}
td h3{
	margin:0px;
	padding:0px;
}
.customBorder{
	border: 2px outset #800080;
}
</style>
</head>
<body>

	<form:form action="editcenter" method="post" modelAttribute="vc">
		<table border="1" class="customBorder">
			<tr>
				<td><h3>Center Information</h3></td>
			</tr>
			<tr>
				<th>Edit ${vc.name}</th>
			</tr>
			<tr>
				<td><form:label path="name">Center Name:  </form:label> <form:input
						path="name" /></td>
			</tr>
			<tr>
				<td><form:label path="city">Center City:</form:label> <select
					name="city">
						<option value="Warangal" label="Warangal"
							${vc.city == 'Warangal' ? 'selected' : ''}></option>
						<option value="Hyderabad" label="Hyderabad"
							${vc.city == 'Hyderabad' ? 'selected' : ''}></option>
						<option value="Mulugu" label="Mulugu"
							${vc.city == 'Mulugu' ? 'selected' : ''}></option>
						<option value="Mumbai" label="Mumbai"
							${vc.city == 'Mumbai' ? 'selected' : ''}></option>
						<option value="Pune" label="pune"
							${vc.city == 'Pune' ? 'selected' : ''}></option>
						<option value="Bengaluru" label="Bengaluru"
							${vc.city == 'Bengaluru' ? 'selected' : ''}></option>
				</select></td>
			</tr>
			<tr>
				<td><input type="submit" value="Update"></td>
			</tr>
		</table>
		<input type="hidden" name="id" value="${vc.id}" />
	</form:form>
</body>
</html>
