<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/devicons/devicon@v2.15.1/devicon.min.css">
    <title>Edit Position</title>

  
</head>

<body>

    <jsp:include page="navbar.jsp" />

    <div class="container mt-5">
        <div class="card mx-auto shadow" style="width: 50%; border: 2px solid #000;">
            <div class="card-body">
                <h2 class="card-title text-center text-warning-emphasis mt-3">Add Position</h2>

                <form:form action="/orgs/${position.id}/edit" method="post" modelAttribute="position" class="m-5 ">
                <input type="hidden" name="_method" value="put">
                    <!-- Name -->
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="name" class="col-form-label">Name:</label>
                        </div>
                        <div class="col-md-8">
                            <form:input path="name" type="text" name="name" class="form-control" />
                            <form:errors path="name" class="text-danger" />
                        </div>
                    </div>

                    <!-- Description -->
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="description" class="col-form-label">Description:</label>
                        </div>
                        <div class="col-md-8">
                            <form:textarea path="description" rows="5" cols="50" class="form-control"
                                placeholder="Add more about the position here" />
                            <form:errors path="description" class="text-danger" />
                        </div>
                    </div>

                    <!-- Skills -->
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="skills" class="col-form-label">Skills:</label>
                        </div>
                        <div class="col-md-8">
                            <div id="iconContainer" style="background-color: #e9ecef; height: 200px; overflow-y: auto;">
                                <!-- Icons will be dynamically added here -->
                            </div>
                            <input type="hidden" id="selectedSkills" name="skills" />
                            <form:errors path="skills" class="text-danger" />
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="offset-md-9">
                        <input type="submit" value="Edit position" class="btn btn-outline-info"
                            style="box-shadow: 4px 4px black" />
                    </div>
                </form:form>

                <!-- Custom Alert -->
                <div id="customAlert" class="alert alert-danger" style="display: none;">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong>Error!</strong>
                </div>

                <script>
					const iconList = [ 
						{iconClass : 'devicon-java-plain',name : 'Java'},
						{iconClass : 'devicon-python-plain',name : 'Python'},
						{iconClass : 'devicon-javascript-plain',name : 'JavaScript'},
					    {iconClass : 'devicon-html5-plain',	name : 'HTML5'},
					    {iconClass : 'devicon-css3-plain',name : 'CSS3'},
					    {iconClass : 'devicon-swift-plain',name : 'Swift'},
					    {iconClass : 'devicon-ruby-plain',name : 'Ruby'}, 
					    {iconClass : 'devicon-php-plain',name : 'PHP'},
					    {iconClass : 'devicon-cplusplus-plain',name : 'C++'},
					    {iconClass : 'devicon-csharp-plain',name : 'C#'},	
					    {iconClass : 'devicon-nodejs-plain',name : 'Node.js'},						
					    {iconClass : 'devicon-go-plain',name : 'Go'},	
					    {iconClass : 'devicon-dotnetcore-plain',name : '.Net'},
					    {iconClass : 'devicon-perl-plain',name : 'Perl'},
					    {iconClass : 'devicon-kotlin-plain',name : 'Kotlin'},
					    {iconClass : 'devicon-scala-plain',name : 'Scala'},
					    {iconClass : 'devicon-dart-plain',name : 'Dart'}, 
					    {iconClass : 'devicon-haskell-plain',name : 'Haskell'},				
					    {iconClass : 'devicon-rust-plain',name : 'Rust'}, 	
					    {iconClass : 'devicon-lua-plain',name : 'Lua'},	
					    {iconClass : 'devicon-typescript-plain',name : 'TypeScript'	},
			         	{iconClass : 'devicon-erlang-plain',name : 'Erlang'},		
				        {iconClass: 'devicon-react-original', name: 'React' },
				        {iconClass: 'devicon-angularjs-plain', name: 'Angular' },
				        {iconClass: 'devicon-vuejs-plain', name: 'Vue.js' },
				        {iconClass: 'devicon-bootstrap-plain',name: 'Bootstrap' },
				        { iconClass: 'devicon-nodejs-plain', name: 'Node.js' },
				        { iconClass: 'devicon-sass-original', name: 'Sass' },
				        { iconClass: 'devicon-less-plain-wordmark',name: 'Less' },
				        { iconClass: 'devicon-laravel-plain',name: 'Laravel' },
				        { iconClass: 'devicon-django-plain', name: 'Django' },
				        { iconClass: 'devicon-flask-original', name: 'Flask' },
				        { iconClass: 'devicon-spring-plain', name: 'Spring' },
				        { iconClass: 'devicon-materialui-plain', name: 'Materialui' },
				        { iconClass: 'devicon-express-original', name: 'Express' },
				        { iconClass: 'devicon-tailwindcss-plain',name: 'Tailwind CSS' },
				        { iconClass: 'devicon-d3js-plain', name: 'D3.js' },
				        { iconClass: 'devicon-threejs-original', name: 'Three.js' },
				       
					 ];
					 $(document).ready(function () {
					        const iconContainer = $('#iconContainer');
					        const selectedSkillsInput = $('#selectedSkills');
					        const customAlert = $('#customAlert');
					        const selectedSkills = '${position.skills}'; 

					        // Function to show custom alert
					        function showAlert(message) {
					            customAlert.find('strong').text(message);
					            customAlert.slideDown();
					            setTimeout(function () {
					                customAlert.slideUp();
					            }, 8000);

					            // Function to hide the alert when the close button is clicked
					            $('#customAlert .close').click(function () {
					                $(this).parent().slideUp();
					            });
					        }

					        // Function to update selected skills input
					        function updateSelectedSkills() {
					            const selectedSkills = [];
					            iconContainer.find('.selected').each(function () {
					                selectedSkills.push($(this).data('skill'));
					            });

					            if (selectedSkills.length > 5) {
					                showAlert('You can select up to 5 skills.');
					                // Deselect the last selected skill if the limit is exceeded
					                iconContainer.find('.selected:last').removeClass('selected');
					                return;
					            }

					            selectedSkillsInput.val(selectedSkills.join(','));
					        }

					        // Function to handle skill icon click
					        function handleIconClick(icon) {
					            icon.toggleClass('selected');
					            updateSelectedSkills();
					        }

					        // Dynamically generate skill icons
					        iconList.forEach(function (skill) {
					            const icon = $('<i>').addClass(skill.iconClass);
					            const skillName = $('<div>').text(skill.name);
					            const iconContainer = $('<div>').addClass('icon-container').append(icon).append(skillName).data('skill', skill.name);

					            // Check if the skill is selected for the current position
					            if (selectedSkills.includes(skill.name)) {
					                iconContainer.addClass('selected');
					            }

					            iconContainer.click(function () {
					                handleIconClick($(this));
					            });

					            $('#iconContainer').append(iconContainer);
					        });
					    });
					
				</script>

			</div>
		</div>
	</div>
</body>
</html>
