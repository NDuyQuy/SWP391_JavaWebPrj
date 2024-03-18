<%-- 
    Document   : shop
    Created on : Feb 28, 2024, 7:12:33 AM
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
        <style>
            .shop-details-area, .footer-area{
                background-color: #f6f6f6;
            }
        </style>
    </head>
    <body>
        <!-- header start -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- header end -->
            <main>
                <!-- breadcrumb-area-start -->
                <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-text text-center">
                                    <h1>Shop</h1>
                                    <ul class="breadcrumb-menu">
                                        <li><a href="Home">home</a></li>
                                        <li><span>Shop</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- breadcrumb-area-end -->

                <section class="shop-details-area pt-100 pb-100">
                    <div class="container">
                    <c:if test="${shop_search == null}">
                        <div>
                            <h3>Không có kết quả tìm kiếm nào.</h3>
                        </div>
                    </c:if>
                    <c:if test="${shop_search != null}">
                        <c:forEach var="shop" items="${sessionScope.shop_search}" begin="${first}" end="${last}">
                            <div class="row mt-30" >
                                <div class="col-lg-8 offset-lg-2" style="background-color: #fff; display: flex; border: 2px solid #efefef;">
                                    <ul class="recent-posts" style="width: 60%" onclick="location.href='ShopDetail?id=${shop.shop_id}'">
                                        <li>
                                            <div class="widget-posts-image" style="padding: 20px 20px;">
                                                <a href="ShopDetail?id=${shop.shop_id}">
                                                    <img src='${shop.shop_img}' alt='' style="width: 80px; height: 80px;">
                                                </a>
                                            </div>
                                            <div class="widget-posts-body" style="">
                                                <a href="ShopDetail?id=${shop.shop_id}"><h5 class="widget-posts-title" style="margin-top: 25px; font-size: 20px;">${shop.shop_name}</h5></a>
                                                <h6 style="margin-top: 20px;">Địa chỉ:<span style="color: #fe4536;"> ${sessionScope.usersDao.getUserById(shop.shop_id).address}</span></h6>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="f-mid" style="width: 20%; margin: auto 0; padding-top: 14px">
                                        <p style="color: #fe4536; text-align: center; line-height: 20px">
                                            <i class="fas fa-hand-peace"></i> ${sessionScope.productDao.getProductsByShop(shop.shop_id).size()}
                                        </p>
                                        <p style="text-align: center; line-height: 18px">
                                            sản phẩm
                                        </p>
                                    </div>
                                    <div class="f-right" style="width: 20%; margin: auto 0; padding-left: 4%;">
                                        <button onclick="location.href = 'Chat'" 
                                                style="color: black;
                                                position: relative;
                                                overflow: visible;
                                                outline: 0;
                                                background: #fff;
                                                height: 35px;
                                                width: 100px;
                                                border: 2px solid #ecedff;
                                                margin-bottom: 5px;">Chat</button>
                                        <button onclick="location.href = 'ShopDetail?id=${shop.shop_id}'" 
                                                style="color: black;
                                                position: relative;
                                                overflow: visible;
                                                outline: 0;
                                                background: #fff;
                                                height: 35px;
                                                width: 100px;
                                                border: 2px solid #ecedff;">View Shop</button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="basic-pagination basic-pagination-2 text-center mt-20">
                            <ul>
                                <c:if test="${param.page != null}">
                                    <c:set var="page" value="${param.page}"/>
                                </c:if>
                                <c:if test="${param.page == null}">
                                    <c:set var="page" value="${1}"/>
                                </c:if>
                                <c:if test="${page > 1}">
                                    <li><a href="SearchShop?${param.kw}&page=${1}"><i class="fas fa-angle-double-left"></i></a></li>
                                        </c:if>
                                        <c:if test="${page > 1}">
                                    <li><a href="SearchShop?${param.kw}&page=${page - 1}"><i class="fas fa-angle-left"></i></a></li>
                                        </c:if>
                                <li class="active"><a href="SearchShop?${param.kw}&page=${page}">${page}</a></li>
                                    <c:if test="${page < num}">
                                    <li><a href="SearchShop?${param.kw}&page=${page + 1}"><i class="fas fa-angle-right"></i></a></li>
                                        </c:if>
                                        <c:if test="${page < num}">
                                    <li><a href="SearchShop?${param.kw}&page=${num}"><i class="fas fa-angle-double-right"></i></a></li>
                                        </c:if>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </section>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
