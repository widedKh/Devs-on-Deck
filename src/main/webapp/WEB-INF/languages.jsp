<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <meta charset="ISO-8859-1">
    <title>Welcome to DevsOnDeck</title>
     <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/devicons/devicon@v2.15.1/devicon.min.css">

</head>
<body style="background-color: #f8f9fa;">

<jsp:include page="navbar.jsp" />
<div class="container mt-3">

<a href="/messages/receiver/${developer.id}">View Messages</a>
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
                    <form id="iconForm" action="/skills/languages/submit"
                          method="post">

                        <input type="hidden" id="selectedIcon" name="selectedIcon">
                        <input type="hidden" name="bio">

                        <div class="row mb-3">

                            <div class="col-md-5">
                                <h3 class="mt-3 mb-5">Pick Your Top 5 Languages</h3>
                                <div id="iconContainer" style="background-color: #e9ecef;">
                                    <!-- Icons will be dynamically added here -->
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="mt-3 mb-2" id="iconSelectedContainer"></div>
                                <h2 class="mt-3 mb-1">Short Bio</h2>
                                <div>
                                    <textarea class="form-control mb-5" id="biographie" name="bio"
                                              rows="12"><c:out value="${developer.bio}" /></textarea>
                                </div>
                            </div>
                        </div>
                         <div class="d-flex mt-3 ">
                           <a href="/skills/frameworks" class="btn btn-primary custom-btn-size shadow rounded-pill py-3 px-4">
                              <span class="fw-bold">Skip This Step</span>
                             </a>
                            <button type="submit" class="btn btn-success custom-btn-size shadow rounded-pill py-3 px-4">
                                <span class="fw-bold">NEXT STEP: Frameworks & Libraries</span>
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
    // Define the list of icons and their corresponding language names
    const iconList = [
        { class: 'devicon-java-plain', name: 'Java' },
        {class: 'devicon-python-plain', name: 'Python' },
        {class: 'devicon-javascript-plain', name: 'JavaScript' },
        {class: 'devicon-html5-plain', name: 'HTML5' },
        {class: 'devicon-css3-plain', name: 'CSS3' },
        {class: 'devicon-swift-plain', name: 'Swift' },
        {class: 'devicon-ruby-plain', name: 'Ruby' },
        {class: 'devicon-php-plain', name: 'PHP' },
        {class: 'devicon-cplusplus-plain',name: 'Cplusplus' },
        {class: 'devicon-csharp-plain', name: 'Csharp' },
        {class: 'devicon-nodejs-plain', name: 'Nodejs' },
        {class: 'devicon-go-plain', name: 'Go' },
        {class: 'devicon-perl-plain', name: 'Perl' },
        {class: 'devicon-kotlin-plain', name: 'Kotlin' },
        {class: 'devicon-scala-plain', name: 'Scala' },
        {class: 'devicon-dart-plain', name: 'Dart' },
        {class: 'devicon-haskell-plain',name: 'Haskell' },
        {class: 'devicon-rust-plain', name: 'Rust' },
        {class: 'devicon-lua-plain', name: 'Lua' },
        {class: 'devicon-typescript-plain', name: 'TypeScript' },
        {class: 'devicon-erlang-plain', name: 'Erlang' },
        {class: 'devicon-fortran-plain', name: 'Fortran' },
        // Add more icon-language pairs as needed
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
    const completionStatus = 50; // Set this value dynamically based on your logic

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

      
    var developerLanguages = '<c:out value="${developer.languages}" />';

    const selectedIconNames = developerLanguages
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
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>