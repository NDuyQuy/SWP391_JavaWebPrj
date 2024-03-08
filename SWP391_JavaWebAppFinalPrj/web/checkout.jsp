<%-- 
    Document   : cart
    Created on : Feb 26, 2024, 9:48:59 PM
    Author     : LENOVO
--%>
<%@ page import="java.util.List" %>
<%@ page import="model.CartItem" %>
<%@ page import="model.Product" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cart" scope="session" class="model.Cart" />
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

       <jsp:include page="header.jsp"></jsp:include>

        <!-- Form nhập thông tin người nhận -->
        <h2>Thông Tin Nhận Hàng</h2>
        <form action="/submitOrder" method="post">
            <label for="receiverName">Tên người nhận:</label>
            <input type="text" id="receiverName" name="receiverName" required><br><br>
            <label for="receiverPhone">Số điện thoại:</label>
            <input type="text" id="receiverPhone" name="receiverPhone" required><br><br>
            <label for="receiverAddress">Địa chỉ nhận hàng:</label>
            <input type="text" id="receiverAddress" name="receiverAddress" required><br><br>

            <!-- Hiển thị thông tin đơn hàng -->
            <h2>Thông Tin Đơn Hàng</h2>
            <table>
                <thead>
                    <tr>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Đơn giá</th>
                        <th>Thành tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cartGroup}" var="entry">
                        <tr>
                            <td colspan="4" class="shop-name">${entry.key}</td>
                        </tr>
                        <c:forEach items="${entry.value}" var="item">
                            <tr>
                                <td>${item.product.name}</td>
                                <td>${item.quantity}</td>
                                <td>${item.product.price}</td>
                                <td>${item.product.price * item.quantity}</td>
                            </tr>
                        </c:forEach>
                    </c:forEach>
                </tbody>
            </table>

            <h2>Thông Tin Khác</h2>
            <label for="shopVoucher">Voucher của shop:</label>
            <input type="text" id="shopVoucher" name="shopVoucher"><br><br>

            <label for="systemVoucher">Voucher của hệ thống:</label>
            <input type="text" id="systemVoucher" name="systemVoucher"><br><br>

            <label for="paymentMethod">Phương thức thanh toán:</label>
            <select id="paymentMethod" name="paymentMethod">
                <option value="cash">Thanh toán khi nhận hàng</option>
                <option value="online">Thanh toán online</option>
            </select><br><br>

            <label for="totalAmount">Tổng tiền hàng:</label>
            <input type="text" id="totalAmount" name="totalAmount" value="${cart.calculateTotalAmount()}" readonly><br><br>

            <label for="shippingFee">Phí vận chuyển:</label>
            <input type="text" id="shippingFee" name="shippingFee" value="Free ship" readonly><br><br>

            <label for="vat">VAT:</label>
            <input type="text" id="vat" name="vat" value="10 $" readonly><br><br>

            <label for="grandTotal">Tổng thanh toán:</label>
            <input type="text" id="grandTotal" name="grandTotal" value="${cart.calculateTotalAmount() + 10}" readonly><br><br>

            <input class="btn btn-dark rounded-pill py-2 btn-block" type="submit" value="Đặt hàng"/>
        </form>

        <!-- Footer -->
        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
