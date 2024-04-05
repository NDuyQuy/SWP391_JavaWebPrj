<%@page import="model.OrderDetail"%>
<%@page import="dao.OrdersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="model.CartDetail" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.UsersDao" %>
<%@ page import="model.Users" %>

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
        <style>

        </style>
    </head>
    <body>

        <jsp:include page="header.jsp"></jsp:include>
        <% int orderDetailId = (int) request.getAttribute("orderDetailId"); %>
        <% OrdersDao orderDetailDAO = new OrdersDao(); %>
        <% OrderDetail orderDetail = orderDetailDAO.getOrderDetailById(orderDetailId);%>
        <% String img = orderDetailDAO.getImgByOrderDetailId(orderDetailId);%>
        <h2>Thông tin sản phẩm trả hàng/hoàn tiền</h2>
        <div>
            <p><strong>ID sản phẩm:</strong> <%= orderDetail.getId()%></p>
            <div>
                <img width="100" src="<%= orderDetail.getProductDetail().getImg()%>" alt="Ảnh sản phẩm">
            </div>

            <p><strong>Tên sản phẩm:</strong> <%= orderDetail.getProductDetail().getProduct().getName()%></p>
            <p><strong>Số lượng:</strong> <%= orderDetail.getQuantity()%></p>
            <p><strong>Giá:</strong> <%= orderDetail.getTotalPrice()%></p>
            <p><strong>Lý do trả hàng/hoàn tiền: </strong> <%= orderDetail.getCancel_reason()%></p>
            <div>
                <img width="300" src="<%= img%>" alt="Ảnh sản phẩm">
            </div>

        </div>
        <form action="DetailReturn" method="post">
            <input type="hidden" name="orderDetailId" value="<%= orderDetail.getId()%>">
            <button type="submit">Hủy yêu cầu trả hàng/hoàn tiền</button>
        </form>

    </main>
    <jsp:include page="footer.jsp"></jsp:include>

</body>

<!-- Mirrored from wphix.com/template/vue/vue/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 21 Oct 2023 08:30:39 GMT -->
</html>