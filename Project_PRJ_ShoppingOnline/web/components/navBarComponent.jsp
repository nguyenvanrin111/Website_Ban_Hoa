<%-- 
    Document   : navBarComponent
    Created on : Feb 17, 2022, 9:00:46 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="/Project_PRJ_ShoppingOnline/home">Hoa Le Shop</a>
        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
            >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/Project_PRJ_ShoppingOnline/home">Home</a>
                </li>
                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                <li class="nav-item dropdown">
                    <a
                        class="nav-link dropdown-toggle"
                        id="navbarDropdown"
                        href="#"
                        role="button"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                        >Shop</a
                    >
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">All Products</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                        <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                    </ul>
                </li>
                <c:choose>
                    <c:when test="${sessionScope.account.role eq 'ADMIN'}">
                        <li class="nav-item"><a class="nav-link" href="admin.jsp">Manage</a></li>
                        </c:when>
                    </c:choose>

            </ul>
            <form action="search" class="d-flex mx-auto">
                <input
                    class="form-control me-2"
                    type="search"
                    placeholder="Search"
                    aria-label="Search"
                    name="keyword"
                    />
                <button class="btn btn-outline-success" type="submit">
                    Search
                </button>
            </form>
            <div class="d-flex my-2">
                <a class="btn btn-outline-dark" href="carts">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.carts.size()}</span>
                </a>
            </div>
            <c:choose>
                <c:when test="${sessionScope.account != null}">

                    <a style="text-decoration: none">
                        <button class="btn btn-outline-primary ms-lg-2">${sessionScope.account.displayName}</button>
                    </a>
                    <a href="logout" class="btn btn-outline-primary ms-lg-2">Logout</a>


                </c:when>
                <c:otherwise>
                    <a href="login" class="btn btn-outline-primary ms-lg-2">Login</a>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</nav>
