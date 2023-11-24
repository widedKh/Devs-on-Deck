<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Your Messages</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #6FA8DC;
            padding: 1rem;
            color: white;
            text-align: center;
        }

        h1 {
            margin-top: 1rem;
            text-align: center;
        }

        h2 {
            text-align: center;
            color: #6FA8DC;
        }

        .message-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            border-radius: 8px;
        }

        .message {
            border: 1px solid #ddd;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>

    <header>
        <h1>Welcome ${developer.firstName} ${developer.lastName}!</h1>
    </header>

    <div class="message-container">
        <h2>Your Messages</h2>
        <c:forEach var="message" items="${messages}">
            <div class="message">
                <p><strong>${message.sender.orgName}</strong> sent you a message at ${message.sentAt}:</p>
                <p>${message.content}</p>
            </div>
        </c:forEach>
    </div>

</body>
</html>
