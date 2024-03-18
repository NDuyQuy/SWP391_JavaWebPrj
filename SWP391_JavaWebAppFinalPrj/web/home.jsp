<%-- 
    Document   : home
    Created on : Jan 17, 2024, 5:30:41 PM
    Author     : hien
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
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
                                            <span data-animation="fadeInRight" data-delay=".2s">Furniture Collection</span>
                                            <h1 data-animation="fadeInUp" data-delay=".5s">Synnes Dining
                                                Chair Upholstered</h1>
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
                                            <span data-animation="fadeInRight" data-delay=".2s">Furniture Collection</span>
                                            <h1 data-animation="fadeInUp" data-delay=".5s">Synnes Dining
                                                Chair Upholstered</h1>
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
                                            <a class="nav-link active" id="all-tab" data-toggle="tab" href="#all" role="tab" aria-controls="all"
                                               aria-selected="true">Tất cả</a>
                                        </li>
                                    <c:forEach var="mcate" items="${sessionScope.main_category_list}" begin="0" end="2">
                                        <li class="nav-item">
                                            <a class="nav-link" id="cate-tab${mcate.id}" data-toggle="tab" href="#cate${mcate.id}" role="tab" aria-controls="${mcate.id}"
                                               aria-selected="false">${mcate.name}</a>
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
                                        <c:set var="plist" value="${sessionScope.newest_products}"/>
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
                                                                        <img src="${pr.img}" alt="">
                                                                    </a>
                                                                    <div class="product-action text-center">
                                                                        <a href="AddToCart?id=${pr.product_id}" title="Thêm vào giỏ hàng">
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
                                                                        <a href="SearchProduct?cate=${sessionScope.categoryDao.getShopCategoryById(pr.scate_id).maincate_id}">${sessionScope.categoryDao.getMainCategoryById(sessionScope.categoryDao.getShopCategoryById(pr.scate_id).maincate_id).name} > </a>
                                                                        <a class="" href="#" style="color: #525470">${sessionScope.categoryDao.getShopCategoryById(pr.scate_id).name}</a>
                                                                    </div>
                                                                    <h4>
                                                                        <a href="ProductDetail?product=${pr.product_id}">${pr.name}</a>
                                                                    </h4>
                                                                    <div class="product-meta">
                                                                        <div class="pro-price">
                                                                            <span><fmt:formatNumber value="${pr.money}"/>đ</span>
                                                                            <!--<span class="old-price">$230.00 USD</span>-->
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
                                            <c:set var="sclist" value="${productDao.getProductsByMainCateId(cate.id)}"/>
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
                                                                            <img src="${sc.img}" alt="">
                                                                        </a>
                                                                        <div class="product-action text-center">
                                                                            <a href="AddToCart?id=${sc.product_id}" title="Thêm vào giỏ hàng">
                                                                                <i class="flaticon-shopping-cart"></i>
                                                                            </a>
                                                                            <a href="ProductDetail?product=${sc.product_id}" title="Xem chi tiết">
                                                                                <i class="flaticon-eye"></i>
                                                                            </a>
                                                                        </div>
                                                                        <div class="sale-tag">
                                                                            <span class="new">new</span>
                                                                            <span class="sale">sale</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-content">
                                                                        <div class="pro-cat mb-10">
                                                                            <a href="SearchProduct?cate=${sessionScope.categoryDao.getShopCategoryById(sc.scate_id).maincate_id}">${sessionScope.categoryDao.getMainCategoryById(sessionScope.categoryDao.getShopCategoryById(sc.scate_id).maincate_id).name} > </a>
                                                                            <a href="#" style="color: #525470">${sessionScope.categoryDao.getShopCategoryById(sc.scate_id).name}</a>
                                                                        </div>
                                                                        <h4>
                                                                            <a href="ProductDetail?product=${sc.product_id}">${sc.name}</a>
                                                                        </h4>
                                                                        <div class="product-meta">
                                                                            <div class="pro-price">
                                                                                <span><fmt:formatNumber value="${sc.money}"/>đ</span>
                                                                                <!--<span class="old-price">$230.00 USD</span>-->
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
                                <a href="shop.html" class="btn theme-btn">Collection</a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-5 col-lg-5">
                            <div class="top-seller mb-50">
                                <img src="img/banner/top-seller/banner1.jpg" alt="">
                                <div class="seller-box text-center">
                                    <div class="top-seller-content text-left">
                                        <h2><a href="shop.html">Minimal Home Decor</a></h2>
                                        <div class="pro-price mb-25">
                                            <span>$119.00 USD</span>
                                            <span class="old-price">$230.00 USD</span>
                                        </div>
                                        <div class="top-seller-btn">
                                            <a href="shop.html" class="btn theme-btn">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-7 col-lg-7">
                            <div class="top-seller text-right mb-50">
                                <img src="img/banner/top-seller/banner2.jpg" alt="">
                                <div class="sellet-2-content">
                                    <h2><a href="shop.html">Xcross Comoer Furniture</a></h2>
                                    <div class="pro-price mb-25">
                                        <span>$119.00 USD</span>
                                        <span class="old-price">$230.00 USD</span>
                                    </div>
                                    <div class="top-seller-btn">
                                        <a href="shop.html" class="btn theme-btn-2 mr-20">view details</a>
                                        <a href="#" class="shop-btn"><i class="flaticon-shopping-cart"></i></a>
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
                                <ul class="nav product-nav justify-content-xl-end" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab1" data-toggle="tab" href="#home1" role="tab"
                                           aria-controls="home" aria-selected="true">table lamp</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab1" data-toggle="tab" href="#profile1" role="tab"
                                           aria-controls="profile" aria-selected="false">furniture</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab6" data-toggle="tab" href="#contact1" role="tab"
                                           aria-controls="contact" aria-selected="false">chair</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab2" data-toggle="tab" href="#contact2" role="tab"
                                           aria-controls="contact" aria-selected="false">Clock</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="product-tab-content">
                                <div class="tab-content" id="myTabContent1">
                                    <div class="tab-pane fade show active" id="home1" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="product-slider owl-carousel">
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro9.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro4.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                        <div class="sale-tag">
                                                            <span class="new">new</span>
                                                            <span class="sale">sale</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro10.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro4.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                        <div class="sale-tag">
                                                            <span class="sale">sale</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro11.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro6.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                        <div class="sale-tag">
                                                            <span class="new">30%</span>
                                                            <span class="sale">Sale</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro12.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro8.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro7.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro4.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                        <div class="sale-tag">
                                                            <span class="sale">60%</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="profile1" role="tabpanel" aria-labelledby="profile-tab">
                                        <div class="product-slider owl-carousel">
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro2.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro4.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                        <div class="sale-tag">
                                                            <span class="new">30%</span>
                                                            <span class="sale">Sale</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro4.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro8.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro3.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro4.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                        <div class="sale-tag">
                                                            <span class="sale">sale</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro7.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro4.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                        <div class="sale-tag">
                                                            <span class="sale">60%</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro8.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro1.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="contact1" role="tabpanel" aria-labelledby="contact-tab">
                                        <div class="product-slider owl-carousel">
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro2.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro4.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                        <div class="sale-tag">
                                                            <span class="new">30%</span>
                                                            <span class="sale">Sale</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro4.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro8.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro3.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro4.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                        <div class="sale-tag">
                                                            <span class="sale">sale</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro7.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro4.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                        <div class="sale-tag">
                                                            <span class="sale">60%</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro8.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro1.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="contact2" role="tabpanel" aria-labelledby="contact-tab1">
                                        <div class="product-slider owl-carousel">
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro8.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro1.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro3.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro4.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                        <div class="sale-tag">
                                                            <span class="sale">sale</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro2.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro4.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                        <div class="sale-tag">
                                                            <span class="new">30%</span>
                                                            <span class="sale">Sale</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro4.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro8.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-item">
                                                <div class="product-wrapper mb-50">
                                                    <div class="product-img mb-25">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro7.jpg" alt="">
                                                            <img class="secondary-img" src="img/product/pro4.jpg" alt="">
                                                        </a>
                                                        <div class="product-action text-center">
                                                            <a href="#" title="Shoppingb Cart">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="#" title="Quick View">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                            <a href="#" data-toggle="tooltip" data-placement="right" title="Compare">
                                                                <i class="flaticon-compare"></i>
                                                            </a>
                                                        </div>
                                                        <div class="sale-tag">
                                                            <span class="sale">60%</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <div class="pro-cat mb-10">
                                                            <a href="shop.html">decor, </a>
                                                            <a href="shop.html">furniture</a>
                                                        </div>
                                                        <h4>
                                                            <a href="product-details.html">Minimal Troma Furniture</a>
                                                        </h4>
                                                        <div class="product-meta">
                                                            <div class="pro-price">
                                                                <span>$119.00 USD</span>
                                                                <span class="old-price">$230.00 USD</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-wishlist">
                                                            <a href="#"><i class="far fa-heart" title="Wishlist"></i></a>
                                                        </div>
                                                    </div>
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
            <!-- product-area end -->
            <div>

            </div>
        </main>

        <jsp:include page="footer.jsp"></jsp:include>

    </body>

    <!-- Mirrored from wphix.com/template/vue/vue/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 21 Oct 2023 08:30:22 GMT -->
</html>

