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
        <style>
            .stars-container {
                position: relative;
                display: inline-block;
                color: transparent;
                font-size: 29px;
            }

            .stars-container:before {
                position: absolute;
                top: 0;
                left: 0;
                content: '★★★★★';
                color: lightgray;
            }

            .stars-container:after {
                position: absolute;
                top: 0;
                left: 0;
                content: '★★★★★';
                color: gold;
                overflow: hidden;
            }
            <c:forEach var="i" begin="0" end="500">
                .stars-${i}:after {
                    width: ${i/5}%;
                }
            </c:forEach>

            .rate {
                float: left;
                height: 46px;
                padding: 0 10px;
            }
            .rate:not(:checked) > input {
                position:absolute;
                top:-9999px;
            }
            .rate:not(:checked) > label {
                float:right;
                width:1em;
                overflow:hidden;
                white-space:nowrap;
                cursor:pointer;
                font-size:30px;
                color:#ccc;
            }
            .rate:not(:checked) > label:before {
                content: '★ ';
            }
            .rate > input:checked ~ label {
                color: #ffc700;
            }
            .rate:not(:checked) > label:hover,
            .rate:not(:checked) > label:hover ~ label {
                color: #deb217;
            }
            .rate > input:checked + label:hover,
            .rate > input:checked + label:hover ~ label,
            .rate > input:checked ~ label:hover,
            .rate > input:checked ~ label:hover ~ label,
            .rate > label:hover ~ input:checked ~ label {
                color: #c59b08;
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
                                                <img src="${pr.img}" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-xl-6 col-lg-8">
                            <div class="product-details mb-30 pl-30">
                                <div class="details-cat mb-20">
                                    <a href="SearchProduct?cate=${sessionScope.categoryDao.getShopCategoryById(pr.scate_id).maincate_id}">${sessionScope.categoryDao.getMainCategoryById(sessionScope.categoryDao.getShopCategoryById(pr.scate_id).maincate_id).name} > </a>
                                    <a href="ShopDetail?id=${pr.shop_id}#cate${pr.scate_id}">${sessionScope.categoryDao.getShopCategoryById(pr.scate_id).name}</a>
                                </div>
                                <h2 class="pro-details-title mb-15">${pr.name}</h2>
                                <div class="details-price mb-20">
                                    <span><fmt:formatNumber value="${pr.money}"/>đ</span>
                                    <!--<span class="old-price">$246.00</span>-->
                                </div>
                                <div class="product-variant" >
                                    <div class="product-desc variant-item" style="display: flex;">
                                        <ul class="recent-posts" style="width: 70%">
                                            <li>
                                                <div class="widget-posts-image">
                                                    <a href="ShopDetail?id=${pr.shop_id}">
                                                        <img src='${sessionScope.sellersDao.getShopById(pr.shop_id).shop_img}' alt=''>
                                                    </a>
                                                </div>
                                                <div class="widget-posts-body">
                                                    <a href="ShopDetail?id=${pr.shop_id}"><h6 class="widget-posts-title" style="font-weight: bold;">${sellersDao.getShopById(pr.shop_id).shop_name}</h6></a>
                                                    <h7>Địa chỉ:<span style="color: #fe4536;"> ${usersDao.getUserById(pr.shop_id).address}</span></h7>
                                                </div>
                                            </li>
                                        </ul>
                                        <div class="f-right" style="width: 30%; padding-left: 6%;">
                                            <button onclick="location.href = 'Chat'" 
                                                    style="color: black;
                                                    position: relative;
                                                    overflow: visible;
                                                    outline: 0;
                                                    background: #fff;
                                                    height: 30px;
                                                    width: 100px;
                                                    border: 2px solid #ecedff;
                                                    margin-bottom: 5px;">Chat</button>
                                            <button onclick="location.href = 'ShopDetail?id=${pr.shop_id}'" 
                                                    style="color: black;
                                                    position: relative;
                                                    overflow: visible;
                                                    outline: 0;
                                                    background: #fff;
                                                    height: 30px;
                                                    width: 100px;
                                                    border: 2px solid #ecedff;">View Shop</button>
                                        </div>

                                    </div>
                                    <div class="product-info-list variant-item">
                                        <ul>
                                            <li class="side-pro-rating">
                                                <div><span class="stars-container stars-${sessionScope.aver_rate}">★★★★★ </span>
                                                    <b style="font-size: 18px;"> ${sessionScope.aver_rate/100}</b> - (${sessionScope.ratings_by_product.size()} đánh giá)
                                                </div>
                                            </li>
                                            <li><span>Stock:</span> <span class="in-stock">${pr.quantity} có sẵn</span></li>
                                        </ul>
                                    </div>

                                    <div class="product-action-details variant-item">
                                        <div class="product-details-action">

                                            <div class="plus-minus">
                                                <div class="cart-plus-minus"><input type="text" value="1" /></div>
                                            </div>
                                            <div class="details-cart mt-40" style="font-family: 'Montserrat', sans-serif;">
                                                <button class="btn theme-btn" onclick="location.href = 'AddToCart?id=${pr.product_id}'">Thêm vào giỏ hàng</button>
                                                <button class="btn theme-btn" onclick="location.href = '#'">Mua ngay</button>
                                                <!--<a class="search-trigger" href="#"><i class="fa fa-flag" style="display: inline-block; font-size: 25px; color: #fe4536;" title="Tố cáo người dùng này"></i></a>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-50">
                        <div class="col-xl-12 col-lg-8">
                            <div class="product-review">
                                <ul class="nav review-tab" id="myTabproduct" style="font-family: 'Montserrat', sans-serif;" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab6" data-toggle="tab" href="#home6" role="tab" aria-controls="home"
                                           aria-selected="true">Mô tả </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab6" data-toggle="tab" href="#profile6" role="tab" aria-controls="profile"
                                           aria-selected="false">Reviews (${sessionScope.ratings_by_product.size()})</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent2">
                                    <div class="tab-pane fade show active" id="home6" role="tabpanel" aria-labelledby="home-tab6">
                                        <div class="desc-text">
                                            <p>${pr.description}</p>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="profile6" role="tabpanel" aria-labelledby="profile-tab6">
                                        <div class="desc-text review-text">
                                            <div class="product-commnets">
                                                <c:if test="${sessionScope.ratings_by_product == null || empty sessionScope.ratings_by_product}">
                                                    Chưa có đánh giá nào.
                                                </c:if>
                                                <c:forEach var="rating" items="${sessionScope.ratings_by_product}">
                                                    <div class="product-commnets-list mb-25 pb-15">
                                                        <div class="pro-comments-img">
                                                            <img src="${rating.user.img}" alt="" style="border-radius: 50%;">
                                                        </div>
                                                        <div class="pro-commnets-text">
                                                            <h4>${rating.user.username} -
                                                                <span>${rating.timeStamp}</span>
                                                            </h4>
                                                            <div class="pro-rating">
                                                                <span class="stars-container stars-${rating.score}">★★★★★ </span>
                                                            </div>
                                                            <p>${rating.comment}</p>
                                                        </div>
                                                    </div>
                                                </c:forEach>

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

            <c:if test="${product_by_shop.size() > 0}">
                <section class="product-area pb-100">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="area-title text-center mb-50">
                                    <h2>Sản phẩm khác của Shop</h2>
                                    <!--                                <p>Browse the huge variety of our products</p>-->
                                    <a href="ShopDetail?id=${pr.shop_id}" style='float:right; color:#fe4536;'>Xem thêm>></a>
                                </div>
                            </div>
                        </div>
                        <c:if test="${product_by_shop.size() < 3}">
                            <div class="row mt-30">
                                <div class="col-xl-12 col-lg-12">

                                    <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
                                        <c:set var="plist" value="${sessionScope.product_by_shop}"/>


                                        <div class="tab-content" id="myTabContent">
                                            <div class="row">
                                                <c:forEach var="pr" items="${plist}">
                                                    <div class="col-lg-4 col-md-4">
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
                                    </div>

                                </div>
                            </div>
                        </c:if>
                        <c:if test="${product_by_shop.size() > 2}">
                            <div class="product-slider-2 owl-carousel">
                                <c:forEach var="prs" items="${product_by_shop}">
                                    <div class="pro-item">
                                        <div class="product-wrapper">
                                            <div class="product-img mb-25">
                                                <a href="ProductDetail?product=${prs.product_id}">
                                                    <img src="${prs.img}" alt="">
                                                </a>
                                                <div class="product-action text-center">
                                                    <a href="AddToCart?id=${prs.product_id}" title="Thêm vào giỏ hàng">
                                                        <i class="flaticon-shopping-cart"></i>
                                                    </a>
                                                    <a href="ProductDetail?product=${prs.product_id}" title="Xem chi tiết">
                                                        <i class="flaticon-eye"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <div class="pro-cat mb-10">
                                                    <a href="SearchProduct?cate=${sessionScope.categoryDao.getShopCategoryById(prs.scate_id).maincate_id}">${sessionScope.categoryDao.getMainCategoryById(sessionScope.categoryDao.getShopCategoryById(prs.scate_id).maincate_id).name} > </a>
                                                    <a href="#" style="color: #525470">${sessionScope.categoryDao.getShopCategoryById(prs.scate_id).name}</a>
                                                </div>
                                                <h4>
                                                    <a href="ProductDetail?product=${prs.product_id}">${prs.name}</a>
                                                </h4>
                                                <div class="product-meta">
                                                    <div class="pro-price">
                                                        <span><fmt:formatNumber value="${prs.money}"/>đ</span>
                                                        <!--<span class="old-price">$230.00 USD</span>-->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </c:if>
                    </div>
                </section>
            </c:if>
            <!-- product-area end -->
            <div class="search-wrap" style="background: rgba(0,0,0,.6);">
                <div class="search-inner">
                    <i class="fas fa-times search-close" id="search-close"></i>
                    <div class="search-cell" style="background: #FFF; width: 45%; margin-left: 27%; height: 66%; border-radius: 5px">
                        <div class="basic-login" style="border: 0; padding: 50px 70px;">
                            <h3 class="text-center" style="border-bottom: 1px solid #e5e5e5; padding-bottom: 10px; margin-bottom: 40px">Đánh giá sản phẩm này</h3>
                            <form method="post" action="Rating?id=${pr.product_id}">
                                <table width="550" height="300">
                                    <tr>
                                        <td>
                                            <div class="side-pro-img">
                                                <a href="ProductDetail?product=${pr.product_id}"><img src="${pr.img}" style="width: 70px;" alt=""></a>
                                            </div>
                                        </td>
                                        <td style="vertical-align: top;">
                                            <div class="side-pro-content">
                                                <h5><a href="ProductDetail?product=${pr.product_id}" style="font-weight: bold;">${pr.name}</a></h5>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100%"><span style="color:red;">*</span>Đánh giá</td>
                                        <td>
                                            <div class="rate">
                                                <input type="radio" id="star5" name="rate" value="5" required=""/>
                                                <label for="star5" title="text">5 stars</label>
                                                <input type="radio" id="star4" name="rate" value="4" />
                                                <label for="star4" title="text">4 stars</label>
                                                <input type="radio" id="star3" name="rate" value="3" />
                                                <label for="star3" title="text">3 stars</label>
                                                <input type="radio" id="star2" name="rate" value="2" />
                                                <label for="star2" title="text">2 stars</label>
                                                <input type="radio" id="star1" name="rate" value="1" />
                                                <label for="star1" title="text">1 star</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span style="color:red;">*</span>Comment</td>
                                        <td><textarea id="comment" name="comment" rows="3" cols="50" style="border: 2px solid #eaedff; margin-top: 10px" required=""></textarea></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td><button style="color: #fff;
                                                    position: relative;
                                                    overflow: visible;
                                                    background: #fe4536;
                                                    height: 40px;
                                                    padding: 0 10px;
                                                    margin-top: 15px;
                                                    margin-bottom: 1.25rem;
                                                    min-width: 70px;
                                                    max-width: 220px;
                                                    border: 0;" type="submit">Hoàn thành</button></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
