<%-- 
    Document   : profile
    Created on : Jan 17, 2024, 10:54:51 PM
    Author     : hien
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                <h1>Profile</h1>
                                <ul class="breadcrumb-menu">
                                    <li><a href="Home">Home</a></li>
                                    <li><span>Profile</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- breadcrumb-area-end -->
            <section class="profile-area pt-30 pb-45">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-4 col-lg-4">
                            <div class="mb-30">
                                <div class="widget-posts-image">
                                    <img src="https://cdn.sforum.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg">
                                </div>
                                <div class="widget-posts-body">
                                    <h6 class="widget-posts-title">abc</h6>
                                    <div class="widget-posts-meta"><a href="#"><i class="fa fa-edit"></i> Change avatar</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-8 col-lg-8">
                            <div class="widget">
                                <div style="border-bottom: 1px solid #eaedff">
                                    <div class="widget-title" >
                                        My profile
                                    </div>
                                    <div style="margin-bottom: 15px;">
                                        Manage and protect your account
                                    </div>
                                </div>
                                <div style="font-size: 15px;">
                                    <table>
                                        <tr>
                                            <td>Username</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Name</td>
                                            <td><input type="text" value=""></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td> <a href="#" style="text-decoration: underline;">Change</a></td>
                                        </tr>
                                        <tr>
                                            <td>Phone number</td>
                                            <td> <a href="#" style="text-decoration: underline;">Change</a></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><button style="color: #fff; 
                                                        position: relative;
                                                        overflow: visible;
                                                        outline: 0;
                                                        background: #ee4d2d;
                                                        height: 40px;
                                                        padding: 0 20px;
                                                        min-width: 70px;
                                                        max-width: 220px;
                                                        border: 0;">Save</button></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        <jsp:include page="footer.jsp"></jsp:include>
        
    </body>
</html>
