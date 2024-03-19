<%-- 
    Document   : AdminApprove
    Created on : Feb 27, 2024, 8:50:57 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/AdminServlet?Action=ViewApproveRequest"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade Approve Request</title>
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
                                    <h1>Approve Requests</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- breadcrumb-area-end -->

                <!-- login Area Strat-->
                <section class="login-area pt-100 pb-100">
                    <div class="container">
                    <jsp:useBean id="SL" scope="session" class="java.util.ArrayList" />
                    <div>
                        <table class="table table-bordered">
                            <thead>
                                <tr> 
                                    <th>Username</th> 
                                    <th>Full name</th>
                                    <th>Shop name</th>
                                    <th>Create Date</th>
                                    <th>Request Date</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody> 
                                <c:forEach var="s" items="${sessionScope.SL}">
                                    <tr> 
                                        <td><c:out value="${s.user_id}"/></td>
                                        <td><c:out value="${s.user.username}"/></td>
                                        <td><c:out value="${s.shopname}"/></td>
                                        <td><c:out value="${s.description}"/></td>
                                        <td>
                                            <!-- Edit link with data-id attribute -->
                                            <a class="edit-link" style="color: blue; cursor: pointer;" data-id="${s.user_id}" href="AdminServlet?Action=AcceptSeller&ID=${s.user_id}">Accept</a>
                                        </td>
                                        <td><a class="delete-link" style="color: red; cursor: pointer;" data-id="${s.user_id}" href="AdminServlet?Action=DeclineSeller&ID=${s.user_id}">Decline</a></td>
                                    </tr>
                                </c:forEach>

                            </tbody> 
                        </table>
                    </div>
                    
                </div>

            </section>
            <!-- login Area End-->


        </main>

        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Bootstrap JS and jQuery -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- JavaScript to control the display of the popups -->
    </body>
</html>