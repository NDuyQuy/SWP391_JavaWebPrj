<%-- 
    Document   : AdminCategory
    Created on : Feb 27, 2024, 8:49:17 PM
    Author     : DELL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/AdminServlet?Action=ViewCategory"/>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade Category Management</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.html">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/fontawesome-all.min.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/meanmenu.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/meanmenu.css">
        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/default.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <link rel="stylesheet" href="css/png.css">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        
        <main>
                <!-- breadcrumb-area-start -->
                <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-text text-center">
                                    <h1>Category Management</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- breadcrumb-area-end -->

                <!-- login Area Strat-->
                <section class="login-area pt-100 pb-100">
                    <div class="container">
                        <jsp:useBean id="CL" scope="session" class="java.util.ArrayList" />
                        <div>
                            <table class="table table-bordered">
                                <thead>
                                    <tr> 
                                        <th>Category ID</th> 
                                        <th>Category Name</th> 
                                    </tr>
                                </thead>
                                <tbody> 
                                    <c:forEach var="s" items="${sessionScope.CL}">
                                        <tr> 
                                            <td><c:out value="${s.getId()}"/></td>
                                            <td><c:out value="${s.getName()}"/></td>
                                        </tr>
                                    </c:forEach>
                                </tbody> 
                            </table>
                        </div>
                        <div>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#AddNew">
                                Add New Category
                            </button>
                            <div class="modal" id="AddNew">
                                <div class="modal-dialog modal-dialog-centered">
                                  <div class="modal-content">

                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                      <h4 class="modal-title">New Category</h4>
                                      <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>

                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <form action="AdminServlet?Action=AddCategory" method="POST">
                                            <div class="mb-3 mt-3">
                                              <label for="name" class="form-label">Category Name:</label>
                                              <input type="text" class="form-control" id="name" placeholder="Enter Category Name" name="name">
                                            </div>
                                            <button type="submit" class="btn btn-primary">Add</button>
                                        </form>
                                    </div>
                                    
                                    <div class="modal-footer">
                                        
                                    </div>
                                  </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </section>
                <!-- login Area End-->


            </main>

        <jsp:include page="footer.jsp"></jsp:include>
        
    </body>
</html>
