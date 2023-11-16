<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Welcome to DevsOnDeck</title>
</head>
<body>
    <div class="m-5 w-50">
       
    
<form:form action="/devs/login" method="post" modelAttribute="newLogin" class="mt-5">

	<table class="table table-bordered">
		<thead>
	    	<tr>
	            <th colspan="2" class="text-center">Welcome Back, Developer!</th>
	            <h4>Let's connect you to a job</h4>
	        </tr>
	    </thead>
	    <thead>
	        <tr>
	            <td scope="col">Email:</td>
	            <td >
	            	<form:errors path="email" class="text-danger"/>
					<form:input class="form-control" path="email"/>
	            </td>
	        </tr>
	        <tr>
	            <td scope="col">Password:</td>
	            <td >
	            	<form:errors path="password" class="text-danger"/>
					<form:input type="password" class="form-control" path="password"/>
	            </td>
	        </tr>
	        <tr>
	        	<td colspan=2><input  type="submit" value="Submit" class="col-sm-10 btn btn-light" style="box-shadow: 4px 4px black" /></td>
	        </tr>
	    </thead>
	</table>
</form:form>
</div>

</body>
</html>
</body>
</html>