<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Map" %>

<%
    String currentPage = request.getAttribute("javax.servlet.forward.request_uri").toString();
    Long orgId = (Long) session.getAttribute("org_id");
    Long devId = (Long) session.getAttribute("dev_id");
%>

<nav class="navbar navbar-expand-lg " style="background-color: #c87f58; border: 1px solid #000;">

    <h1 class="text-white">DevsOnDeck</h1>

    <div class="collapse navbar-collapse" id="navbarNav">
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
                <% } else if (orgId == null) { %>
                <li class="nav-item active">
                    <a class="nav-link text-white" href="/orgLogout">Logout</a>
                </li>
                
                 <%} else if  (devId == null) { %>
                <li class="nav-item active">
                    <a class="nav-link text-white" href="/devLogout">Logout</a>
                </li>
             <%} %>

            

        </ul>
    </div>
</nav>
