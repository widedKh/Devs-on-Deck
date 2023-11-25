<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/devicons/devicon@v2.15.1/devicon.min.css">

<meta charset="ISO-8859-1">
<title>${position.name}</title>
</head>
<style>
.developer-info {
	display: flex;
	justify-content: space-between;
}

.languages-frameworks {
	display: flex;
	flex-direction: row;
	overflow-y: auto;
}

.icon-container {
	align-items: center; 
	margin-right: 10px;
}

.bio {
	margin: 30px;
}

.name-bio h3 {

	padding: 3px;
	width: 150px;
}
</style>
<body style="background-color: #f8f9fa;">


	<jsp:include page="navbar.jsp" />
	<div class="container mt-3">
		<div class="d-flex justify-content-between align-items-center">
        <div class="text-center w-100 ml-5">
            <h1>${position.name}</h1>
        </div>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end m-5 me-1" >
            <a href="/orgs/${position.id}/edit">
            <button class="btn btn-outline-warning btn-lg "style="box-shadow: 4px 4px black">
                Edit</button></a>
            <a href="#" onclick="openDeleteModal(${position.id})" class="btn btn-outline-danger btn-lg"
            style="box-shadow: 4px 4px black">Delete</a>
        </div>
    </div>
</div>


	<div class="row justify-content-center">

		<!-- Available Devs -->
<div class="col-md-8 mt-3">
    <div class="card shadow" style="width: 100%; border: 2px solid #000;">
        <div class="card-body" style="height: 400px; overflow-y: auto;">
            <h2 class="card-title text-center text-warning-emphasis mt-3 pb-2">Available Devs</h2>

            <c:forEach var="match" items="${developerMatches}">
                <div class="card mb-3 mt-5">
                    <div class="card-body developer-info">
                        <div class="name-bio">
                         <a href="#" onclick="openMessageModal(${match.developer.id})">
                              <h3>${match.developer.firstName} ${match.developer.lastName}</h3>
                           </a>

                            <p class="bio">Bio: ${match.developer.bio}</p>
                        </div>
                        <div class="icon-info">
                            <div class="languages-frameworks">
                                <c:forEach var="language" items="${match.developer.languages}">
                                    <div class="icon-container">
                                        <i class="devicon-${language.toLowerCase()}-plain"></i>
                                        <div>${language}</div>
                                    </div>
                                </c:forEach>

                                <c:forEach var="framework" items="${match.developer.frameworks}">
                                    <div class="icon-container">
                                        <i class="devicon-${framework.toLowerCase()}-plain"></i>
                                        <div>${framework}</div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end">
                        <div style="background-color: ${match.matchingRatio >= 0.75 ? 'green' : (match.matchingRatio >= 0.5 ? 'yellow' : 'red')}; border: 2px solid black; text-align: center; padding: 10px; font-size: 18px;">
                            <p>${Math.round(match.matchingRatio * 100)}% Match</p>
                        </div>
                    </div>
                    
                   
                    <!-- Message Modal -->
                    <div class="modal fade" id="messageModal-${match.developer.id}" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="messageModalLabel">Send Message to ${match.developer.firstName} ${match.developer.lastName}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- Add a form for the message -->
                                     <form:form action="/messages/send" method="post">
        <input type="hidden" name="developerId" value="${match.developer.id}" />
        <div class="mb-3">
            <label for="messageContent" class="form-label">Message:</label>
            <textarea class="form-control" id="messageContent" name="content" rows="4" required></textarea>
        </div>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Send</button>
    </form:form>
</div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
		<script>
			 function openDeleteModal(positionId) {
			        var deleteButton = document.getElementById('deleteButton');
			        deleteButton.href = '/orgs/delete/' + positionId;
			        var modal = new bootstrap.Modal(document.getElementById('deleteConfirmationModal'));
			        modal.show();
			    }
			 
			  function openMessageModal(developerId) {
			        var modalId = 'messageModal-' + developerId;
			        var modal = new bootstrap.Modal(document.getElementById(modalId));
			        modal.show();
			    }

			  function sendMessage(developerId) {
				    var formId = 'messageForm-' + developerId;
				    var messageForm = document.getElementById(formId);

				    fetch('/message/send', {
				        method: 'POST',
				        body: new FormData(messageForm),
				    })
				    .then(response => {
				        console.log('Message sent successfully');
				        var modalId = 'messageModal-' + developerId;
				        var modalElement = document.getElementById(modalId);
				        var modal = bootstrap.Modal.getInstance(modalElement);
				        if (modal) {
				            modal.hide();
				        }
				    })
				    .catch(error => {
				        console.error('Error sending message:', error);
				    });
				}


			</script>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	</div>

</body>
</html>