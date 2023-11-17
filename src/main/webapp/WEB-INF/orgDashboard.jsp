<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>DoD Dashboard</title>
</head>
<body style="background-color: #f8f9fa;">
     <jsp:include page="navbar.jsp" />
        <div class="m-5">
        <a href="/orgs/job/new">
        <button class="btn  btn-outline-info" style="box-shadow: 4px 4px black" > List a new position</button>
        </a>
			
		</div>
		<div class="card mx-auto shadow"style="width: 30%; border: 2px solid #000;">
			<div class="card-body">
				<h2 class="card-title text-center text-warning-emphasis mt-3">position to fill</h2>
		 <c:forEach var="position" items="${positions}">
             
                <a href="/orgs/job/${position.id}"><c:out value="${position.name}"/></a>
             
        </c:forEach>
	
	</div>
	</div>
</body>
</html>