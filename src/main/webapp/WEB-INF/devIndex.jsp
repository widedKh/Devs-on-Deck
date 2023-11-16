<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Welcome to DevsOnDeck</title>
</head>
<body style="background-color: #f8f9fa;">
    <jsp:include page="navbar.jsp" />
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card mx-auto"
					style="width: 125%; background-color: #e9ecef; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
					<div class="card-body ml-3">
						<h2 class="card-title text-primary text-center mt-3 mb-5">Developer Sign Up</h2>
						<form:form action="/devs/register" method="post" modelAttribute="newDev" class="form-group">

							<div class="form-row mb-3">
								<div class="col-md-2">
									<label class="form-label">First name:</label>
								</div>
								<div class="col-md-3">
									<form:input name="firstName" path="firstName" class="form-control" />
									<form:errors path="firstName" class="text-danger" />
								</div>

								<div class="col-md-2 ml-5">
									<label class="form-label ">Last name:</label>
								</div>
								<div class="col-md-3">
									<form:input name="lastName" path="lastName" class="form-control" />
									<form:errors path="lastName" class="text-danger" />
								</div>
							</div>



							<div class="row mb-3">
								<div class="col-md-2">
									<label class="form-label">Email:</label>
								</div>
								<div class="col-md-9">
									<form:input name="email" path="email" type="email" 	class="form-control" />
									<form:errors path="email" class="text-danger" />
								</div>
							</div>


							<div class="row mb-3">
								<div class="col-md-2">
									<label for="address">Address:</label>
								</div>
								<div class="col-md-9">
									<form:input name="address" path="address" class="form-control" />
									<form:errors path="address" class="text-danger" />
								</div>
							</div>

							<div class="form-row mb-3">
								<div class="col-md-2">
									<label class="form-label">City:</label>
								</div>
								<div class="col-md-3">
									<form:input name="city" path="city" class="form-control" />
									<form:errors path="city" class="text-danger" />
								</div>

								<div class="col-md-2 ml-5">
									<label class="form-label">State:</label>
								</div>
								<div class="col-md-3">
									<form:input name="state" path="state" class="form-control" />
									<form:errors path="state" class="text-danger" />
								</div>
							</div>

							<div class="row mb-3 ">
								<div class="col-md-2">
									<label class="form-label">Password:</label>
								</div>
								<div class="col-md-9">
									<form:input name="password" path="password" type="password" class="form-control" />
									<form:errors path="password" class="text-danger" />
								</div>
							</div>

							<div class="row mb-3">
								<div class="col-md-2">
									<label class="form-label">Confirm:</label>
								</div>
								<div class="col-md-9">
									<form:input name="confirm" path="confirm" type="password" class="form-control" />
									<form:errors path="confirm" class="text-danger" />
								</div>
							</div>

							<div class="offset-md-9">
								
								<button type="submit" class="btn btn-success btn-lg shadow">Register</button>
							
							</div>
							<div  class="offset-md-5 mt-2">
								<a href="/orgs/register">Need to sign up an Organization?</a>
							</div>

						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
