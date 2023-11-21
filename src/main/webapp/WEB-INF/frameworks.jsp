<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
        crossorigin="anonymous">
    <meta charset="ISO-8859-1">
    <title>Welcome to DevsOnDeck</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/devicons/devicon@v2.15.1/devicon.min.css">
    <style>
        #iconContainer {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
         
          .iconItem.selected {
            border: 2px solid #007bff; 
        }
        #iconSelectedContainer {
            border: 1px solid #ccc;
            height: 10%;
            padding: 10px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        

        #iconSelectedContainer .iconItem {
            flex: 0 0 calc(20% - 10px);
    
            max-width: calc(20% - 10px):
            text-align: center;
            cursor: pointer;
            text-align: center
        }

        .iconItem {
            flex: 0 0 calc(25% - 10px);
            max-width: calc(25% - 10px);
            text-align: center;
            cursor: pointer;
        }

        .selected {
            border: 2px solid #007bff;
            /* Highlight selected icon with a blue border */
        }

        .custom-btn-size {
            height: 10%; /* Set your desired height */
        }

        /* Custom alert styles */
        #customAlert {
            position: fixed;
            top: 10px;
            right: 10px;
            background-color: #28a745; /* Green background color */
            color: #fff; /* White text color */
            padding: 15px;
            border-radius: 5px;
            display: none; /* Initially hide the alert */
            z-index: 1000; /* Set a higher z-index to ensure it appears above other elements */
        }
    </style>

</head>
<body style="background-color: #f8f9fa;">

    <jsp:include page="navbar.jsp" />
    <div class="container mt-3">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="d-flex" style="background-color: #6FA8DC; width: 125%;">
                    <div class="col-md-6 p-2">
                        <h1 class="ml-1">Add Your Skills</h1>
                    </div>
                    <div class="col-md-5 mt-4 p-2">
                        <div class="progress" style="height: 1, 6rem; width: 100%;">
                            <div class="progress-bar bg-success" role="progressbar"
                                style="width: 25%;" aria-valuenow="25" aria-valuemin="0"
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
                                    <h2 class="mt-3 mb-5">Pick Your Top 5 Frameworks or
                                        Libraries</h2>
                                    <div id="iconContainer" style="background-color: #e9ecef;">
                                        <!-- Icons will be dynamically added here -->
                                    </div>
                                </div>

                                <div class="col-md-5">
                                    <div class="mt-3 mb-2" id="iconSelectedContainer"></div>

                                    <div>Completing your developer profile is crucial for
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
                            <div class="d-flex mt-3 justify-content-end">

                                <button type="submit"
                                    class="btn btn-primary custom-btn-size shadow">COMPLETE PROFILE</button>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Custom alert container -->
    <div id="customAlert" class="custom-alert"></div>

   <script>
    // Define the list of icons
    const iconList = [
        { iconClass: 'devicon-react-original', framework: 'React' },
        { iconClass: 'devicon-angularjs-plain', framework: 'Angularjs' },
        { iconClass: 'devicon-vuejs-plain', framework: 'Vuejs' },
        { iconClass: 'devicon-bootstrap-plain', framework: 'Bootstrap' },
        { iconClass: 'devicon-nodejs-plain', framework: 'Nodejs' },
        { iconClass: 'devicon-sass-original', framework: 'Sass' },
        { iconClass: 'devicon-less-plain-wordmark', framework: 'Less' },
        { iconClass: 'devicon-laravel-plain', framework: 'Laravel' },
        { iconClass: 'devicon-django-plain', framework: 'Django' },
        { iconClass: 'devicon-flask-original', framework: 'Flask' },
        { iconClass: 'devicon-spring-plain', framework: 'Spring' },
        { iconClass: 'devicon-express-original', framework: 'Express' },
        { iconClass: 'devicon-tailwindcss-plain', framework: 'TailwindCSS' },
        { iconClass: 'devicon-d3js-plain', framework: 'D3js' },
        { iconClass: 'devicon-threejs-plain', framework: 'Threejs' },
    ];

    // Display icons in rows of four
    const iconContainer = document.getElementById('iconContainer');
    const iconSelectedContainer = document.getElementById('iconSelectedContainer');
    const selectedIconInput = document.getElementById('selectedIcon');
    const iconForm = document.getElementById('iconForm');

    const selectedIcons = [];
    const maxSelectedIcons = 5;

    function updateSelectedIconsDisplay() {
        // Clear the existing content in iconSelectedContainer before updating
        iconSelectedContainer.innerHTML = '';

        selectedIcons.forEach(iconClass => {
            const iconData = iconList.find(icon => icon.iconClass === iconClass);
            const iconDiv = document.createElement('div');
            iconDiv.className = 'iconItem selected';
            iconDiv.innerHTML = `
                <i class="${iconData.iconClass}"></i>
                <div>${iconData.framework}</div>
            `;
            iconDiv.onclick = () => handleIconClick(iconDiv, iconClass);
            iconSelectedContainer.appendChild(iconDiv);
        });
    }


    function handleIconClick(iconItem, framework) {
        const index = selectedIcons.indexOf(framework);
        const iconData = iconList.find(icon => icon.iconClass === framework);
        const skillName = iconData ? iconData.framework : ''; 

        if (index === -1 && selectedIcons.length < maxSelectedIcons) {
            selectedIcons.push(skillName); 
        } else if (index !== -1) {
            selectedIcons.splice(index, 1);
        } else {
            alert('You can select up to five frameworks.');
            return;
        }

        updateSelectedIconsDisplay();
    }




    // Add an event listener to the form submission
    iconForm.addEventListener('submit', function (event) {
        // Prevent the form from submitting normally
        event.preventDefault();

        // Check if the user has selected at least one icon
        if (selectedIcons.length === 0) {
            alert('Please select at least one icon.');
            return;
        }

        // Check if the user has selected up to the maximum allowed icons
        if (selectedIcons.length > maxSelectedIcons) {
            alert('You can select up to five icons.');
            return;
        }

        // Set the selected icons as the value of the hidden input
        selectedIconInput.value = selectedIcons.join(',');

        // Now you can submit the form
        iconForm.submit();
    });

    iconList.forEach(iconData => {
        const iconElement = document.createElement('i');
        iconElement.className = iconData.iconClass;

        const iconItem = document.createElement('div');
        iconItem.className = 'iconItem';
        iconItem.appendChild(iconElement);

        const frameworkName = document.createElement('div');
        frameworkName.textContent = iconData.framework;
        iconItem.appendChild(frameworkName);

        iconItem.addEventListener('click', () => handleIconClick(iconItem, iconData.iconClass));
    
        iconContainer.appendChild(iconItem);
    });
</script>
  
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>
