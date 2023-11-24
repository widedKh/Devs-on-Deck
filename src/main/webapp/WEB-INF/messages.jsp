<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>

</head>
<body>

   
    <h1>Welcome ${developer.firstName} ${developer.lastName}!</h1>

  
    <h2>Your Messages</h2>
    <c:forEach var="message" items="${messages}">
        <div>
            <p>${message.sender.orgName} sent you a message at ${message.sentAt} : ${message.content}</p>
        </div>
    </c:forEach>

</body>
</html>
