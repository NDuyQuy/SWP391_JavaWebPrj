<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.CartDetail" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.UsersDao" %>
<%@ page import="model.Users" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade </title>
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
        <script>
            function redirectToOrderDetail(orderId) {
                console.log('Redirecting to OrderDetailServlet with orderId:', orderId);
                window.location.href = 'OrderDetailServlet?orderId=' + orderId;
            }

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
                <!-- breadcrumb-area-start -->
                <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-text text-center">
                                    <h1>Đơn hàng của bạn</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- breadcrumb-area-end -->

                <!-- login Area Strat-->
                <section class="order-list">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Total</th>
                                            <th>Status</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="order" items="${orders}">
                                        <tr >
                                            <td onclick="redirectToOrderDetail(${order.getOrder_id()})" style="cursor: pointer;">${order.getOrder_id()}</td>
                                            <td onclick="redirectToOrderDetail(${order.getOrder_id()})" style="cursor: pointer;">${order.getTotal()}</td>
                                            <td onclick="redirectToOrderDetail(${order.getOrder_id()})" style="cursor: pointer;">${order.getStatus()}</td>
                                            <td>

                                                <button>Liên hệ với người bán</button>
                                            </td>
                                            <td>
                                                <c:if test="${order.status.trim() eq 'chờ xác nhận'}">
                                                    <button onclick="openCancelModal(${order.getOrder_id()})">Hủy đơn hàng</button>
                                                </c:if>

                                                <!-- Nút "Đã nhận hàng" - hiển thị nếu trạng thái là "da giao hang" -->
                                                <c:if test="${order.status.trim() eq 'đã giao hàng'}">
                                                    <button onclick="openConfirmModal(${order.getOrder_id()})">Đã nhận hàng</button>
                                                </c:if>

                                                <!-- Nút Đánh giá" - hiển thị nếu trạng thái là "da nhan hang" -->
                                                <c:if test="${order.status.trim() eq 'đã nhận'}">
                                                    <button>Đánh giá</button>
                                                </c:if>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
            <!-- login Area End-->

            <!-- Bootstrap JS and jQuery -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


            <!-- Modal -->
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
        <!-- Bootstrap JS and jQuery -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


    </body>
</html>