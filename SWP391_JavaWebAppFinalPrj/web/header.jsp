<%-- 
    Document   : header
    Created on : Jan 17, 2024, 10:42:57 PM
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
                        <div class="col-xl-4 col-lg-6 col-md-6 col-7 col-sm-5 d-flex align-items-center pos-relative">
                            <div class="basic-bar cat-toggle">
                                <span class="bar1"></span>
                                <span class="bar2"></span>
                                <span class="bar3"></span>
                            </div>
                            <div class="logo">
                                <a href="Home"><img src="img/logo/coco.png" style="height:60px; width:300px;" alt=""></a>
                            </div>

                            <div class="category-menu">
                                <h4>Seller Centre</h4>
                                <ul>
                                    <li><a href="#"><i class="flaticon-employee"></i> Start selling</a></li>
                                </ul>
                                <h4>Category</h4>
                                <ul>
                                    <li><a href="shop.html"><i class="flaticon-shopping-cart-1"></i> Table lamp</a></li>
                                    <li><a href="shop.html"><i class="flaticon-shopping-cart-1"></i> Furniture</a></li>
                                    <li><a href="shop.html"><i class="flaticon-shopping-cart-1"></i> Chair</a></li>
                                    <li><a href="shop.html"><i class="flaticon-shopping-cart-1"></i> Men</a></li>
                                    <li><a href="shop.html"><i class="flaticon-shopping-cart-1"></i> Women</a></li>
                                    <li><a href="shop.html"><i class="flaticon-shopping-cart-1"></i> Cloth</a></li>
                                    <li><a href="shop.html"><i class="flaticon-shopping-cart-1"></i> Trend</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-8 col-8 d-none d-xl-block">
                            <div class="main-menu text-center">
                                <nav id="mobile-menu">
                                    <ul>
                                        <li>
                                            <a href="Home">Home</a>
                                        </li>
                                        <li class="mega-menu">
                                            <a href="shop.html">Shop</a>
                                            <ul class="submenu ">
                                                <li>
                                                    <a href="#">Category View</a>
                                                    <ul class="submenu  level-1">
                                                        <li>
                                                            <a href="shop.html">Shop 2 Column</a>
                                                        </li>
                                                        <li>
                                                            <a href="shop-filter.html">Shop Filter Style</a>
                                                        </li>
                                                        <li>
                                                            <a href="shop-full.html">Shop Full</a>
                                                        </li>
                                                        <li>
                                                            <a href="shop-3-col.html">Shop 3 Column</a>
                                                        </li>
                                                        <li>
                                                            <a href="shop-list.html">List View</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <a href="#">Category View</a>
                                                    <ul class="submenu">
                                                        <li>
                                                            <a href="shop-left-sidebar.html">Sidebar Left</a>
                                                        </li>
                                                        <li>
                                                            <a href="shop-sidebar-right.html">Sidebar Right</a>
                                                        </li>
                                                        <li>
                                                            <a href="cart.html">Shopping Cart</a>
                                                        </li>
                                                        <li>
                                                            <a href="checkout.html">Checkout</a>
                                                        </li>
                                                        <li>
                                                            <a href="wishlist.html">My Wishlist</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <a href="#">Products Types</a>
                                                    <ul class="submenu">
                                                        <li>
                                                            <a href="product-simple.html">Simple Product</a>
                                                        </li>
                                                        <li>
                                                            <a href="product-variable.html">Variable Product</a>
                                                        </li>
                                                        <li>
                                                            <a href="product-upcoming.html">Product Upcoming</a>
                                                        </li>
                                                        <li>
                                                            <a href="product-up-thumb.html">Thumb Top Product</a>
                                                        </li>
                                                        <li>
                                                            <a href="product-sidebar.html">Product Sidebar</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="shop-filter.html">Products </a>
                                        </li>
                                        <li>
                                            <a href="blog.html">Blog</a>
                                            <ul class="submenu">
                                                <li>
                                                    <a href="blog-2-col.html">Blog 2 Column</a>
                                                </li>
                                                <li>
                                                    <a href="blog-2-col-mas.html">Blog 2 Col Masonry</a>
                                                </li>
                                                <li>
                                                    <a href="blog-3-col.html">Blog 3 Column</a>
                                                </li>
                                                <li>
                                                    <a href="blog-3-col-mas.html">Blog 3 Col Masonry</a>
                                                </li>
                                                <li>
                                                    <a href="blog-details.html">Blog Details</a>
                                                </li>
                                                <li>
                                                    <a href="blog-details-audio.html">Blog Details Audio</a>
                                                </li>
                                                <li>
                                                    <a href="blog-details-video.html">Blog Details Video</a>
                                                </li>
                                                <li>
                                                    <a href="blog-details-gallery.html">Blog Details Gallery</a>
                                                </li>
                                                <li>
                                                    <a href="blog-details-left-sidebar.html">Details Left Sidebar</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#">Pages</a>
                                            <ul class="submenu">
                                                <li>
                                                    <a href="about.html">About Us</a>
                                                </li>

                                                <li>
                                                    <a href="contact.html">Contact Us</a>
                                                </li>
                                                <li>
                                                    <a href="login.jsp">Login</a>
                                                </li>
                                                <li>
                                                    <a href="register.html">Register</a>
                                                </li>
                                                <li>
                                                    <a href="cart.html">Shoping Cart</a>
                                                </li>
                                                <li>
                                                    <a href="checkout.html">Checkout</a>
                                                </li>
                                                <li>
                                                    <a href="wishlist.html">Wishlist</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="contact.html">Contact</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-6 col-md-6 col-5 col-sm-7 pl-0">
                            <div class="header-right f-right">
                                <ul>
                                    <li class="search-btn">
                                        <a class="search-btn nav-search search-trigger" href="#"><i class="fas fa-search"></i></a>
                                    </li>
                                    <li class="login-btn">
                                        <c:if test="${sessionScope.user == null}">
                                            <a href="login.jsp"><i class="far fa-user"></i></a>
                                            <ul class="submenu">

                                                <li >
                                                    <a href="login.jsp">Login</a>
                                                </li>
                                                <li>
                                                    <a href="register.jsp">Register</a>
                                                </li>

                                            </ul>
                                        </c:if>
                                        <c:if test="${sessionScope.user != null}">
                                            <a href="profile.jsp"><i class="far fa-user"></i></a>
                                            <ul class="submenu">
                                                <li  style="font-size: 16px;">Hi, <b>${sessionScope.user.userName}</b>!</li>
                                                <li>
                                                    <a href="profile.jsp">My Account</a>
                                                </li>
                                                <li>
                                                    <a href="#">My Purchase</a>
                                                </li>
                                                <li>
                                                    <a href="logout">Logout</a>
                                                </li>
                                            </ul>
                                        </c:if>

                                    </li>
                                    <li class="d-shop-cart">
                                        <a href="#">
                                            <i class="flaticon-shopping-cart"></i>
                                            <c:if test="${sessionScope.user.role == 1}">
                                                <span class="cart-count">3</span>
                                            </c:if>
                                        </a>
                                        <c:if test="${sessionScope.user.role == 1}">
                                            <ul class="minicart">
                                                <li>
                                                    <div class="cart-img">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro1.jpg" alt="" />
                                                        </a>
                                                    </div>
                                                    <div class="cart-content">
                                                        <h3>
                                                            <a href="product-details.html">Black & White Shoes</a>
                                                        </h3>
                                                        <div class="cart-price">
                                                            <span class="new">$ 229.9</span>
                                                            <span>
                                                                <del>$239.9</del>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="del-icon">
                                                        <a href="#">
                                                            <i class="far fa-trash-alt"></i>
                                                        </a>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="cart-img">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro2.jpg" alt="" />
                                                        </a>
                                                    </div>
                                                    <div class="cart-content">
                                                        <h3>
                                                            <a href="product-details.html">Black & White Shoes</a>
                                                        </h3>
                                                        <div class="cart-price">
                                                            <span class="new">$ 229.9</span>
                                                            <span>
                                                                <del>$239.9</del>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="del-icon">
                                                        <a href="#">
                                                            <i class="far fa-trash-alt"></i>
                                                        </a>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="cart-img">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro3.jpg" alt="" />
                                                        </a>
                                                    </div>
                                                    <div class="cart-content">
                                                        <h3>
                                                            <a href="product-details.html">Black & White Shoes</a>
                                                        </h3>
                                                        <div class="cart-price">
                                                            <span class="new">$ 229.9</span>
                                                            <span>
                                                                <del>$239.9</del>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="del-icon">
                                                        <a href="#">
                                                            <i class="far fa-trash-alt"></i>
                                                        </a>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="total-price">
                                                        <span class="f-left">Total:</span>
                                                        <span class="f-right">$300.0</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="checkout-link">
                                                        <a href="cart.html">Shopping Cart</a>
                                                        <a class="red-color" href="checkout.html">Checkout</a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </c:if>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-12 d-xl-none">
                            <div class="mobile-menu"></div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Fullscreen search -->
        <div class="search-wrap">
            <div class="search-inner">
                <i class="fas fa-times search-close" id="search-close"></i>
                <div class="search-cell">
                    <form method="get">
                        <div class="search-field-holder">
                            <input type="search" class="main-search-input" placeholder="Search Entire Store...">
                        </div>
                    </form>
                </div>
            </div>
        </div> <!-- end fullscreen search -->

        
    </body>
</html>
