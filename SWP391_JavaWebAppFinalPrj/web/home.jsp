<%-- 
    Document   : home
    Created on : Jan 17, 2024, 5:30:41 PM
    Author     : hien
--%>
<%@ page import="dao.ProductDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

    <!-- Mirrored from wphix.com/template/vue/vue/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 21 Oct 2023 08:30:16 GMT -->
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
        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/default.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <style>
            .product-img{
                height: 330px;
            }
        </style>
    </head>
    <body>
        <!-- header start -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- header end -->

            <main>
                <!-- slider-area start -->
                <section class="slider-area pos-relative">
                    <div class="slider-active">
                        <div class="single-slider slide-1-style slide-height d-flex align-items-center" data-background="img/slider/slide1.jpg">
                            <div class="shape-title bounce-animate">
                                <h2>UX</h2>
                            </div>
                            <div class="shape-icon bounce-animate">
                                <img src="img/slider/shape-icon.png" alt="">
                            </div>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-xl-7">
                                        <div class="slide-content">
                                            <!--start-->
                                            <span data-animation="fadeInRight" data-delay=".2s">${ProductDao.getProductById(13).shopCategory.maincategory.name} Collection</span>
                                        <h1 data-animation="fadeInUp" data-delay=".5s">${ProductDao.getProductById(13).name}</h1>
                                        <!--end-->
                                        <div class="slide-btn">
                                            <a class="btn theme-btn" href="SearchProduct" data-animation="fadeInLeft" data-delay=".7s">shop now</a>
                                            <a class="btn white-btn" href="SearchShop" data-animation="fadeInRight" data-delay=".9s">Find Artisan</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-5">
                                    <div class="slide-shape1" data-animation="bounceInRight" data-delay=".9s"><img src="img/slider/shape1.png" alt=""></div>
                                    <div class="slide-shape2" data-animation="bounceInRight" data-delay="1.2s"><img src="img/slider/shape2.png" alt=""></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="single-slider slide-1-style slide-height d-flex align-items-center" data-background="img/slider/slide1-1.jpg">
                        <div class="shape-title bounce-animate">
                            <h2>UX</h2>
                        </div>
                        <div class="shape-icon bounce-animate">
                            <img src="img/slider/shape-icon.png" alt="">
                        </div>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-xl-7">
                                    <div class="slide-content">
                                        <!---->
                                        <span data-animation="fadeInRight" data-delay=".2s">${ProductDao.getProductById(13).shopCategory.maincategory.name} Collection</span>
                                        <h1 data-animation="fadeInUp" data-delay=".5s">${ProductDao.getProductById(13).name}</h1>
                                        <!---->
                                        <div class="slide-btn">
                                            <a class="btn theme-btn" href="SearchProduct" data-animation="fadeInLeft" data-delay=".7s">shop now</a>
                                            <a class="btn white-btn" href="SearchShop" data-animation="fadeInRight" data-delay=".9s">Find Artisan</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-5">
                                    <div class="slide-shape1" data-animation="bounceInRight" data-delay=".9s"><img src="img/slider/shape3.png" alt=""></div>
                                    <div class="slide-shape2" data-animation="bounceInRight" data-delay="1.1s"><img src="img/slider/shape4.png" alt=""></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- slider-area end -->

            <!-- banner area start -->
            <section class="banner-area pt-30 pl-15 pr-15">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <div class="banner mb-30">
                                <a href="SearchProduct"><img src="img/banner/banner-1/banner1.jpg" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="banner mb-30">
                                <a href="SearchProduct"><img src="img/banner/banner-1/banner2.jpg" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="banner mb-30">
                                <a href="SearchProduct"><img src="img/banner/banner-1/banner3.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- banner area end -->
            <!-- product-area start -->
            <section class="product-area box-90 pt-70 pb-40">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-5 col-lg-12">
                            <div class="area-title mb-50">
                                <h2>Brand New Products</h2>
                                <p>Browse the huge variety of our products</p>
                            </div>
                        </div>
                        <div class="col-xl-7 col-lg-12">
                            <div class="product-tab mb-40">
                                <ul class="nav product-nav  justify-content-xl-end" id="myTab1" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="all-tab" data-toggle="tab" href="#allt" role="tab" aria-controls="all"
                                           aria-selected="true">Tất cả</a>
                                    </li>
                                    <c:forEach var="mcate" items="${sessionScope.main_category_list}" begin="0" end="2">
                                        <li class="nav-item">
                                            <a class="nav-link" id="cate-tab${mcate.id}" data-toggle="tab" href="#cate${mcate.id}" role="tab" aria-controls="${mcate.id}"
                                               aria-selected="false" style="font-family: 'Montserrat', sans-serif">${fn:length(mcate.name) > 11 ? fn:substring(mcate.name, 0, 11).trim().concat("...") : mcate.name}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="product-tab-content">
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="allt" role="tabpanel" aria-labelledby="all-tab">
                                        <c:set var="plist" value="${requestScope.newest_products}"/>
                                        <c:if test="${plist == null}">
                                            <div>
                                                <h5>Chưa có sản phẩm nào.</h5>
                                            </div>
                                        </c:if>
                                        <c:if test="${plist != null}">
                                            <div class="tab-content" id="myTabContent">
                                                <div class="row">
                                                    <c:forEach var="pr" items="${plist}">
                                                        <div class="col-lg-3 col-md-3">
                                                            <div class="product-wrapper mb-50">
                                                                <div class="product-img mb-25">
                                                                    <a href="ProductDetail?product=${pr.product_id}">
                                                                        <img src="${pr.productdetails[0].img}" alt="">
                                                                    </a>
                                                                    <div class="product-action text-center">
                                                                        <a href="AddToCart?id=${pr.productdetails[0].id}" title="Thêm vào giỏ hàng">
                                                                            <i class="flaticon-shopping-cart"></i>
                                                                        </a>
                                                                        <a href="ProductDetail?product=${pr.product_id}" title="Xem chi tiết">
                                                                            <i class="flaticon-eye"></i>
                                                                        </a>
                                                                    </div>
                                                                    <div class="sale-tag">
                                                                        <span class="new">new</span>
                                                                    </div>
                                                                </div>
                                                                <div class="product-content">
                                                                    <div class="pro-cat mb-10">
                                                                        <a href="SearchProduct?cate=${pr.shopCategory.maincategory.id}">${pr.shopCategory.maincategory.name} > </a>
                                                                        <a class="" href="#" style="color: #525470">${pr.shopCategory.name}</a>
                                                                    </div>
                                                                    <h4>
                                                                        <a href="ProductDetail?product=${pr.product_id}">${fn:length(pr.name) > 40 ? fn:substring(pr.name, 0, 39).trim().concat("...") : pr.name}</a>
                                                                    </h4>
                                                                    <div class="product-meta">
                                                                        <div class="pro-price">
                                                                            <c:set var="max" value="${pr.productdetails[pr.productdetails.size() - 1].price}"/>
                                                                            <c:if test="${(pr.productdetails.size() == 1) || (pr.productdetails.size() > 1 && pr.productdetails[0].price == pr.productdetails[pr.productdetails.size() - 1].price)}">
                                                                                <span><fmt:formatNumber value="${pr.productdetails[0].price}"/>đ</span>
                                                                            </c:if>
                                                                            <c:if test="${pr.productdetails.size() > 1 && pr.productdetails[0].price != pr.productdetails[pr.productdetails.size() - 1].price}">
                                                                                <span><fmt:formatNumber value="${pr.productdetails[0].price}"/>đ - <fmt:formatNumber value="${max}"/>đ</span>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <c:forEach var="cate" items="${sessionScope.main_category_list}" begin="0" end="2">
                                        <div class="tab-pane fade" id="cate${cate.id}" role="tabpanel" aria-labelledby="cate-tab${cate.id}">
                                            <c:set var="sclist" value="${ProductDao.getNewestProductsByMainCateId(cate.id)}"/>
                                            <c:if test="${sclist == null || sclist.isEmpty()}">
                                                <div>
                                                    <h5>Chưa có sản phẩm nào.</h5>
                                                </div>
                                            </c:if>
                                            <c:if test="${sclist != null}">
                                                <div class="tab-content" id="myTabContent">
                                                    <div class="row">
                                                        <c:forEach var="sc" items="${sclist}" begin="0" end="7">
                                                            <div class="col-lg-3 col-md-3">
                                                                <div class="product-wrapper mb-50">
                                                                    <div class="product-img mb-25">
                                                                        <a href="ProductDetail?product=${sc.product_id}">
                                                                            <img src="${sc.productdetails[0].img}" alt="">
                                                                        </a>
                                                                        <div class="product-action text-center">
                                                                            <a href="AddToCart?id=${sc.productdetails[0].id}" title="Thêm vào giỏ hàng">
                                                                                <i class="flaticon-shopping-cart"></i>
                                                                            </a>
                                                                            <a href="ProductDetail?product=${sc.product_id}" title="Xem chi tiết">
                                                                                <i class="flaticon-eye"></i>
                                                                            </a>
                                                                        </div>
                                                                        <div class="sale-tag">
                                                                            <span class="new">new</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-content">
                                                                        <div class="pro-cat mb-10">
                                                                            <a href="SearchProduct?cate=${sc.shopCategory.maincategory.id}">${sc.shopCategory.maincategory.name} > </a>
                                                                            <a href="#" style="color: #525470">${sc.shopCategory.name}</a>
                                                                        </div>
                                                                        <h4>
                                                                            <a href="ProductDetail?product=${sc.product_id}">${fn:length(sc.name) > 40 ? fn:substring(sc.name, 0, 39).trim().concat("...") : sc.name}</a>
                                                                        </h4>
                                                                        <div class="product-meta">
                                                                            <div class="pro-price">
                                                                                <c:set var="max" value="${sc.productdetails[sc.productdetails.size() - 1].price}"/>
                                                                                <c:if test="${(sc.productdetails.size() == 1) || (sc.productdetails.size() > 1 && sc.productdetails[0].price == sc.productdetails[sc.productdetails.size() - 1].price)}">
                                                                                    <span><fmt:formatNumber value="${sc.productdetails[0].price}"/>đ</span>
                                                                                </c:if>
                                                                                <c:if test="${sc.productdetails.size() > 1 && sc.productdetails[0].price != sc.productdetails[sc.productdetails.size() - 1].price}">
                                                                                    <span><fmt:formatNumber value="${sc.productdetails[0].price}"/>đ - <fmt:formatNumber value="${max}"/>đ</span>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:forEach>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- product-area end -->

            <!-- top-seller-area start -->
            <section class="top-seller-area box-90">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-5 col-lg-8 col-md-7">
                            <div class="area-title mb-50">
                                <h2>Top Sellers</h2>
                                <p>Browse the huge variety of our products</p>
                            </div>
                        </div>
                        <div class="col-xl-7 col-lg-4 col-md-5">
                            <div class="vue-btn text-left text-md-right mb-50">
                                <a href="SearchProduct" class="btn theme-btn">Collection</a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-5 col-lg-5">
                            <div class="top-seller mb-50">
                                <div style="height: 380px">
                                    <img src="${topsellers[1].productdetails[0].img}" alt="" style="width: 100%; height: 100%; object-fit: cover">
                                </div>
                                <div class="seller-box text-center">
                                    <div class="top-seller-content text-left">
                                        <h2><a href="ProductDetail?product=${topsellers[1].product_id}">${topsellers[1].name}</a></h2>
                                        <div class="pro-price mb-25">
                                            <c:set var="max" value="${topsellers[1].productdetails[topsellers[1].productdetails.size() - 1].price}"/>
                                            <c:if test="${(topsellers[1].productdetails.size() == 1) || (topsellers[1].productdetails.size() > 1 && topsellers[1].productdetails[0].price == topsellers[1].productdetails[topsellers[1].productdetails.size() - 1].price)}">
                                                <span><fmt:formatNumber value="${topsellers[1].productdetails[0].price}"/>đ</span>
                                            </c:if>
                                            <c:if test="${topsellers[1].productdetails.size() > 1 && topsellers[1].productdetails[0].price != topsellers[1].productdetails[topsellers[1].productdetails.size() - 1].price}">
                                                <span><fmt:formatNumber value="${topsellers[1].productdetails[0].price}"/>đ - <fmt:formatNumber value="${max}"/>đ</span>
                                            </c:if>
                                        </div>
                                        <div class="top-seller-btn">
                                            <a href="ProductDetail?product=${topsellers[1].product_id}" class="btn theme-btn">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-7 col-lg-7">
                            <div class="top-seller text-right mb-50">
                                <div style="height: 550px">
                                    <img src="${topsellers[0].productdetails[0].img}" alt="" style="width: 100%; height: 100%; object-fit: cover">
                                </div>
                                <div class="sellet-2-content">
                                    <h2><a href="ProductDetail?product=${topsellers[0].product_id}" style="font-size: ${(50 * 5.6 * 10) / fn:length(topsellers[0].name)}px">${topsellers[0].name}</a></h2>
                                    <div class="pro-price mb-25">
                                        <c:set var="max" value="${topsellers[0].productdetails[topsellers[0].productdetails.size() - 1].price}"/>
                                        <c:if test="${(topsellers[0].productdetails.size() == 1) || (topsellers[0].productdetails.size() > 1 && topsellers[0].productdetails[0].price == topsellers[0].productdetails[topsellers[0].productdetails.size() - 1].price)}">
                                            <span><fmt:formatNumber value="${topsellers[0].productdetails[0].price}"/>đ</span>
                                        </c:if>
                                        <c:if test="${topsellers[0].productdetails.size() > 1 && topsellers[0].productdetails[0].price != topsellers[0].productdetails[topsellers[0].productdetails.size() - 1].price}">
                                            <span><fmt:formatNumber value="${topsellers[0].productdetails[0].price}"/>đ - <fmt:formatNumber value="${max}"/>đ</span>
                                        </c:if>
                                    </div>
                                    <div class="top-seller-btn">
                                        <a href="ProductDetail?product=${topsellers[0].product_id}" class="btn theme-btn-2 mr-20">view details</a>
                                        <!--<a href="#" class="shop-btn"><i class="flaticon-shopping-cart"></i></a>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- top-seller-area end -->

            <!-- product-area start -->
            <section class="product-area box-90 pt-45 pb-40">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-5 col-lg-12">
                            <div class="area-title mb-50">
                                <h2>Best Sell Products</h2>
                                <p>Browse the huge variety of our products</p>
                            </div>
                        </div>
                        <div class="col-xl-7 col-lg-12">
                            <div class="product-tab mb-40">
                                <ul class="nav product-nav  justify-content-xl-end" id="myTab1" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="all-tab" data-toggle="tab" href="#all" role="tab" aria-controls="all"
                                           aria-selected="true">Tất cả</a>
                                    </li>
                                    <c:forEach var="mcate" items="${sessionScope.main_category_list}" begin="7" end="9">
                                        <li class="nav-item">
                                            <a class="nav-link" id="cate-tab${mcate.id}" data-toggle="tab" href="#tcate${mcate.id}" role="tab" aria-controls="${mcate.id}"
                                               aria-selected="false" style="font-family: 'Montserrat', sans-serif">${fn:length(mcate.name) > 11 ? fn:substring(mcate.name, 0, 11).trim().concat("...") : mcate.name}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="product-tab-content">
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
                                        <c:set var="plist" value="${requestScope.topsellers}"/>
                                        <c:if test="${plist == null}">
                                            <div>
                                                <h5>Chưa có sản phẩm nào.</h5>
                                            </div>
                                        </c:if>
                                        <c:if test="${plist != null}">
                                            <div class="tab-content" id="myTabContent">
                                                <div class="row">
                                                    <c:forEach var="pr" items="${plist}" begin="0" end="7">
                                                        <div class="col-lg-3 col-md-3">
                                                            <div class="product-wrapper mb-50">
                                                                <div class="product-img mb-25">
                                                                    <a href="ProductDetail?product=${pr.product_id}">
                                                                        <img src="${pr.productdetails[0].img}" alt="">
                                                                    </a>
                                                                    <div class="product-action text-center">
                                                                        <a href="AddToCart?id=${pr.productdetails[0].id}" title="Thêm vào giỏ hàng">
                                                                            <i class="flaticon-shopping-cart"></i>
                                                                        </a>
                                                                        <a href="ProductDetail?product=${pr.product_id}" title="Xem chi tiết">
                                                                            <i class="flaticon-eye"></i>
                                                                        </a>
                                                                    </div>
                                                                    <div class="sale-tag">
                                                                        <span class="new">new</span>
                                                                    </div>
                                                                </div>
                                                                <div class="product-content">
                                                                    <div class="pro-cat mb-10">
                                                                        <a href="SearchProduct?cate=${pr.shopCategory.maincategory.id}">${pr.shopCategory.maincategory.name} > </a>
                                                                        <a class="" href="#" style="color: #525470">${pr.shopCategory.name}</a>
                                                                    </div>
                                                                    <h4>
                                                                        <a href="ProductDetail?product=${pr.product_id}">${fn:length(pr.name) > 40 ? fn:substring(pr.name, 0, 39).trim().concat("...") : pr.name}</a>
                                                                    </h4>
                                                                    <div class="product-meta">
                                                                        <div class="pro-price">
                                                                            <c:set var="max" value="${pr.productdetails[pr.productdetails.size() - 1].price}"/>
                                                                            <c:if test="${(pr.productdetails.size() == 1) || (pr.productdetails.size() > 1 && pr.productdetails[0].price == pr.productdetails[pr.productdetails.size() - 1].price)}">
                                                                                <span><fmt:formatNumber value="${pr.productdetails[0].price}"/>đ</span>
                                                                            </c:if>
                                                                            <c:if test="${pr.productdetails.size() > 1 && pr.productdetails[0].price != pr.productdetails[pr.productdetails.size() - 1].price}">
                                                                                <span><fmt:formatNumber value="${pr.productdetails[0].price}"/>đ - <fmt:formatNumber value="${max}"/>đ</span>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <c:forEach var="cate" items="${sessionScope.main_category_list}" begin="7" end="9">
                                        <div class="tab-pane fade" id="tcate${cate.id}" role="tabpanel" aria-labelledby="cate-tab${cate.id}">
                                            <c:set var="sclist" value="${ProductDao.getTopSellersByMainCate(cate.id)}"/>
                                            <c:if test="${sclist == null || sclist.isEmpty()}">
                                                <div>
                                                    <h5>Chưa có sản phẩm nào.</h5>
                                                </div>
                                            </c:if>
                                            <c:if test="${sclist != null}">
                                                <div class="tab-content" id="myTabContent">
                                                    <div class="row">
                                                        <c:forEach var="sc" items="${sclist}" begin="0" end="7">
                                                            <div class="col-lg-3 col-md-3">
                                                                <div class="product-wrapper mb-50">
                                                                    <div class="product-img mb-25">
                                                                        <a href="ProductDetail?product=${sc.product_id}">
                                                                            <img src="${sc.productdetails[0].img}" alt="">
                                                                        </a>
                                                                        <div class="product-action text-center">
                                                                            <a href="AddToCart?id=${sc.productdetails[0].id}" title="Thêm vào giỏ hàng">
                                                                                <i class="flaticon-shopping-cart"></i>
                                                                            </a>
                                                                            <a href="ProductDetail?product=${sc.product_id}" title="Xem chi tiết">
                                                                                <i class="flaticon-eye"></i>
                                                                            </a>
                                                                        </div>
                                                                        <div class="sale-tag">
                                                                            <span class="new">new</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-content">
                                                                        <div class="pro-cat mb-10">
                                                                            <a href="SearchProduct?cate=${sc.shopCategory.maincategory.id}">${sc.shopCategory.maincategory.name} > </a>
                                                                            <a href="#" style="color: #525470">${sc.shopCategory.name}</a>
                                                                        </div>
                                                                        <h4>
                                                                            <a href="ProductDetail?product=${sc.product_id}">${fn:length(sc.name) > 40 ? fn:substring(sc.name, 0, 39).trim().concat("...") : sc.name}</a>
                                                                        </h4>
                                                                        <div class="product-meta">
                                                                            <div class="pro-price">
                                                                                <c:set var="max" value="${sc.productdetails[sc.productdetails.size() - 1].price}"/>
                                                                                <c:if test="${(sc.productdetails.size() == 1) || (sc.productdetails.size() > 1 && sc.productdetails[0].price == sc.productdetails[sc.productdetails.size() - 1].price)}">
                                                                                    <span><fmt:formatNumber value="${sc.productdetails[0].price}"/>đ</span>
                                                                                </c:if>
                                                                                <c:if test="${sc.productdetails.size() > 1 && sc.productdetails[0].price != sc.productdetails[sc.productdetails.size() - 1].price}">
                                                                                    <span><fmt:formatNumber value="${sc.productdetails[0].price}"/>đ - <fmt:formatNumber value="${max}"/>đ</span>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:forEach>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- product-area end -->
            <div>

            </div>
        </main>

        <jsp:include page="footer.jsp"></jsp:include>

    </body>

    <!-- Mirrored from wphix.com/template/vue/vue/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 21 Oct 2023 08:30:22 GMT -->
</html>

