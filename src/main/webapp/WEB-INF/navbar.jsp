<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Map" %>

<% String currentPage = request.getAttribute("javax.servlet.forward.request_uri").toString(); %>

<nav class="navbar navbar-expand-lg " style="background-color: #c87f58;">

    <h1 class="text-white">DevsOnDeck</h1>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
        	
            <% if (currentPage.equals("/devs/register") || currentPage.equals("/orgs/register")) { %>
                <li class="nav-item active">
                    <a class="nav-link text-white" href="/devs/login">Dev login</a>    
                </li>
                <li class="nav-item active">
                    <a class="nav-link text-white" href="/orgs/login">Org login</a>
                </li>
           <% }  else if (currentPage.endsWith("/devs/login") || currentPage.endsWith("/orgs/login")) { %>
           		<li class="nav-item active">
           			<a class="nav-link text-white" href="/devs/register">Dev Registration</a>
       			</li>
       			<li class="nav-item active">
           			<a class="nav-link text-white" href="/orgs/register">Org Registration</a>
       			</li>
   			<% } else { %>
   				<li class="nav-item active">
           			<a class="nav-link text-white" href="/logout">Logout</a>
       			</li>    
   			 <% }  %>
                
        </ul>
    </div>
</nav>