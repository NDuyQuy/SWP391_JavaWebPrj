<%-- 
    Document   : seller_header
    Created on : Feb 27, 2024, 3:34:08 PM
    Author     : hien
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- preloader -->
        <div id="preloader">
            <div class="preloader">
                <span></span>
                <span></span>
            </div>
        </div>
        <!-- preloader end  -->

        <header>
            <div id="header-sticky" class="header-area box-90">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-xl-5 col-lg-6 col-md-6 col-7 col-sm-5 d-flex align-items-center pos-relative">
                            <div class="logo">
                                <a href="Home"><img src="img/logo/coco.png" style="height:60px;width:300px;margin-left:20px" alt=""></a>
                            </div>
                        </div>
                        <div class="col-xl-7 col-lg-6 col-md-6 col-5 col-sm-7 pl-0">
                            <div class="header-right f-right">
                                <ul>
                                    <li class="login-btn">

                                        <a href="profile.jsp"><i class="far fa-user"></i></a>
                                        <ul class="submenu">
                                            <li  style="font-size: 16px;">Chào <b>${user.userName}</b>!</li>
                                            <li>
                                                <a href="profile.jsp">Hồ sơ Shop</a>
                                            </li>
                                            <li>
                                                <a href="logout">Đăng xuất</a>
                                            </li>
                                        </ul>

                                    </li>

                                    <li>
                                        <div class="basic-bar cat-toggle">
                                            <span class="bar1"></span>
                                            <span class="bar2"></span>
                                            <span class="bar3"></span>
                                        </div>
                                        <div class="category-menu">

                                            <ul style="margin-bottom: 0;">
                                                <li><a href="#"><i class="flaticon-list"></i> Sản phẩm</a></li>
                                                <li><a href="#"><i class="flaticon-list"></i> Danh mục của shop</a></li>
                                            </ul>

                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
