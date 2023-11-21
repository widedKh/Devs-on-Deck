<!-- Assuming you have included the necessary CSS for Devicons and FontAwesome -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/devicons/devicon@v2.15.1/devicon.min.css">

<meta charset="ISO-8859-1">
<title>DoD Dashboard</title>
</head>
<style>
.developer-info {
	display: flex;
	justify-content: space-between;

}


.languages-frameworks {
	display: flex;
	flex-direction: row;

}

.icon-container{

        align-items: center; /* Align icons and text vertically */
        margin-right: 10px; 

}
.bio{
margin:30px;
}

.name-bio h3 {
    border-bottom: 1px solid #000;
    padding: 3px;
    width: 150px;
}
</style>
<body style="background-color: #f8f9fa;">

	<!-- Include your navigation bar -->
	<jsp:include page="navbar.jsp" />

	<div class="m-5">
		<a href="/orgs/job/new">
			<button class="btn btn-outline-info"
				style="box-shadow: 4px 4px black">List a new position</button>
		</a>
	</div>

	<div class="row">
		<div class="col-md-6">
			<div class="card mx-5 shadow"
				style="width: 50%; border: 2px solid #000;">
				<div class="card-body">
					<h2 class="card-title text-center text-warning-emphasis mt-3 pb-2">Positions
						to Fill</h2>
					<c:forEach var="position" items="${positions}">
						<div class="m-3">
							<a href="/orgs/job/${position.id}"> <c:out
									value="${position.name}" />
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- Available Devs -->
		<div class="col-md-6">
			<div class="card shadow" style="width: 70%; border: 2px solid #000;">
				<div class="card-body" style="height: 400px; overflow-y: auto;">
					<h2 class="card-title text-center text-warning-emphasis mt-3 pb-2">Available Devs</h2>

					<c:forEach var="developer" items="${developers}">
						<div class="card mb-3">
							<div class="card-body developer-info">
								<div class="name-bio">
									<h3>${developer.firstName}  ${developer.lastName}</h3>
									<p class="bio">Bio: ${developer.bio}</p>
								</div>

								<div class="icon-info">
									<div class="languages-frameworks">
										<c:forEach var="language" items="${developer.languages}">
											<div class="icon-container">
												<i class="devicon-${language.toLowerCase()}-plain"></i>
												<div>${language}</div>
											</div>
										</c:forEach>

										<c:forEach var="framework" items="${developer.frameworks}">
											<div class="icon-container">
												<i class="devicon-${framework.toLowerCase()}-plain"></i>
												<div>${framework}</div>
											</div>
										</c:forEach>

									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
