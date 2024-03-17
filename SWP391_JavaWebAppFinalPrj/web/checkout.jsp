<%-- 
    Document   : cart
    Created on : Feb 26, 2024, 9:48:59 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/Checkout?Action=*"/>


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
        <jsp:useBean id="user" scope="session" class="model.Users" />

        <!-- header start -->
        <jsp:include page="header.jsp"></jsp:include>
            <h2>Thông Tin Nhận Hàng</h2>
            <form action="/submitOrder" method="post">
                <label for="receiverAddress">Tên người nhận:</label>
                <input type="text" id="receiverAddress" name="receiverAddress" required><br><br>
                <label for="receiverAddress">Số điện thoại:</label>
                <input type="text" id="receiverAddress" name="receiverAddress" required><br><br>
                <label for="receiverAddress">Địa chỉ nhận hàng:</label>
                <input type="text" id="receiverAddress" name="receiverAddress" required><br><br>
                <h2>Thông Tin Đơn Hàng</h2>
            <c:forEach items="${cart.items}" var="item">
                <!-- Hiển thị thông tin mỗi sản phẩm trong giỏ hàng -->                                                <tr>
                    <th scope="row">

                        <div class="ml-3 d-inline-block align-middle">
                            <h5 class="mb-0"> <a  class="text-dark d-inline-block">${item.product.name}</a></h5>
                        </div>

                    </th>
                    <td class="align-middle">
                        <form action="updatecart" method="post">
                            <input type="hidden" name="productId" value="${item.product.id}" />
                            <button name="action" value="decrease" type="submit" class="btn btn-link">-</button>
                            <input type="text" readonly value="${item.quantity}" name="quantity">
                            <button name="action" value="increase" type="submit" class="btn btn-link">+</button>
                            <td class="align-middle">
                                <button name="action" value="remove" type="submit" class="btn btn-link">Remove</button>

                            </td>
                        </form>
                    </td>
                    <td class="align-middle"><strong>${item.product.price}</strong></td>
                    <td class="align-middle"><strong>${item.product.price*item.quantity}</strong></td>


                </tr>
            </c:forEach>
            <div class="col-lg-6">
                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thành tiền</div>
                <div class="p-4">
                    <ul class="list-unstyled mb-4">
                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng tiền hàng</strong><strong>${cart.calculateTotalAmount()}</strong></li>
                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Phí vận chuyển</strong><strong>Free ship</strong></li>
                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">VAT</strong><strong>10 $</strong></li>
                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng thanh toán</strong>
                            <h5 class="font-weight-bold">${cart.calculateTotalAmount() + 10}</h5>
                        </li>

                        <form action="thanhtoan" method="post">
                            <input class="btn btn-dark rounded-pill py-2 btn-block" type="submit" value="Đặt hàng"/>
                        </form>
                </div>
            </div>
            <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
