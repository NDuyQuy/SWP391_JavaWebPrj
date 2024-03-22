<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.CartDetail" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.UsersDao" %>
<%@ page import="model.Users" %>

<%@ page import="model.Orders" %>
<%@ page import="model.OrderDetail" %>
<%@ page import="model.Products" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<html class="no-js" lang="zxx">


    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> My Shopping Cart</title>
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



    </head>
    <body>

        <jsp:include page="header.jsp"></jsp:include>
            <form id="confirmForm" method="post" style="display: none;">
                <input type="hidden" name="confirmOrderId" id="confirmOrderIdInput" />
                <input type="hidden" name="confirmNewStatus" value="đã nhận" />
            </form>

            <form id="cancelForm" method="post" style="display: none;">
                <input type="hidden" name="cancelOrderId" id="cancelOrderIdInput" />
                <input type="hidden" name="cancelNewStatus" value="đã hủy" />
            </form>


            <main>

                <section class="order-detail">
                    <div class="container">
                        <div class="row">

                            <div class="col-12">

                            <%
                                Orders order = (Orders) request.getAttribute("order");
                                if (order != null) {
                            %>

                            <script>
                                var currentOrderId;
                                function openCancelModal(orderId) {
                                    currentOrderId = orderId;
                                    $('#cancelModal').modal('show');

                                }
                                function comfirmCancel() {
                                    // Set the form action and orderId input value
                                    $('#cancelForm').attr('action', 'UpdateOrderStatusServlet');
                                    $('#cancelOrderIdInput').val(currentOrderId);

                                    // Submit the form
                                    $('#cancelForm').submit();

                                    // Close the modal
                                    $('#cancelModal').modal('hide');
                                }

                                function openConfirmModal(orderId) {
                                    currentOrderId = orderId;
                                    $('#confirmModal').modal('show');
                                }

                                function confirmReceived() {
                                    // Set the form action and orderId input value
                                    $('#confirmForm').attr('action', 'UpdateOrderStatusServlet');
                                    $('#confirmOrderIdInput').val(currentOrderId);

                                    // Submit the form
                                    $('#confirmForm').submit();

                                    // Close the modal
                                    $('#confirmModal').modal('hide');
                                }
                            </script>
                            <h2><strong>Mã đơn hàng:</strong> <%= order.getOrder_id()%></h2>
                            <h2><strong>Trạng thái đơn hàng:</strong> <%= order.getStatus()%></h2>
                            <h3>Địa chỉ nhận hàng</h3>
                            <div>


                                <p><strong>Receiver:</strong> <%= order.getReceiver_name()%> (<%= order.getReceiver_phone()%>)</p>
                                <p><strong>Address:</strong> <%= order.getReceiver_address()%></p>
                                <!-- Add more order information as needed -->

                                <h3>Order Items:</h3>
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>Product Img</th>
                                            <th>Product Name</th>

                                            <th>Quantity</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="orderDetail" items="${order.orderDetails}">

                                            <tr>
                                                <td>${orderDetail.product.getImg()}</td>
                                                <td>${orderDetail.product.getName()}</td>

                                                <td>${orderDetail.quantity}</td>
                                            </tr>

                                        </c:forEach>
                                    </tbody>

                                </table>

                                <p><strong>Ngày đặt hàng:</strong> <%= order.getOrder_date()%></p>
                                <p><strong>Phương thức vận chuyển:</strong> <%= order.getShipping_method()%></p>

                                <p><strong>Tổng thanh toán:</strong> <%= order.getTotal()%></p>
                            </div>
                            <%
                            } else {
                            %>
                            <p>No order information available.</p>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <c:if test="${order.status.trim() eq 'chờ xác nhận'}">
                                <button onclick="openCancelModal(${order.getOrder_id()})">Hủy đơn hàng</button>
                            </c:if>


                            <c:if test="${order.status.trim() eq 'đã giao hàng'}">
                                <button type="button" class="btn theme-btn" onclick="openConfirmModal(${order.getOrder_id()})">Đã nhận hàng</button>
                                <button type="button" class="btn theme-btn" > Yêu cầu trả hàng/hoàn tiền</button>
                            </c:if>


                            <c:if test="${order.status.trim() eq 'đã nhận'}">
                                <button type="button" class="btn theme-btn" onclick="redirectToReviewPage()">Đánh giá</button>
                            </c:if>
                        </div>
                    </div>

                </div>
            </section>


            <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmModalLabel">Xác nhận Đã nhận hàng</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc chắn muốn đánh dấu Đã nhận hàng cho đơn hàng này?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy bỏ</button>
                            <button type="button" class="btn btn-primary" onclick="confirmReceived()">Xác nhận</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="cancelModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="cancelModalLabel">Xác nhận Hủy đơn hàng</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc chắn muốn hủy đơn hàng này?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy bỏ</button>
                            <button type="button" class="btn btn-danger" onclick="comfirmCancel()">Hủy đơn hàng</button>
                        </div>
                    </div>
                </div>
            </div>

        </main>
        <jsp:include page="footer.jsp"></jsp:include>

        <!-- Fullscreen search -->
        <div class="search-wrap">
            <div class="search-inner">
                <i class="fas fa-times search-close" id="search-close"></i>
                <div class="search-cell">
                    <form method="get">
                        <div class="search-field-holder">
                            <input type="search" class="main-search-input" placeholder="Search Entire Store...">
                        </div>
                    </form>
                </div>
            </div>
        </div> <!-- end fullscreen search -->





        <!-- JS here -->
        <script src="js/vendor/jquery-1.12.4.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/isotope.pkgd.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/jquery.meanmenu.min.js"></script>
        <script src="js/ajax-form.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/jquery.final-countdown.min.js"></script>
        <script src="js/imagesloaded.pkgd.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

        <script>
                                // JavaScript function to redirect to the review page
                                function redirectToReviewPage() {
                                    // Replace 'ReviewPage.jsp' with the actual URL of your review page
                                    window.location.href = 'ReviewPage.jsp';
                                }
        </script>
    </body>

    <!-- Mirrored from wphix.com/template/vue/vue/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 21 Oct 2023 08:30:39 GMT -->
</html>