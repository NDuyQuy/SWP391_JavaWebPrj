<%-- 
    Document   : header
    Created on : 02-Apr-2024, 00:32:48
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link href="//fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css" media="all">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i,900,900i&amp;subset=vietnamese" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <style>
            .dropdown-menu a.text-decoration-none {
                color: black;
            }
            .dropdown-menu a.text-decoration-none:hover {
                color: orange;
            }
        </style>
    </head>
    <body>
        <header class="row" style="padding: 10px;">
            <div class="container-fluid">
                <div class="row align-items-center justify-content-between pl-3">
                    <div class="col">
                        <div class="logo">
                            <a href=""><img src="${pageContext.request.contextPath}/img/logo/coco.png" style="height:60px;width:300px" alt=""></a>
                        </div>
                    </div>
                    <div class="col text-end" style="padding-left: 30px;">
                        <div class="dropdown d-inline-block">
                            <button class="btn btn-outline-danger dropdown-toggle" data-bs-toggle="dropdown">
                                <span id="username">${sessionScope.user.username}&nbsp;&nbsp;</span>
                                <i class="far fa-user"></i>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="text-decoration-none" href="${pageContext.request.contextPath}/profile.jsp">Tài khoản</a></li>
                                <li><a href="${pageContext.request.contextPath}/logout" style="color:#fe5245; text-decoration: none;">Đăng xuất</a></li>
                            </ul>
                        </div>

                        <div class="dropdown d-inline-block " style="margin-left: 30px; margin-right: 50px;">
                            <button class="btn btn-outline-danger dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                <span class=""></span>
                                <i class="fas fa-bars"></i> 
                            </button>
                            <ul class="dropdown-menu pl-0">
                                <li>
                                    <a class="text-decoration-none" href="${pageContext.request.contextPath}/ordercontroller"> 
                                        <i class="flaticon-list"></i> Xem tổng quan phân tích bán hàng
                                    </a>
                                </li>
                                <li>
                                    <a class="text-decoration-none" href="${pageContext.request.contextPath}/productcontroller">
                                        <i class="flaticon-list"></i> Quản lý sản phẩm của shop
                                    </a>
                                </li>
                                <li>
                                    <a class="text-decoration-none" href="${pageContext.request.contextPath}/sellersvouchercontroller">
                                        <i class="flaticon-list"></i> Quản lý voucher của shop
                                    </a>
                                </li>
                                <li>
                                    <a class="text-decoration-none " href="${pageContext.request.contextPath}/shopcategorycontroller">
                                        <i class="flaticon-list"></i> Quản lý danh mục của shop
                                    </a>
                                </li>
                                <li>
                                    <a class="text-decoration-none" href="${pageContext.request.contextPath}/CustomOrderController">
                                        <i class="flaticon-list"></i> Quản lý đơn hàng sản phẩm theo yêu cầu của shop
                                    </a>
                                </li>
                                <li>
                                    <a class="text-decoration-none" href="${pageContext.request.contextPath}/shopchat.jsp">
                                        <i class="flaticon-list"></i> Chat
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <a href="${pageContext.request.contextPath}/OrderDetail" class="btn btn-outline-danger" style="margin-right: 20px;">
                            <i class="far fa-bell"></i>
                            <span class="badge badge-pill badge-danger position-absolute top-0 end-0">${sessionScope.noti.size()}</span>
                        </a>
                    </div>
                </div>
            </div>
        </header>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
