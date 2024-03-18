<%-- 
    Document   : profile
    Created on : Jan 17, 2024, 10:54:51 PM
    Author     : hien
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="model.Users" />
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

            .sidebar-fixed{
                position: fixed;
                top: 0;
                padding-top: 110px;
                z-index: 1;
                overflow: hidden;
            }

            .sidebar-bottom{
                position: absolute;
                bottom: 0;
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
                            <div id="fixed-sidebar" class="sidebar-fixed sidebar-bottom">
                                <div class="widget-title-box mb-30">
                                    <div class="widget-posts-image">
                                        <img src="https://cdn.sforum.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg">
                                    </div>
                                    <div class="widget-posts-body">
                                        <h6 class="widget-posts-title"><b>${user.username}</b></h6>
                                    <div class="widget-posts-meta"><a href="profile.jsp"><i class="fa fa-edit"></i> Sửa hồ sơ</a></div>
                                </div>
                            </div>
                            <ul class="cat pt-20">
                                <li>
                                    <dl>
                                        <dt><a href="#">Tài khoản của tôi</a></dt>
                                        <dd style="margin-top:10px;"><a href="profile.jsp">Hồ sơ</a></dd>
                                        <dd><a href="changepassword.jsp">Thay đổi mật khẩu</a></dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt><a href="#">Đơn mua</a></dt>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt><a href="#">Kho Voucher</a></dt>
                                    </dl>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9">
                        <div class="widget">
                            <div class="top" style="border-bottom: 1px solid #eaedff">
                                <div class="widget-title" >
                                    Hồ sơ của tôi
                                </div>
                                <div style="margin-bottom: 15px;">
                                    Quản lý và bảo mật tài khoản
                                </div>
                            </div>
                            <div class="bottom">
                                <div class="profile-table" style="font-size: 15px;">
                                    <form action="profile" method="post">
                                        <table width="550" height="400">
                                            <tr>
                                                <td>Tên đăng nhập</td>
                                                <td name="uname" value="${user.username}">${user.username}</td>
                                            </tr>
                                            <tr>
                                                <td>Họ tên</td>
                                                <td><input type="text" size="40" name="fname" value="${user.fullname}"></td>
                                            </tr>
                                            <c:if test="user.role == 2">
                                                <tr>
                                                    <td>CCCD/CMND</td>
                                                    <td> 
                                                        <c:set var="ic" value="${sessionScope.sellersDao.getShopById(user.id).cccd}"/>
                                                        <span name="cccd">${fn:substring(ic, 0, fn:length(ic) - 4).replaceAll("[\\W\\w]","*")}${ic.subSequence(fn:length(ic)-4,fn:length(ic))}</span></td>
                                                </tr>
                                            </c:if>
                                            <tr>
                                                <td>Email</td>
                                                <td> 
                                                    <c:set var="mail" value="${user.email}"/>
                                                    <c:set var="bf_mail" value="${fn:substringBefore(mail, '@')}"/>
                                                    <span name="email">${mail.subSequence(0,2)}${fn:substring(bf_mail, 2, fn:length(bf_mail)).replaceAll("[\\W\\w]","*")}@${fn:substringAfter(mail,'@')}</span></td>
                                            </tr>
                                            <tr>
                                                <td>Số điện thoại</td>
                                                <c:set var="phone" value="${user.phone}"/>
                                                <td><input type="tel" size="40" name="phone" value="${phone}" pattern="[0-9]{10}" placeholder="xxxxxxxxxx"></td>
                                            </tr>
                                            <tr>
                                                <td>Địa chỉ</td>
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
                                                            border: 0;">Lưu</button></td>
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
                                                border: 1px solid rgba(0,0,0,.8);" type="button">Chọn ảnh</button>

                                        <div class="des" style="color: rgba(0,0,0,.8);">
                                            <div>
                                                Dung lượng file tối đa 1MB
                                                <br>Định dạng: .JPG, .JPEG, .PNG
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <c:if test="${sessionScope.user.role == 2}">
                            <div class="widget mt-30">
                                <a id="shop-profile"></a>
                                <div class="top" style="border-bottom: 1px solid #eaedff">
                                    <div class="widget-title" >
                                        Xem Hồ sơ Shop
                                    </div>
                                    <div style="margin-bottom: 15px;">
                                        Cập nhật và quản lý hồ sơ Shop của bạn
                                    </div>
                                </div>
                                <div class="bottom">
                                    <div class="profile-table" style="font-size: 15px;">
                                        <form action="shopprofile" method="post">
                                            <table width="550" height="400">
                                                <tr>
                                                    <td>Tên Shop</td>
                                                    <td><input type="text" size="40" name="sname" value=""></td>
                                                </tr>
                                                <tr>
                                                    <td>Mô tả Shop</td>
                                                    <td><textarea id="script" name="sdescr" rows="20" cols="40" style="height:100px;"></textarea></td>
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
                                                                border: 0;">Lưu</button></td>
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
                                                    border: 1px solid rgba(0,0,0,.8);" type="button">Chọn ảnh</button>

                                            <div class="des" style="color: rgba(0,0,0,.8);">
                                                <div>
                                                    Dung lượng file tối đa 1MB
                                                    <br>Định dạng: .JPG, .JPEG, .PNG
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
