<%-- 
    Document   : becomeseller
    Created on : Feb 23, 2024, 9:19:01 AM
    Author     : hien
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
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
    </head>
    <body>
        <!-- header start -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- header end -->
            <!-- breadcrumb-area-start -->
            <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="breadcrumb-text text-center">
                                <h1>Seller</h1>
                                <ul class="breadcrumb-menu">
                                    <li><a href="Home">Home</a></li>
                                    <li><span>Seller</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- breadcrumb-area-end -->
            <section class="login-area pt-100 pb-100">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="basic-login">
                                <h3 class="text-center mb-60 pb-15" style="border-bottom: 1px solid #e5e5e5;">Đăng ký trở thành Seller</h3>
                                <form method="post" action="becomeseller">
                                    <table width="550" height="300">
                                        <tr>
                                            <td><span style="color:red;">*</span>Tên shop</td>
                                            <td colspan="2"><input type="text" size="40" name="sname" placeholder="Tên của shop" value="" maxlength="30" required></td>
                                        </tr>
                                        <tr>
                                            <td><span style="color:red;">*</span>CCCD/CMND</td>
                                            <td colspan="2"><input type="number" size="40" name="cccd" placeholder="Số CCCD/CMND" value="" required></td>
                                        </tr>
                                        <tr>
                                            <td><span style="color:red;">*</span>Thông tin liên lạc</td>
                                            <td><input type="text" size="40" name="fullname" placeholder="Họ và tên" value="" required></td>
                                            <td><input type="tel" size="40" name="phone" placeholder="Số điện thoại" value="" required></td>
                                        </tr>
                                        <tr>
                                            <td><span style="color:red;">*</span>Địa chỉ của shop</td>
                                            <td colspan="2"><input type="text" size="40" name="saddr" placeholder="Địa chỉ lấy hàng" value="" required></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td colspan="2"><button class="btn theme-btn-2 w-100" style="font-family: 'Montserrat', sans-serif;">Gửi yêu cầu</button></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    
</html>
