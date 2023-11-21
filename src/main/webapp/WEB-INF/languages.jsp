<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <meta charset="ISO-8859-1">
    <title>Welcome to DevsOnDeck</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/devicons/devicon@v2.15.1/devicon.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        #header {
            background-color: #6FA8DC;
            width: 125%;
            display: flex;
        }

        #header h1 {
            margin-left: 1rem;
        }

        #progress-bar {
            height: 1.6rem;
            width: 100%;
        }

        #iconContainer {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        #iconSelectedContainer {
            border: 1px solid #ccc;
            padding: 10px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .iconItem {
            flex: 0 0 calc(25% - 10px);
            max-width: calc(25% - 10px);
            text-align: center;
            cursor: pointer;
        }

        .selected {
               border: 2px solid #007bff;
    padding: 10px; /* Add padding to create some space around the selected icon */
    box-sizing: border-box; 
        }

        .custom-btn-size {
            height: 10%;
        }

        .card-container {
            width: 125%;
            height: 95%;
            max-height: 95%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-body {
            padding: 20px;
        }

        #bioTextarea {
            height: 100%;
            resize: none;
        }
    </style>
</head>
<body>

    <jsp:include page="navbar.jsp" />
    <div class="container mt-3">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div id="header">
                    <div class="col-md-6 p-2">
                        <h1>Add Your Skills</h1>
                    </div>
                    <div class="col-md-5 mt-4 p-2">
                        <div id="progress-bar" class="progress">
                            <div class="progress-bar bg-success" role="progressbar"
                                style="width: 25%;" aria-valuenow="25" aria-valuemin="0"
                                aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>

                <div class="card mx-auto card-container">
                    <div class="card-body ">
                        <form id="iconForm" action="/skills/languages/submit" method="post">

                            <input type="hidden" id="selectedIcon" name="selectedIcon">
                            <input type="hidden" name="bio">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <h2 class="mt-3 mb-5">Pick Your Top 5 Languages</h2>
                                    <div id="iconContainer" style="background-color: #e9ecef;">
                                        <!-- Icons will be dynamically added here -->
                                    </div>
                                </div>

                                <div class="col-md-5">
                                    <div class="mt-3 mb-2" id="iconSelectedContainer"></div>
                                    <h2 class="mt-3 mb-1">Short Bio</h2>
                                    <div>
                                        <textarea class="form-control mb-5" id="bioTextarea" name="bio" rows="12"><c:out value="${developer.bio}" /></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex mt-3 justify-content-around">
                                <a href="/skills/frameworks" class="btn btn-primary custom-btn-size shadow">Skip
                                    This Step</a>
                                <button type="submit" class="btn btn-success custom-btn-size shadow">NEXT
                                    STEP: Frameworks & Libraries</button>
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
            { iconClass: 'devicon-java-plain', language: 'Java' },
            { iconClass: 'devicon-python-plain', language: 'Python' },
            { iconClass: 'devicon-javascript-plain', language: 'JavaScript' },
            { iconClass: 'devicon-html5-plain', language: 'HTML5' },
            { iconClass: 'devicon-css3-plain', language: 'CSS3' },
            { iconClass: 'devicon-swift-plain', language: 'Swift' },
            { iconClass: 'devicon-ruby-plain', language: 'Ruby' },
            { iconClass: 'devicon-php-plain', language: 'PHP' },
            { iconClass: 'devicon-cplusplus-plain', language: 'Cplusplus' },
            { iconClass: 'devicon-csharp-plain', language: 'Csharp' },
            { iconClass: 'devicon-nodejs-plain', language: 'Nodejs' },
            { iconClass: 'devicon-go-plain', language: 'Go' },
            { iconClass: 'devicon-perl-plain', language: 'Perl' },
            { iconClass: 'devicon-kotlin-plain', language: 'Kotlin' },
            { iconClass: 'devicon-scala-plain', language: 'Scala' },
            { iconClass: 'devicon-dart-plain', language: 'Dart' },
            { iconClass: 'devicon-haskell-plain', language: 'Haskell' },
            { iconClass: 'devicon-rust-plain', language: 'Rust' },
            { iconClass: 'devicon-lua-plain', language: 'Lua' },
            { iconClass: 'devicon-typescript-plain', language: 'TypeScript' },
            { iconClass: 'devicon-erlang-plain', language: 'Erlang' },
            { iconClass: 'devicon-fortran-plain', language: 'Fortran' },
            // Add more icon-language pairs as needed
        ];


        // Display icons in rows of four
        const iconContainer = document.getElementById('iconContainer');
        const iconSelectedContainer = document.getElementById('iconSelectedContainer');
        const selectedIconInput = document.getElementById('selectedIcon');
        const iconForm = document.getElementById('iconForm');

        const selectedIcons = [];
        const maxSelectedIcons = 5;

        function updateSelectedIconsDisplay() {
            const selectedIconsHTML = selectedIcons.map(iconClass => {
                const iconData = iconList.find(icon => icon.iconClass === iconClass);
                return `<div class="iconItem selected" onclick="handleIconClick(this, '${iconData.iconClass}')">
                            <i class="${iconData.iconClass}"></i>
                            <div>${iconData.language}</div>
                        </div>`;
            }).join('');

            // Clear the existing content in iconSelectedContainer before updating
            iconSelectedContainer.innerHTML = '';

            // Append the new content to iconSelectedContainer
            iconSelectedContainer.innerHTML = selectedIconsHTML;
        }
        function handleIconClick(iconItem, language) {
            const index = selectedIcons.indexOf(language);
            const iconData = iconList.find(icon => icon.iconClass === language);
            const skillName = iconData ? iconData.language : ''; // Retrieve the skill name

            if (index === -1 && selectedIcons.length < maxSelectedIcons) {
                selectedIcons.push(skillName); // Store the skill name instead of the icon class
            } else if (index !== -1) {
                selectedIcons.splice(index, 1);
            } else {
                alert('You can select up to five languages.');
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

        // Display initial icons
        iconList.forEach(iconData => {
            const iconElement = document.createElement('i');
            iconElement.className = iconData.iconClass;

            const iconItem = document.createElement('div');
            iconItem.className = 'iconItem';
            iconItem.appendChild(iconElement);

            const languageName = document.createElement('div');
            languageName.textContent = iconData.language;
            iconItem.appendChild(languageName);

            iconItem.addEventListener('click', () => handleIconClick(iconItem, iconData.iconClass));

            iconContainer.appendChild(iconItem);
        });
    </script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
