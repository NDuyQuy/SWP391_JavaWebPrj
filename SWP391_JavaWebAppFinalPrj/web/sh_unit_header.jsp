<%-- 
    Document   : sh_unit_header
    Created on : Mar 19, 2024, 4:32:16 AM
    Author     : hien
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.html">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <link href="//fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css" media="all">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i,900,900i&amp;subset=vietnamese" rel="stylesheet">
        <!-- CSS here -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/fontawesome-all.min.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/meanmenu.css">
        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/default.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <style>
            .header-right ul li a:not(.logout):hover{
                background: #f6f6f6;
                color: #fe5245;
            }
            
            .header-right ul li .logout:hover{
                background: #fff;
            }
            
            .category-menu ul li a:hover{
                background: 0;
            }
            
            .review-tab{
                background: #fff;
                padding-left: 15%;
            }
            
            .review-tab .nav-item{
                margin-bottom: 0;
                margin-right: 0;
            }
            
            .review-tab .nav-link{
                border: 0;
            }
            
            .review-tab .nav-link.active{
                background: #fff;
                border: 0;
                border-bottom: 2px solid #fe4536;
                color: #000;
            }
        </style>
    </head>
    <body onload="change_frame()">
        <!-- preloader -->
        <div id="preloader">
            <div class="preloader">
                <span></span>
                <span></span>
            </div>
        </div>
        <!-- preloader end  -->

        <header>
            <div id="header-sticky" class="header-area box-90 pt-10 pb-10">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-xl-4 col-lg-6 col-md-6 col-7 col-sm-5 d-flex align-items-center pos-relative">
                            <div class="logo" style="margin-left: 0;">
                                <a href="ShippingUnit"><img src="img/logo/coco.png" style="height:60px;width:300px" alt=""></a>
                            </div>
                        </div>
                        <div class="col-xl-8 col-lg-6 col-md-6 col-5 col-sm-7 pl-0" style="padding-right: 50px;">
                            <div class="header-right f-right">
                                <ul>
                                    <li class="login-btn">
                                        <c:set var="username" value="${user.username}"/>
                                        <a href="#" id="userframe" style="border-radius: 30px; text-align: right; padding-right: 20px;background: #fff; border: 1px solid#fe5245;">
                                            <span id="username">${username}&nbsp;&nbsp;</span>
                                            <i class="far fa-user"></i>
                                        </a>

                                    </li>

                                    <li>
                                        <div style="margin-top: -30px;">
                                            <a class="logout" href="logout" style="color: #fe5245; text-decoration: underline;">Đăng xuất</a>
                                        </div>
                                    </li>
                                </ul>

                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <script>
            var span_width = document.getElementById('username').offsetWidth + 55 + 'px';
            function change_frame(){
                document.getElementById("userframe").style.width = span_width;
            }
            
        </script>
        
    </body>
</html>
