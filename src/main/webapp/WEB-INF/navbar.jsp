<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Map" %>

<% String currentPage = request.getAttribute("javax.servlet.forward.request_uri").toString(); %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<nav class="navbar navbar-expand-lg " style="background-color: #c87f58;">

    <% if (currentPage.equals("/orgs/dashboard") || currentPage.contains("/orgs/job/")) { %>
        <h1 class="text-white">${org.orgName}</h1>
        <h1 class="text-white ml-auto">DevsOnDeck</h1>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link text-white" href="/logout" style="font-weight: bold;">
                     Logout <i class="fa fa-sign-out ml-2" style="font-size:24px"></i>
                </a>
            </li>
        </ul>
    <% } else { %>
        <h1 class="text-white">DevsOnDeck</h1>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <% if (currentPage.equals("/devs/register") || currentPage.equals("/orgs/register")) { %>
                    <li class="nav-item active">
                        <a class="nav-link text-white" href="/devs/login">Dev login</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link text-white" href="/orgs/login">Org login</a>
                    </li>
                <% } else if (currentPage.endsWith("/devs/login") || currentPage.endsWith("/orgs/login")) { %>
                    <li class="nav-item active">
                        <a class="nav-link text-white" href="/devs/register">Dev Registration</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link text-white" href="/orgs/register">Org Registration</a>
                    </li>
                <% } else { %>
                    <li class="nav-item active ml-auto">
                        <a class="nav-link text-white" href="/logout" style="font-weight: bold;">
                            Logout  <i class="fa fa-sign-out ml-2" style="font-size:24px"></i>
                        </a>
                    </li>
                <% } %>
            </ul>
        </div>
    <% } %>
</nav>
