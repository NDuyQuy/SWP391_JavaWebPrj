<%-- 
    Document   : product_detail
    Created on : Feb 27, 2024, 12:48:56 PM
    Author     : hien
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

                <!-- breadcrumb-area-start -->
                <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-text text-center">
                                    <h1>Our Shop</h1>
                                    <ul class="breadcrumb-menu">
                                        <li><a href="Home">home</a></li>
                                        <li><span>detail</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- breadcrumb-area-end -->

                <!-- shop-area start -->
                <section class="shop-details-area pt-100 pb-100">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-6 col-lg-4">
                                <div class="product-details-img mb-10">
                                    <div class="tab-content" id="myTabContentpro">
                                        <div class="tab-pane fade show active" id="home" role="tabpanel">
                                            <div class="product-large-img">
                                                <img src="img/product/pro1.jpg" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="col-xl-6 col-lg-8">
                                <div class="product-details mb-30 pl-30">
                                    <div class="details-cat mb-20">
                                        <a href="SearchProduct?cate=${pr.mCate.categoryID}">${pr.mCate.categoryName} > </a>
                                        <a href="#">${pr.sCate.categoryName}</a>
                                    </div>
                                    <h2 class="pro-details-title mb-15">${pr.productName}</h2>
                                    <div class="details-price mb-20">
                                        <span><fmt:formatNumber value="${pr.price}"/>đ</span>
                                        <!--<span class="old-price">$246.00</span>-->
                                    </div>
                                    <div class="product-variant">

                                        <div class="product-info-list variant-item">
                                            <ul>
                                                <li><span>Stock:</span> <span class="in-stock">${pr.quantity}</span></li>
                                            </ul>
                                        </div>

                                        <div class="product-action-details variant-item">
                                            <div class="product-details-action">
                                                <form action="#">
                                                    <div class="plus-minus">
                                                        <div class="cart-plus-minus"><input type="text" value="1" /></div>
                                                    </div>
                                                    <div class="details-cart mt-40">
                                                        <button class="btn theme-btn">Thêm vào giỏ hàng</button>
                                                        <button class="btn theme-btn">Mua ngay</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-50">
                            <div class="col-xl-12 col-lg-8">
                                <div class="product-review">
                                    <ul class="nav review-tab" id="myTabproduct" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="home-tab6" data-toggle="tab" href="#home6" role="tab" aria-controls="home"
                                               aria-selected="true">Description </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="profile-tab6" data-toggle="tab" href="#profile6" role="tab" aria-controls="profile"
                                               aria-selected="false">Reviews (2)</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="myTabContent2">
                                        <div class="tab-pane fade show active" id="home6" role="tabpanel" aria-labelledby="home-tab6">
                                            <div class="desc-text">
                                                <p>${product.description}</p>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="profile6" role="tabpanel" aria-labelledby="profile-tab6">
                                            <div class="desc-text review-text">
                                                <div class="product-commnets">
                                                    <div class="product-commnets-list mb-25 pb-15">
                                                        <div class="pro-comments-img">
                                                            <img src="img/product/comments/01.png" alt="">
                                                        </div>
                                                        <div class="pro-commnets-text">
                                                            <h4>Roger West -
                                                                <span>June 5, 2018</span>
                                                            </h4>
                                                            <div class="pro-rating">
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                            </div>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                                                incididunt
                                                                ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                                                exercitation.</p>
                                                        </div>
                                                    </div>
                                                    <div class="product-commnets-list mb-25 pb-15">
                                                        <div class="pro-comments-img">
                                                            <img src="img/product/comments/02.png" alt="">
                                                        </div>
                                                        <div class="pro-commnets-text">
                                                            <h4>Roger West -
                                                                <span>June 5, 2018</span>
                                                            </h4>
                                                            <div class="pro-rating">
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                            </div>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                                                incididunt
                                                                ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                                                exercitation.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="review-box mt-50">
                                                    <h4>Add a Review</h4>
                                                    <div class="your-rating mb-40">
                                                        <span>Your Rating:</span>
                                                        <div class="rating-list">
                                                            <a href="#">
                                                                <i class="far fa-star"></i>
                                                            </a>
                                                            <a href="#">
                                                                <i class="far fa-star"></i>
                                                            </a>
                                                            <a href="#">
                                                                <i class="far fa-star"></i>
                                                            </a>
                                                            <a href="#">
                                                                <i class="far fa-star"></i>
                                                            </a>
                                                            <a href="#">
                                                                <i class="far fa-star"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <form class="review-form" action="#">
                                                        <div class="row">
                                                            <div class="col-xl-12">
                                                                <label for="message">YOUR REVIEW</label>
                                                                <textarea name="message" id="message" cols="30" rows="10"></textarea>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <label for="r-name">Name</label>
                                                                <input type="text" id="r-name">
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <label for="r-email">Email</label>
                                                                <input type="email" id="r-email">
                                                            </div>
                                                            <div class="col-xl-12">
                                                                <button class="btn theme-btn">Add your Review</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </section>
                <!-- shop-area end -->

                <!-- product-area start -->
                <section class="product-area pb-100">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="area-title text-center mb-50">
                                    <h2>Releted Products</h2>
                                    <p>Browse the huge variety of our products</p>
                                </div>
                            </div>
                        </div>
                        <div class="product-slider-2 owl-carousel">
                            <div class="pro-item">
                                <div class="product-wrapper">
                                    <div class="product-img mb-25">
                                        <a href="product-details.html">
                                            <img src="img/product/pro4.jpg" alt="">
                                            <img class="secondary-img" src="img/product/pro5.jpg" alt="">
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
                                            <a href="product-details.html">Raglan Baseball Style shirt</a>
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
                                <div class="product-wrapper">
                                    <div class="product-img mb-25">
                                        <a href="product-details.html">
                                            <img src="img/product/pro5.jpg" alt="">
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
                                            <a href="product-details.html">Raglan Baseball Style shirt</a>
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
                                <div class="product-wrapper">
                                    <div class="product-img mb-25">
                                        <a href="product-details.html">
                                            <img src="img/product/pro7.jpg" alt="">
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
                                            <a href="product-details.html">Raglan Baseball Style shirt</a>
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
                                <div class="product-wrapper">
                                    <div class="product-img mb-25">
                                        <a href="product-details.html">
                                            <img src="img/product/pro9.jpg" alt="">
                                            <img class="secondary-img" src="img/product/pro10.jpg" alt="">
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
                                            <a href="product-details.html">Raglan Baseball Style shirt</a>
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
                                <div class="product-wrapper">
                                    <div class="product-img mb-25">
                                        <a href="product-details.html">
                                            <img src="img/product/pro1.jpg" alt="">
                                            <img class="secondary-img" src="img/product/pro11.jpg" alt="">
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
                                            <a href="product-details.html">Raglan Baseball Style shirt</a>
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
                </section>
                <!-- product-area end -->

            <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
