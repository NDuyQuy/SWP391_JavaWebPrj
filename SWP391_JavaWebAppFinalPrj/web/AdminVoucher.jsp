<%-- 
    Document   : AdminVoucher
    Created on : Feb 27, 2024, 8:50:14 PM
    Author     : DELL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/AdminServlet?Action=ViewVoucher"/>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade Voucher Management</title>
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
                                    <h1>Voucher Management</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- breadcrumb-area-end -->

                <!-- login Area Strat-->
                <section class="login-area pt-100 pb-100">
                    <div class="container">
                    <jsp:useBean id="VL" scope="session" class="java.util.ArrayList" />
                    <div>
                        <table class="table table-bordered">
                            <thead>
                                <tr> 
                                    <th>Voucher Code</th> 
                                    <th>Create Date</th>
                                    <th>Exp. Date</th>
                                    <th>Discount Amount</th>
                                    <th>Voucher Type</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <c:forEach var="s" items="${sessionScope.VL}">
                                    <tr> 
                                        <td><c:out value="${s.code}"/></td>
                                        <td><c:out value="${s.start_date}"/></td>
                                        <td><c:out value="${s.expire_date}"/></td>
                                        <td><c:out value="${s.discount_amount}"/> <c:out value="${s.discount_unit}"/></td>
                                        <td><c:out value="${s.type}"/></td>
                                        <td>
                                            <!-- Edit link with data-id attribute -->
                                            <a class="edit-link" style="color: blue; cursor: pointer;" href="AdminEditVoucher.jsp?id=<c:out value="${s.voucher_id}"/>">Edit</a>
                                        </td>
                                        <td><a class="delete-link" style="color: red; cursor: pointer;" data-id="${s.getVoucher_id()}" onclick="openPopup('delete',${s.voucher_id})">Delete</a></td>
                                    </tr>
                                </c:forEach>

                            </tbody> 
                        </table>
                    </div>
                    <a href="AdminAddVoucher.jsp" class="btn btn-primary">
                        Add New Voucher
                    </a>
                    
                    
                    
                    <div class="modal" id="deletePopup">
                        <div class="modal-dialog  modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Delete Voucher?</h4>
                                    <button type="button" class="close" data-dismiss="modal" onclick="closePopup('delete')">&times;</button>
                                </div>

                                <!-- Modal Body -->
                                <div class="modal-body">
                                    <form action="AdminServlet?Action=DeleteVoucher" method="post">
                                        <input type="hidden" name="VoucherId" id="deleteVoucherId">
                                        <button type="submit" class="btn btn-primary">Delete</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closePopup('delete')">Cancel</button>
                                    </form>
                                </div>

                            </div>
                        </div>
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
        <script>
            function openPopup(type, voucherId) {
                
                if (type === 'delete') {
                    // Set the category ID in the delete popup
                    document.getElementById('deleteVoucherId').setAttribute('value', voucherId);
                }
                $('#' + type + 'Popup').modal('show');
            }

            function closePopup(type) {
                $('#' + type + 'Popup').modal('hide');
            }
        </script>
    </body>
</html>