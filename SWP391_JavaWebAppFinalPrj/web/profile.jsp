<%-- 
    Document   : profile
    Created on : Jan 17, 2024, 10:54:51 PM
    Author     : hien
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
                        <div class="col-xl-3 col-lg-3">
                            <div class="widget-title-box mb-30">
                                <div class="widget-posts-image">
                                    <img src="https://cdn.sforum.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg">
                                </div>
                                <div class="widget-posts-body">
                                    <h6 class="widget-posts-title">${user.fullname}</h6>
                                    <div class="widget-posts-meta"><a href="profile.jsp"><i class="fa fa-edit"></i> Edit profile</a></div>
                                </div>
                            </div>
                            <ul class="cat pt-20">
                                <li>
                                    <dl>
                                        <dt><a href="#">My account</a></dt>
                                        <dd style="margin-top:10px;"><a href="profile.jsp">Profile</a></dd>
                                        <dd><a href="changepassword.jsp">Change password</a></dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt><a href="#">My Orders</a></dt>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt><a href="#">My Vouchers</a></dt>
                                    </dl>
                                </li>
                            </ul>
                        </div>
                        <div class="col-xl-9 col-lg-9">
                            <div class="widget">
                                <div class="top" style="border-bottom: 1px solid #eaedff">
                                    <div class="widget-title" >
                                        My profile
                                    </div>
                                    <div style="margin-bottom: 15px;">
                                        Manage and protect your account
                                    </div>
                                </div>
                                <div class="bottom">
                                    <div class="profile-table" style="font-size: 15px;">
                                        <form action="profile" method="post">
                                            <table width="550" height="400">
                                                <tr>
                                                    <td>Username</td>
                                                    <td name="uname" value="${user.userName}">${user.userName}</td>
                                                </tr>
                                                <tr>
                                                    <td>Name</td>
                                                    <td><input type="text" size="40" name="fname" value="${user.fullname}"></td>
                                                </tr>
                                                <tr>
                                                    <td>Email</td>
                                                    <td> 
                                                        <p name="email">${user.email}<a href="#" style="text-decoration: underline;">Change</a></p></td>
                                                </tr>
                                                <tr>
                                                    <td>Phone number</td>
                                                    <td><input type="tel" size="40" name="phone" value="${user.phone}" pattern="[0-9]{10}" placeholder="xxxxxxxxxx"></td>
                                                </tr>
                                                <tr>
                                                    <td>Address</td>
                                                    <td><input type="text" size="40" name="addr" value="${user.address}"></td>
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
                                        </form>
                                    </div>
                                    <div class="profile-avatar">
                                        <div class="avatar">
                                            <span style="position: relative; justify-content: center; align-items: center; display: flex; margin: 1.25rem 0;">
                                                <img class="avatar-img" style="border-radius: 50%; width: 100px; height: 100px;" src="https://cdn.sforum.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg">
                                                <input type="file" accept=".jpg,.jpeg,.png" hidden="">
                                            </span>
                                            <button style="color: #000;
                                                    position: relative;
                                                    overflow: visible;
                                                    background: #fff;
                                                    height: 40px;
                                                    padding: 0 10px;
                                                    margin-bottom: 1.25rem;
                                                    min-width: 70px;
                                                    max-width: 220px;
                                                    border: 1px solid rgba(0,0,0,.8);" type="button">Select image</button>

                                            <div class="des" style="color: rgba(0,0,0,.8);">
                                                <div>
                                                    File size: maximum 1MB
                                                    <br>File extension: .JPG, .JPEG, .PNG
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
