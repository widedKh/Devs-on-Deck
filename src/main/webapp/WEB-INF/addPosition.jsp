<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<title>New Position</title>
</head>
<body>

	<jsp:include page="navbar.jsp" />

	<div class="container mt-5">
		<div class="card mx-auto shadow"
			style="width: 50%; border: 2px solid #000;">
			<div class="card-body">
				<h2 class="card-title text-center text-warning-emphasis mt-3">AddPosition</h2>

				<form:form action="/orgs/job/new" method="post" modelAttribute="position" class="m-5">

					<div class="row mb-3">
						<div class="col-md-4">
							<label for="name" class="col-form-label">Name:</label>
						</div>
						<div class="col-md-8">
							<form:input path="name" type="text" name="name" class="form-control" />
							<form:errors path="name" class="text-danger" />
						</div>
					</div>

					<div class="row mb-3">
						<div class="col-md-4">
							<label for="description" class="col-form-label">Description:</label>
						</div>
						<div class="col-md-8">
							<form:textarea path="description" rows="5" cols="50" class="form-control" placeholder="Add more about the position here"/>
                            <form:errors path="description" class="text-danger"/>          
						</div>
					</div>

                     	<div class="row mb-3">
						<div class="col-md-4">
							<label for="skills" class="col-form-label">Skills:</label>
						</div>
						<div class="col-md-8">
							<form:select id="skills" name="skills[]" multiple="true" class="form-control" path="skill"/>

							<form:errors path="skill" class="text-danger" />
						</div>
					</div>


					<div class="offset-md-9">
						<input type="submit" value="Add position"
							class="btn  btn-outline-info" style="box-shadow: 4px 4px black" />
					</div>
				</form:form>
				
				 <script>
                     $.get('https://api.github.com/languages', function (data) {
                      var skillsDropdown = $('#skills');
                       data.forEach(function (language) {
                       skillsDropdown.append($('<option>', { value: language.name, text: language.name }));
                      });
                    });
                     

                  $(document).ready(function() {
                      var skillsSelect = $('#skills');

                  $.ajax({
                  url: 'https://registry.npmjs.org/-/v1/search?text=keywords:framework&size=80',
                   method: 'GET',
                   success: function(data) {
                    if (data.objects && Array.isArray(data.objects)) {
                        var frameworks = data.objects.map(function(obj) {
                            return obj.package.name;
                        });

                        frameworks.forEach(function(framework) {
                            skillsSelect.append($('<option>', {
                                value: framework,
                                text: framework
                            }));
                        });

                        skillsSelect.select2({
                            placeholder: 'Select up to 5 skills',
                        });
                    } else {
                        console.error('Invalid data format received from the API.');
                     }
                 },
                  error: function(xhr, status, error) {
                    console.error('Error fetching frameworks:', error);
                  }
               });
           });
         </script>

			</div>
		</div>
	</div>
</body>
</html>
