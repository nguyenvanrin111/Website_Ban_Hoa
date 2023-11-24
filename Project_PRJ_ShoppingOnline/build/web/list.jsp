

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Rin Shop</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="components/navBarComponent.jsp" %>
        <!-- Header-->
        <header style="background-image: linear-gradient(0, #fe6132, #f6422e);" class="bg-dark py-5">
            <div  class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder header_title">Đồng Tâm Bakery</h1>
                    <p class="lead fw-normal text-white-50 mb-0">
                        Uy tín, Sạch sẽ, Chất Lượng
                    </p>
                </div>
            </div>
        </header>
        <h3>List Product</h3>
        <a href="admin-create-product" class="btn btn-primary mt-5 mb-5" style="text-decoration: none" >Create new</a>
        <table class="table" border="1">
            <thead style="border: 1px solid black">
                <tr>
                    <th>id</th>
                    <th>image</th>
                    <th>name</th>
                    <th>quantity</th>
                    <th>price</th>
                    <th>description</th>
                    <th>create date</th>
                    <th>action</th>
                </tr>
            </thead>
            <tbody style="border: 1px solid black">
                <c:forEach items="${listProducts}" var="P">
                    <tr style="border: 1px solid black">
                        <td>${P.id}</td>
                        <td>${P.imageURL}</td>
                        <td>${P.name}</td>
                        <td>${P.quantity}</td>
                        <td>${P.price}</td>
                        <td>${P.description}</td>
                        <td>${P.createdDate}</td>
                        <td><a class="btn btn-primary" href="admin-update-product?id=${P.id}">Update</a> | <a class="btn btn-danger" href="admin-delete-product?id=${P.id}">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <%@include file="components/footerComponent.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    </body>
</html>
