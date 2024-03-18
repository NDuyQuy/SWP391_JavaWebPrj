<%-- 
    Document   : cart
    Created on : Feb 26, 2024, 9:48:59 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="model.User" />
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

        <!-- header start -->
        <jsp:include page="header.jsp"></jsp:include>
            <div class="order">
                <img src="path/to/product_image.jpg" alt="Product Image" width="100">
                <h3>Tên Shop: Shop ABC</h3>
                <p>Tên Sản Phẩm: Sản Phẩm 1</p>
                <p>Tổng Tiền: 120,000 VND</p>
                <button onclick="viewOrderDetails(1)">Xem Chi Tiết</button>
                <button onclick="contactSeller(1)">Liên Hệ Người Bán</button>
                <button onclick="cancelOrder(1)">Hủy Đơn Hàng</button>
            </div>

            <!-- Thêm các đơn hàng khác nếu cần -->

        <script>
            function viewOrderDetails(orderId) {
                window.location.href = '/orderDetails.html?orderId=' + orderId;
            }

            function contactSeller(orderId) {
                // Xử lý liên hệ người bán
                console.log('Liên hệ người bán cho đơn hàng ' + orderId);
            }

            function cancelOrder(orderId) {
                // Xử lý hủy đơn hàng
                console.log('Hủy đơn hàng ' + orderId);
            }
        </script>



    </body>
</html>
