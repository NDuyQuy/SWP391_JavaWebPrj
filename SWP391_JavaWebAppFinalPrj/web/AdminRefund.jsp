<%-- 
    Document   : AdminRefund
    Created on : Feb 27, 2024, 8:51:28 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/AdminServlet?Action=ViewRefund"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade Refund/Return Request</title>
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
                                    <h1>Refund/Return Request</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- breadcrumb-area-end -->

                <!-- login Area Strat-->
                <section class="login-area pt-100 pb-100">
                    <div class="container">
                    <jsp:useBean id="RL" scope="session" class="java.util.ArrayList" />
                    <div>
                        <table class="table table-bordered">
                            <thead>
                                <tr> 
                                    <th>Request ID</th> 
                                    <th>Order ID</th>
                                    <th>Product Name</th>
                                    <th>Status</th>
                                    <th></th> 
                                </tr>
                            </thead>
                            <tbody> 
                                <c:forEach var="s" items="${sessionScope.RL}">
                                    <tr> 
                                        <td><c:out value="${s.id}"/></td>
                                        <td><c:out value="${s.orderdetail.orderID}"/></td>
                                        <td><c:out value="${s.orderdetail.product.name}"/></td>
                                        <td><c:out value="${s.status}"/></td>
                                        <td>
                                            <!-- Edit link with data-id attribute -->
                                            <a class="edit-link" style="color: blue; cursor: pointer;" data-id="${s.id}" onclick="openPopup('edit',${s.orderdetail.orderID},'${s.orderdetail.product.name}','${s.reason}',${s.id})">Choose Action</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody> 
                        </table>
                    </div>
                    
                    <!-- Edit Popup -->
                    <div class="modal" id="editPopup">
                        <div class="modal-dialog  modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Request Detail</h4>
                                    <button type="button" class="close" data-dismiss="modal" onclick="closePopup('edit')">&times;</button>
                                </div>

                                <!-- Modal Body -->
                                <div class="modal-body">
                                    <form action="AdminServlet?Action=EditRefund" method="post">
                                        <div class="form-group">
                                            <input type="hidden" name="requestId" id="requestId">
                                            <p>Order ID: </p><p id="orderId"></p><br>
                                            <p>On product: </p><p id="productName"></p><br>
                                            <p>Reason: </p><p id="reason"></p><br>
                                        </div>
                                        <button type="submit" name="status" class="btn btn-primary" value="Accept">Accept</button>
                                        <button type="submit" name="status" class="btn btn-outline-dark" value="Decline">Decline</button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                    
                    <!-- Delete confirm -->
                    
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
        <script>
            function openPopup(type, orderId, productName, reason, requestId) {
                if (type === 'edit') {
                    // Set the category ID in the edit popup
                    document.getElementById('orderId').innerHTML = orderId;
                    document.getElementById('productName').innerHTML = productName;
                    document.getElementById('reason').innerHTML = reason;
                    document.getElementById('requestId').setAttribute("value", requestId);
                }
                $('#' + type + 'Popup').modal('show');
            }

            function closePopup(type) {
                $('#' + type + 'Popup').modal('hide');
            }
        </script>
    </body>
</html>