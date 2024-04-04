<%-- 
    Document   : sellerMainpage
    Created on : Apr 4, 2024, 4:38:35 PM
    Author     : hien
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade Admin Mainpage</title>
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
        <jsp:include page="seller/header.jsp"></jsp:include>

        <main>
            <!-- breadcrumb-area-start -->
            <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="breadcrumb-text text-center">
                                <h1>Welcome back, Admin</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- breadcrumb-area-end -->

            <!-- login Area Strat-->
            <section class="login-area pt-100 pb-100">
                <div class="container">
                    <div class="list-group">
                        <a href="ordercontroller" class="list-group-item list-group-item-action">Xem tổng quan phân tích bán hàng</a>
                        <a href="productcontroller" class="list-group-item list-group-item-action">Quản lý sản phẩm của shop</a>
                        <a href="sellersvouchercontroller" class="list-group-item list-group-item-action">Quản lý voucher của shop</a>
                        <a href="shopcategorycontroller" class="list-group-item list-group-item-action">Quản lý danh mục của shop</a>
                        <a href="CustomOrderController" class="list-group-item list-group-item-action">Quản lý đơn hàng sản phẩm theo yêu cầu của shop</a>
                        <a href="shopchat.jsp" class="list-group-item list-group-item-action">Chat</a>
                    </div>
                </div>
            </section>
            <!-- login Area End-->


        </main>

        
        <script src="js/vendor/jquery-1.12.4.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.meanmenu.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>