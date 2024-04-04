<%-- 
    Document   : product_detail
    Created on : Feb 27, 2024, 12:48:56 PM
    Author     : hien
--%>
<%@ page import="dao.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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


        </style>
    </head>
    <body onload="checkShow('${fn:replace(pr.productdetails[0].img, '\\', '/')}', '${pr.productdetails[0].price}', '${pr.productdetails[0].quantity}')">
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
                                        <div class="tab-pane fade show active" id="img0" role="tabpanel">
                                            <div class="product-large-img" style="height: 670px">
                                                <img id="show-img0" src="${pr.productdetails[0].img}" alt="" style="height: 100%; object-fit: contain">
                                        </div>
                                    </div>
                                    <c:if test="${pr.productdetails.size() > 1}">
                                        <c:forEach var="prd" items="${pr.productdetails}" begin="1" end="${pr.productdetails.size() - 1}" varStatus="loop">
                                            <div class="tab-pane fade" id="img${loop.count}" role="tabpanel">
                                                <div class="product-large-img" style="height: 670px">
                                                    <img src="${prd.img}" alt="" style="height: 100%; object-fit: contain">
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                            <c:if test="${pr.productdetails.size() == 2}">
                                <div class="shop-thumb-tab mb-30">
                                    <ul class="nav" id="myTab2" role="tablist">
                                        <li class="nav-item" style="width: 50%">
                                            <a class="nav-link active" id="img0-tab" data-toggle="tab" href="#img0" role="tab" aria-selected="true" style="height: 200px">
                                                <img src="${pr.productdetails[0].img}" alt="" style="width: 100%; height: 100%; object-fit: contain"> </a>
                                        </li>

                                        <li class="nav-item" style="width: 50%">
                                            <a class="nav-link" id="img1-tab" data-toggle="tab" href="#img1" role="tab" aria-selected="false" style="height: 200px"><img
                                                    src="${pr.productdetails[1].img}" alt="" style="width: 100%; height: 100%; object-fit: contain"></a>
                                        </li>

                                    </ul>
                                </div>
                            </c:if>            
                            <c:if test="${pr.productdetails.size() > 2}">
                                <div class="shop-thumb-tab mb-30">
                                    <ul class="nav product-slider-2 owl-carousel" id="myTab2" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="img0-tab" data-toggle="tab" role="tab" aria-selected="true" onclick="document.getElementById('show-img0').src = '${fn:replace(pr.productdetails[0].img, '\\', '/')}'" style="height: 200px">
                                                <img src="${pr.productdetails[0].img}" alt="" style="width: 100%; height: 100%; object-fit: contain"> </a>
                                        </li>
                                        <c:forEach var="prd" items="${pr.productdetails}" begin="1" end="${pr.productdetails.size() - 1}" varStatus="loop">
                                            <li class="nav-item">
                                                <a class="nav-link" id="img${loop.count}-tab" data-toggle="tab" role="tab" aria-selected="false" onclick="document.getElementById('show-img0').src = '${fn:replace(prd.img, '\\', '/')}'" style="height: 200px"><img
                                                        src="${prd.img}" alt="" style="width: 100%; height: 100%; object-fit: contain"></a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:if>
                        </div>
                        <div class="col-xl-6 col-lg-8">
                            <div class="product-details mb-30 pl-30">
                                <div class="details-cat mb-20">
                                    <a href="SearchProduct?cate=${pr.shopCategory.maincategory.id}">${pr.shopCategory.maincategory.name} > </a>
                                    <a href="ShopDetail?id=${pr.shop_id}#cate${pr.scate_id}">${pr.shopCategory.name}</a>
                                </div>
                                <h2 class="pro-details-title mb-15">${pr.name}</h2>
                                <div class="details-price mb-20">

                                    <!--<span class="old-price">$246.00</span>-->
                                </div>
                                <div class="product-variant" >
                                    <div class="product-desc variant-item" style="display: flex;">
                                        <ul class="recent-posts" style="width: 70%">
                                            <li>
                                                <div class="widget-posts-image">
                                                    <a href="ShopDetail?id=${pr.shop_id}">
                                                        <img src='${pr.shop.shop_img}' alt=''>
                                                    </a>
                                                </div>
                                                <div class="widget-posts-body">
                                                    <a href="ShopDetail?id=${pr.shop_id}"><h6 class="widget-posts-title" style="font-weight: bold;">${pr.shop.shop_name}</h6></a>
                                                    <h7>Địa chỉ:<span style="color: #fe4536;"> ${pr.shop.users.address}</span></h7>
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
                                                    border: 2px solid #ecedff;">Xem Shop</button>
                                        </div>

                                    </div>
                                    <div class="product-info-list variant-item">
                                        <ul>
                                            <li class="side-pro-rating">
                                                <div><span class="stars-container stars-${sessionScope.aver_rate}">★★★★★ </span>
                                                    <b style="font-size: 18px;"> ${sessionScope.aver_rate/100}</b> - (${sessionScope.ratings_by_product.size()} đánh giá)
                                                </div>
                                            </li>
                                            <li><span>Stock:</span> <span class="in-stock"></span></li>
                                        </ul>
                                    </div>

                                    <div class="product-action-details variant-item">
                                        <div class="mb-20" style="display: flex;">
                                            <div class="variant-name" style="width: 21%;">
                                                <span style="font-family: 'Montserrat', sans-serif;">phân loại</span>
                                            </div>
                                            <ul class="shop-link shop-size">
                                                <li class="classes active" id="${pr.productdetails[0].id}"><input type="button" value="${pr.productdetails[0].name}" onclick="changeType(this);checkShow('${fn:replace(pr.productdetails[0].img, '\\', '/')}', '${pr.productdetails[0].price}', '${pr.productdetails[0].quantity}')" style="word-wrap: break-word"> </li>
                                                    <c:if test="${pr.productdetails.size() > 1}">
                                                        <c:forEach var="pl" items="${pr.productdetails}" begin="1" end="${pr.productdetails.size() - 1}">
                                                        <li class="classes" id="${pl.id}"><input type="button" value="${pl.name}" onclick="changeType(this);checkShow('${fn:replace(pl.img, '\\', '/')}', '${pl.price}', '${pl.quantity}')" style="word-wrap: break-word"></li>
                                                        </c:forEach>
                                                    </c:if>
                                            </ul>
                                        </div>
                                        <div class="product-details-action">

                                            <div class="plus-minus">
                                                <div class="cart-plus-minus">
                                                    <!-- Input field for quantity -->
                                                    <input type="number" id="quantityInput" value="1" min="1" />
                                                </div>
                                            </div>
                                            <div class="details-cart mt-40" style="font-family: 'Montserrat', sans-serif;">
                                                <!-- Button to add to cart -->
                                                <button class="btn theme-btn" onclick="addToCart(document.getElementsByClassName('classes active')[0].id)">Thêm vào giỏ hàng</button>
                                                <button class="btn theme-btn" onclick="location.href = '#'">Mua ngay</button>
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
                                            <p style="font-size: 20px">${pr.description}</p>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="profile6" role="tabpanel" aria-labelledby="profile-tab6">
                                        <div class="desc-text review-text" style="max-height: 500px; overflow-y: scroll;">
                                            <div class="product-commnets">
                                                <c:if test="${sessionScope.ratings_by_product == null || empty sessionScope.ratings_by_product}">
                                                    Chưa có đánh giá nào.
                                                </c:if>
                                                <c:forEach var="rating" items="${sessionScope.ratings_by_product}">
                                                    <div class="product-commnets-list mb-25 pb-15" style="border-bottom: 2px solid #eaedff;">
                                                        <div class="pro-comments-img">
                                                            <img src="${rating.orderdetail.order.customer.img}" alt="" style="border-radius: 50%; height: 80px; width: 80px; ; object-fit: cover">
                                                        </div>
                                                        <div class="pro-commnets-text">
                                                            <h4 style="font-size: 17px; font-weight: bold;">${rating.orderdetail.order.customer.username} -
                                                                <span style="font-size: 14px;"><fmt:formatDate type = "date" value = "${rating.time_stamp}" /></span>
                                                            </h4>
                                                            <div class="pro-rating">
                                                                <div><span class="stars-container stars-${rating.score * 100}">★★★★★ </span>
                                                                </div>
                                                                <p style="font-size: 15px;">${rating.comment}</p>
                                                            </div>
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
                                                            <div class="product-img mb-25" style="height: 350px;">
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
                                                                    <a href="ProductDetail?product=${pr.product_id}">${pr.name}</a>
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
                                    </div>

                                </div>
                            </div>
                        </c:if>
                        <c:if test="${product_by_shop.size() > 2}">
                            <div class="product-slider-2 owl-carousel">
                                <c:forEach var="prs" items="${product_by_shop}">
                                    <div class="pro-item">
                                        <div class="product-wrapper">
                                            <div class="product-img mb-25" style="height: 350px;">
                                                <a href="ProductDetail?product=${prs.product_id}">
                                                    <img src="${prs.productdetails[0].img}" alt="">
                                                </a>
                                                <div class="product-action text-center">
                                                    <a href="AddToCart?id=${prs.productdetails[0].id}" title="Thêm vào giỏ hàng">
                                                        <i class="flaticon-shopping-cart"></i>
                                                    </a>
                                                    <a href="ProductDetail?product=${prs.product_id}" title="Xem chi tiết">
                                                        <i class="flaticon-eye"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <div class="pro-cat mb-10">
                                                    <a href="SearchProduct?cate=${prs.shopCategory.maincategory.id}">${prs.shopCategory.maincategory.name} > </a>
                                                    <a href="#" style="color: #525470">${prs.shopCategory.name}</a>
                                                </div>
                                                <h4>
                                                    <a href="ProductDetail?product=${prs.product_id}">${prs.name}</a>
                                                </h4>
                                                <div class="product-meta">
                                                    <div class="pro-price">
                                                        <c:set var="max" value="${prs.productdetails[prs.productdetails.size() - 1].price}"/>
                                                        <c:if test="${(prs.productdetails.size() == 1) || (prs.productdetails.size() > 1 && prs.productdetails[0].price == prs.productdetails[prs.productdetails.size() - 1].price)}">
                                                            <span><fmt:formatNumber value="${prs.productdetails[0].price}"/>đ</span>
                                                        </c:if>
                                                        <c:if test="${prs.productdetails.size() > 1 && prs.productdetails[0].price != prs.productdetails[prs.productdetails.size() - 1].price}">
                                                            <span><fmt:formatNumber value="${prs.productdetails[0].price}"/>đ - <fmt:formatNumber value="${max}"/>đ</span>
                                                        </c:if>
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
        </main>
        <jsp:include page="footer.jsp"></jsp:include>


        <script>
            function addToCart(productId) {
                // Get the quantity from the input field
                var quantity = document.getElementById("quantityInput").value;

                // Construct the URL with productId and quantity
                var url = 'AddToCart?id=' + productId + '&quantity=' + quantity;

                // Redirect to the URL
                window.location.href = url;
            }
            
            var gid;

            function changeType(pl) {
                gid = $(pl).closest('li').attr('id');
                if (!$("#" + gid).hasClass("active")) {
                    $("#" + gid).addClass("active");
                    $(".classes:not(#" + gid + ")").removeClass("active");
                }
            }

            function checkShow(img, prce, qtt) {
                let rimg = img.replace("\\", "/");
                var pri = new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                });
                document.getElementById("show-img0").src = rimg;
                document.getElementsByClassName("details-price")[0].innerHTML = "<span>" + pri.format(prce) + "</span>";
                document.getElementsByClassName("in-stock")[0].innerHTML = qtt + " có sẵn";
            }
        </script>


    </body>
</html>
