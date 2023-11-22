<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Welcome to DevsOnDeck</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/devicons/devicon@v2.15.1/devicon.min.css">

</head>
<body style="background-color: #f8f9fa;">

	<jsp:include page="navbar.jsp" />
	<div class="container mt-3">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="d-flex" style="background-color: #6FA8DC; width: 125%;">
					<div class="col-md-6 p-3">
						<h1 class="ml-1">Add Your Skills</h1>
					</div>
					<div class="col-md-5 mt-4 p-2">
						<div class="progress" style="height: 1, 6rem; width: 100%;">
							<div class="progress-bar bg-success" role="progressbar"
								 aria-valuenow="25" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div>
					</div>
				</div>

				<div class="card mx-auto"
					style="width: 125%; height: 95%; max-height: 95%; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
					<div class="card-body ">
						<form id="iconForm" action="/skills/frameworks/submit"
							method="post">

							<input type="hidden" id="selectedIcon" name="selectedIcon">
							<input type="hidden" name="bio">
							
							<div class="row mb-3">

								<div class="col-md-6">
									<h3 class="mt-4 mb-5">Pick Your Top 5 Frameworks or
										Libraries</h3>
									<div id="iconContainer" style="background-color: #e9ecef;">
										<!-- Icons will be dynamically added here -->
									</div>
								</div>

								<div class="col-md-5">
									<div class="mt-3 mb-2" id="iconSelectedContainer"></div>

									<div class="mt-5">Completing your developer profile is crucial for
										several reasons: Professional Image: A well-detailed profile
										reflects professionalism and showcases your commitment to your
										work. It's the first impression others will have of you.

										Credibility: A completed profile adds credibility to your
										skills and experience. It helps others understand your
										expertise, making you more trustworthy in professional
										networks. Visibility: A complete profile increases your
										visibility on platforms like LinkedIn or professional
										websites. Recruiters and potential collaborators are more
										likely to find you when searching for specific skills.

										Networking Opportunities: A detailed profile opens doors for
										networking. Other professionals can easily connect with you,
										increasing opportunities for collaboration, mentorship, or job
										offers.</div>
								</div>
							</div>
							<div class="d-grid gap-2 d-md-flex justify-content-md-end m-5">
								
								<button type="submit"
									class="btn btn-primary custom-btn-size shadow w-50 rounded-pill py-3">
									 <span class="fw-bold">COMPLETE PROFILE</span>
								</button>
						    	</div>
                                 <!-- Custom Alert -->
                                    <div id="customAlert" class="alert alert-danger" style="display: none;">
                                          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                           <span aria-hidden="true">&times;</span>
                                         </button>
                                     <strong>Error!</strong>
                                    </div>
                                
						
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

		<script>
    // Define the list of icons
    const iconList = [
        { class: 'devicon-react-original', name: 'React' },
        {class: 'devicon-angularjs-plain',name: 'Angularjs' },
        {class: 'devicon-vuejs-plain', name: 'Vuejs' },
        {class: 'devicon-bootstrap-plain', name: 'Bootstrap' },
        {class: 'devicon-nodejs-plain', name: 'Nodejs' },
        { class: 'devicon-sass-original', name: 'Sass' },
        {class: 'devicon-less-plain-wordmark', name: 'Less' },
        {class: 'devicon-laravel-plain', name: 'Laravel' },
        {class: 'devicon-django-plain', name: 'Django' },
        {class: 'devicon-flask-original', name: 'Flask' },
        {class: 'devicon-spring-plain', name: 'Spring' },
        {class: 'devicon-express-original', name: 'Express' },
        {class: 'devicon-tailwindcss-plain', name: 'TailwindCSS' },
        {class: 'devicon-d3js-plain', name: 'D3js' },
        {class: 'devicon-threejs-original', name: 'Threejs' },
        {class: 'devicon-materialui-plain', name: 'Materialui' },
        {class: 'devicon-jquery-plain', name: 'jQuery' },
        {class: 'devicon-socketio-original', name: 'Socket.io' },
        
        
    ];
    
     // Display icons in rows of four
        const iconContainer = document.getElementById('iconContainer');
        const iconSelectedContainer = document.getElementById('iconSelectedContainer');
        const selectedIconInput = document.getElementById('selectedIcon');
        const iconForm = document.getElementById('iconForm');
        
        const selectedIcons = [];

        const selectedIconsContainer = document.getElementById('iconSelectedContainer');
        const maxSelectedIcons = 5;
        const availableIcons = [...iconList];
        
        
      //fucntion to display an alert
        function showAlert(message) {
            const alertElement = document.getElementById('customAlert');
            const alertMessage = alertElement.querySelector('strong');
            alertMessage.innerText = message;
            alertElement.style.display = 'block';
            
            setTimeout(function() {
                alertElement.style.display = 'none';
            }, 8000);

        }
      
     // Define the completion status (in percentage)
        const completionStatus = 100; // Set this value dynamically based on your logic

        // Select the progress bar element
        const progressBar = document.querySelector('.progress-bar');

        // Set the width of the progress bar
        progressBar.style.width = completionStatus + '%';

        // Update the aria-valuenow attribute
        progressBar.setAttribute('aria-valuenow', completionStatus);

      
     	// Function to create an icon element
        function createIconElement(icon) {
            const iconItem = document.createElement('div');
            iconItem.className = 'iconItem';

            const iconElement = document.createElement('i');
            iconElement.classList.add(...icon['class'].split(' '));
            iconItem.appendChild(iconElement);

            const iconNameElement = document.createElement('div');
            iconNameElement.innerText = icon.name;
            iconNameElement.className = 'iconName';
            iconItem.appendChild(iconNameElement);

            return iconItem;
        }

        
        var developerFrameworks = '<c:out value="${developer.frameworks}" />';
   
		const selectedIconNames = developerFrameworks
		  .replace('[', '') // Remove leading square bracket
		  .replace(']', '') // Remove trailing square bracket
		  .split(',');      // Split the string into an array
		  
        // Function to find an icon by name
        function findIconByName(name) {
            return iconList.find(icon => icon.name === name);
        }

        function renderAvailableIcons(icons) {
            // Clear the current content of the available icons container
            iconContainer.innerHTML = '';

            // Render each available icon
            icons.forEach(icon => {
                const iconItem = document.createElement('div');
                iconItem.className = 'iconItem';

                const iconElement = document.createElement('i');
                iconElement.classList.add(...icon['class'].split(' '));
                iconItem.appendChild(iconElement);

                const iconNameElement = document.createElement('div');
                iconNameElement.innerText = icon.name;
                iconNameElement.className = 'iconName';
                iconItem.appendChild(iconNameElement);

                iconItem.addEventListener('click', () => {
                	
                	if (selectedIcons.length >= maxSelectedIcons) {
                        showAlert('You can select up to five icons.');
                        return;
                    }
                	
                    // Add your logic for selecting an available icon
                    if (selectedIcons.length < maxSelectedIcons) {
                        iconItem.classList.toggle('selected');

                        if (iconItem.classList.contains('selected')) {
                            selectedIcons.push(icon);

                            const index = availableIcons.indexOf(icon);
                            if (index !== -1) {
                                availableIcons.splice(index, 1);
                            }
                            //********
                            renderAvailableIcons(availableIcons);
                            const selectedIconCopy = iconItem.cloneNode(true);
                            selectedIconCopy.addEventListener('click', () => {
                                const selectedIndex = selectedIcons.indexOf(icon);
                                if (selectedIndex !== -1) {
                                    selectedIcons.splice(selectedIndex, 1);
                                    selectedIconCopy.remove();
                                    availableIcons.push(icon);
                                    renderAvailableIcons(availableIcons);
                                }
                            });
                            selectedIconsContainer.appendChild(selectedIconCopy);
                        } else {
                            const index = selectedIcons.indexOf(icon);
                            if (index !== -1) {
                                selectedIcons.splice(index, 1);
                            }

                            iconItem.remove();
                            availableIcons.push(icon);
                            renderAvailableIcons(availableIcons);
                        }
                    }
                });

                iconContainer.appendChild(iconItem);
            });
        }
        
     // Function to render selected icons
        function renderSelectedIcons() {
    	 	console.log("in render");
            // Clear the current content of the selected icons container
            selectedIconsContainer.innerHTML = '';

            // Render each selected icon
            selectedIcons.forEach(icon => {
                const iconItem = createIconElement(icon);
                iconItem.classList.add('selected');

                // Add click event to handle selected icon clicks
                iconItem.addEventListener('click', () => {
                    const selectedIndex = selectedIcons.indexOf(icon);
                    if (selectedIndex !== -1) {
                    	console.log("in splice");
                        selectedIcons.splice(selectedIndex, 1);
                        availableIcons.push(icon);
                        renderAvailableIcons(availableIcons);
                        renderSelectedIcons();
                    }
                });

                selectedIconsContainer.appendChild(iconItem);
            });
        }

        
        
     // Function to render initially selected icons
        function renderInitiallySelectedIcons() {
    	 	
            selectedIconNames.forEach(iconName => {
            	const trimmedIconName = iconName.trim();
                const icon = findIconByName(trimmedIconName);
                if (icon) {
                    // Use createIconElement function to ensure consistency
                    const iconItem = createIconElement(icon);
                    iconItem.classList.add('selected');
                    selectedIconsContainer.appendChild(iconItem);
                    
                 // Add the initially selected icons to the selectedIcons array
                    selectedIcons.push(icon);
                 
                 // Remove the selected icon from the availableIcons array
                    const index = availableIcons.findIndex(availableIcon => availableIcon.name === icon.name);
                    if (index !== -1) {
                        availableIcons.splice(index, 1);
                    }
                    
                    renderSelectedIcons();
                }
            });
            
         // Render the updated available icons
            renderAvailableIcons(availableIcons);
        }

        // Render initially selected icons
        renderInitiallySelectedIcons();

        
     // Add an event listener to the form submission
        iconForm.addEventListener('submit', function(event) {
            // Prevent the form from submitting normally
            event.preventDefault();

            // Check if the user has selected at least one icon
            if (selectedIcons.length === 0) {
            	showAlert('Please select at least one icon.');
                return;
            }

            // Check if the user has selected up to the maximum allowed icons
            if (selectedIcons.length > maxSelectedIcons) {
            	showAlert('You can select up to five icons.');
                return;
            }

         // Extract only the names of selected icons
            const selectedIconNames = selectedIcons.map(icon => icon.name);

            // Set the selected icon names as the value of the hidden input
            selectedIconInput.value = selectedIconNames.join(',');

            // Now you can submit the form
            iconForm.submit();
        });

        
    </script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>