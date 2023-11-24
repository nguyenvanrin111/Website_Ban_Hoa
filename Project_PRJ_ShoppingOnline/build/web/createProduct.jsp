

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
        <form  action="admin-create-product" method="post">
            <table style="margin: auto" class="mt-5">

                    <tr>
                        <td>name</td>
                        <td><input type="text" name="name" value=""/></td>
                    </tr
                     <tr>
                        <td>quantity</td>
                        <td><input type="text" name="quantity" value=""/></td>
                    </tr
                     <tr>
                        <td>price</td>
                        <td><input type="text" name="price" value=""/></td>
                    </tr
                     <tr>
                        <td>description</td>
                        <td><input type="text" name="description" value=""/></td>
                    </tr
                    <tr>
                        <td>image URL</td>
                        <td><input type="text" name="imageURL" value=""/></td>
                    </tr>
                    <tr>
                        <td>create date</td>
                        <td><input type="text" name="createdate" value=""/></td>
                    </tr>
                    <tr>
                        <td>category</td>
                        <td>
                            <select name="categoryid">
                            <c:forEach items="${listCategory}" var="C">
                                <option value="${C.id}">${C.name}</option>
                            </c:forEach>

                        </select>
                        </td>
                    </tr
                     <tr>
                        <td></td>
                        <td><input type="submit"value="Save"/></td>
                    </tr
            </table>

        </form>
        <%@include file="components/footerComponent.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    </body>
</html>
