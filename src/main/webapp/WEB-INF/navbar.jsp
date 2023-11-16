<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Map" %>


<% String currentPage = request.getRequestURI(); %>


<nav class="navbar navbar-expand-lg navbar-light bg-warning">
    <h1 class="navbar-brand">DevsOnDeck</h1>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
             <% if (currentPage.endsWith("/devs/register")) { %>
                <li class="nav-item active">
                    <a class="nav-link" href="/devLogin.jsp">Dev login</a>
                    <a class="nav-link" href="/orgLogin.jsp">Org login</a>
                </li>
           <% } else if (currentPage.endsWith("/devs/login")) { %>
                <li class="nav-item active">
                    <a class="nav-link" href="/devIndex.jsp">Dev Registration</a>
                    <a class="nav-link" href="/orgIndex.jsp">Org Registration</a>
                </li>
            <% } %>
        </ul>
    </div>
</nav>
