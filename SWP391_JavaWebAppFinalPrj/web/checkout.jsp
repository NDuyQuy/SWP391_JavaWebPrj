<%-- 
    Document   : cart
    Created on : Feb 26, 2024, 9:48:59 PM
    Author     : LENOVO
--%>
<%@page import="model.Voucher"%>
<%@ page import="java.util.List" %>
<%@ page import="model.CartItem" %>
<%@ page import="model.Product" %>


<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Product" %>
<%@ page import="model.Shop" %>
<%@ page import="model.ShopCategory" %>
<%@ page import="model.MainCategory" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade</title>
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
        <link rel="stylesheet" href="css/png.css"/>
        <style>
            .profile-area, .footer-area{
                background-color: #f6f6f6;
            }
            .bottom{
                display: flex;
                flex-direction: row;
                align-items: flex-start;
            }
            .profile-avatar{
                padding-left: 20px;
                overflow: hidden;
                border-left: 1px solid #eaedff;
                justify-content: center;
                display: flex;

            }

            .profile-avatar:nth-child{
                padding-top: 40px;
            }
            .avatar{
                flex-direction: column;
                align-items: center;
                display: flex;
            }
            .bottom{
                margin-top: 20px;
            }
            .cat dd{
                margin-left: 20px;
            }
            .avatar-img{
                width: 100%;
                height: 100%;
                background-position: 50%;
                background-size: cover;
                background-repeat: no-repeat;
                cursor: pointer;
            }
        </style>

    </head>
    <body>

        <jsp:include page="header.jsp"></jsp:include><!-- Trong trang checkout.jsp -->
            <!-- Form nhập thông tin người nhận -->
            <h2>Địa Chỉ Nhận Hàng</h2>
            <form action="/submitOrder" method="post">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Tên</th>
                            <th>Số điện thoại</th>
                            <th>Địa chỉ</th>
                            <th>Chỉnh sửa</th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td>${sessionScope.user.fullname}</td>
                        <td>${sessionScope.user.phone}</td>
                        <td>${sessionScope.user.address}</td>
                        <td>

                            <button type="button" class="btn btn-primary" id="editInfoBtn">
                                Chỉnh sửa thông tin nhận hàng
                            </button>

                            <!-- Add a modal for editing user information -->
                            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="editModalLabel">Chỉnh sửa thông tin nhận hàng</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <!-- Add a form for editing user information here -->
                                            <!-- Populate form fields with default user information -->
                                            <form id="editForm">
                                                <div class="form-group">
                                                    <label for="editFullname">Tên:</label>
                                                    <input type="text" class="form-control" id="editFullname" value="${sessionScope.user.fullname}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="editPhone">Số điện thoại:</label>
                                                    <input type="text" class="form-control" id="editPhone" value="${sessionScope.user.phone}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="editAddress">Địa chỉ:</label>
                                                    <input type="text" class="form-control" id="editAddress" value="${sessionScope.user.address}">
                                                </div>

                                                <button type="button" class="btn btn-primary" id="saveChangesBtn">Lưu thay đổi</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>



                        </td>
                    </tr>
                </tbody>
            </table>


            <%
                double grandTotalAmount = 0.0;
            %>
            <%! double totalShopAmount = 0.0; %>

            <!-- Hiển thị thông tin đơn hàng -->
            <h2>Sản phẩm</h2>
            <table class="table">

                <tbody>
                    <jsp:useBean id="cartGroup" class="java.util.HashMap" scope="request" />

                    <c:forEach var="entry" items="${cartGroup}">
                        <tr>
                            <!-- < <td>${entry.key}</td> -->
                            <td colspan="7" class="shop-name">${entry.key}</td>
                        </tr>

                        <!-- Initialize totalShopAmount for the current shop -->
                        <c:set var="totalShopAmount" value="0" />
                        <!-- Iterate over the ArrayList values for the current key -->
                        <c:forEach var="value" items="${entry.value}">
                            <tr>

                                <td class="product-thumbnail">
                                    <a href="#"><img src="${value.product.productImg}" alt=""></a>
                                </td>
                                <td class="product-name">
                                    <a href="#">${value.product.productName}</a>
                                </td>
                                <td class="product-price">
                                    <span class="amount">${value.product.price}</span>
                                </td>
                                <td class="product-quantity">
                                    <span class="quantityInput">${value.product.quantity}</span>
                                </td>
                                <td class="product-subtotal">
                                    <span class="amount">${value.product.price * value.quantity}</span>
                                </td>
                                <c:set var="totalShopAmount" value="${totalShopAmount + (value.product.price * value.quantity)}" />

                            </tr>


                            <c:set var="grandTotalAmount" value="${grandTotalAmount + (value.product.price * value.quantity)}" />


                        </c:forEach>



                        
                        <tr>

                            <td colspan="3"></td>
                            <td class="total-shop-amount">Tổng: </td>
                            <td>${totalShopAmount}</td>
                        </tr>

                    </c:forEach>
                </tbody>

            </table>

            <h2>Thông Tin Khác</h2>


            <label for="systemVoucher">Voucher của hệ thống:</label>
            <select id="systemVoucher" name="systemVoucher">
                <!-- Sử dụng cú pháp JSTL để lặp qua danh sách voucher của hệ thống -->
                <c:forEach var="voucher" items="${systemVouchers}">
                    <option value="${voucher.id}">${voucher.code} </option>
                </c:forEach>
            </select>

            <label for="paymentMethod">Phương thức thanh toán:</label>
            <select id="paymentMethod" name="paymentMethod">
                <option value="cash">Thanh toán khi nhận hàng</option>
                <option value="online">Thanh toán online</option>
            </select><br><br>

            <label for="grandTotal">Tổng tiền hàng: </label> <td>${grandTotalAmount}</td></br>

            <label for="shippingFee">Phí vận chuyển:</label>
            <input type="text" id="shippingFee" name="shippingFee" value="Free ship" readonly><br><br>

            <label for="totalAmount">Tổng thanh toán: </label>
                        <input type="text" id="grandTotal" name="grandTotal" value="${grandTotalAmount}" readonly><br><br>
            


            <input class="btn btn-dark rounded-pill py-2 btn-block" type="submit" value="Đặt hàng"/>
        </form>

        <!-- Footer -->
        <jsp:include page="footer.jsp"></jsp:include>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <!-- ... Your existing code ... -->

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

            <!-- Add this script at the end of the body or in the head section -->
            <script>
                $(document).ready(function () {
                    // Show the modal when the edit button is clicked
                    $("#editInfoBtn").click(function () {
                        // Populate modal fields with default user information
                        $("#editFullnameModal").val("${sessionScope.user.fullname}");
                        $("#editPhoneModal").val("${sessionScope.user.phone}");
                        $("#editAddressModal").val("${sessionScope.user.address}");

                        $("#editModal").modal("show");
                    });

                    // Handle save changes button click
                    $("#saveChangesBtn").click(function () {
                        // Update user information in the main form with values from the modal
                        $("#editFullname").val($("#editFullnameModal").val());
                        $("#editPhone").val($("#editPhoneModal").val());
                        $("#editAddress").val($("#editAddressModal").val());

                        // Hide the modal
                        $("#editModal").modal("hide");
                    });
                });

        </script>

        <!-- Cập nhật tổng số tiền khi người dùng chọn voucher -->
        <script>
            $(document).ready(function () {
                $("#shopVoucher, #systemVoucher").change(function () {
                    // Gọi hàm JavaScript để cập nhật tổng số tiền
                    updateTotalAmount();
                });
            });

            function updateTotalAmount() {
                // Lấy giá trị đã chọn từ các select box
                var shopVoucherId = $("#shopVoucher").val();
                var systemVoucherId = $("#systemVoucher").val();

                // Gửi request tới servlet hoặc JavaScript function để tính tổng số tiền mới
                // Sau đó cập nhật tổng số tiền hiển thị trên trang
            }
        </script>

    </body>
</html>




</body>
</html>
