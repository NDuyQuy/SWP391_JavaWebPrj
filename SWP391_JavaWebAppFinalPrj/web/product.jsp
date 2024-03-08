<%-- 
    Document   : product
    Created on : Feb 27, 2024, 8:17:03 AM
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
                                        <li><span>product</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- breadcrumb-area-end -->

                <!-- shop-area start -->
                <section class="shop-area pt-100 pb-100">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-8 col-lg-8">
                                <div class="shop-banner mb-50">
                                    <img src="img/bg/shop-banner.png" alt="">
                                </div>
                                <!-- tab filter -->
                                <div class="row mb-10">
                                    <div class="col-xl-6 col-lg-6 col-md-6">
                                        <div class="product-showing mb-40">
                                        <c:if test="${sessionScope.product_list != null}">
                                            <p style="font-family: 'Open Sans', sans-serif; font-weight: bold;">Đang hiện ${first + 1}–${last + 1} trong ${sessionScope.product_list.size()} kết quả</p>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6">
                                    <div class="shop-tab f-right">
                                        <ul class="nav text-center" id="myTab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
                                                   aria-selected="true"><i class="fas fa-th-large"></i> </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
                                                   aria-selected="false"><i class="fas fa-list-ul"></i></a>
                                            </li>
                                        </ul>
                                    </div>
<!--                                    <div class="pro-filter mb-40 f-right">
                                        <form action="SearchProduct">
                                            <select name="pro-filter" id="pro-filter">
                                                <option value="1">Shop By </option>
                                                <option value="2">New Product </option>
                                                <option value="3">A to Z Product </option>
                                                <option value="4">Z to A Product </option>
                                            </select>
                                        </form>
                                    </div>-->
                                </div>
                            </div>
                            <c:if test="${product_list == null}">
                                <div>
                                    <h5>Không có kết quả tìm kiếm nào.</h5>
                                </div>
                            </c:if>
                            <c:if test="${product_list != null}">
                                <!-- tab content -->
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <c:forEach var="pr" items="${sessionScope.product_list}" begin="${first}" end="${last}">
                                                <div class="col-lg-6 col-md-6">
                                                    <div class="product-wrapper mb-50">
                                                        <div class="product-img mb-25">
                                                            <a href="ProductDetail?product=${pr.productID}">
                                                                <img src="${pr.productImg}" alt="">
                                                            </a>
                                                            <div class="product-action text-center">
                                                                <a href="#" title="Thêm vào giỏ hàng">
                                                                    <i class="flaticon-shopping-cart"></i>
                                                                </a>
                                                                <a href="ProductDetail?product=${pr.productID}" title="Xem chi tiết">
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
                                                                <a href="SearchProduct?cate=${pr.mCate.categoryID}">${pr.mCate.categoryName} > </a>
                                                                <a href="#">${pr.sCate.categoryName}</a>
                                                            </div>
                                                            <h4>
                                                                <a href="ProductDetail?product=${pr.productID}">${pr.productName}</a>
                                                            </h4>
                                                            <div class="product-meta">
                                                                <div class="pro-price">
                                                                    <span><fmt:formatNumber value="${pr.price}"/>đ</span>
                                                                    <!--<span class="old-price">$230.00 USD</span>-->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                        <c:forEach var="pr" items="${sessionScope.product_list}">
                                            <div class="row">
                                                <div class="col-xl-5">
                                                    <div class="product-wrapper mb-30">
                                                        <div class="product-img">
                                                            <a href="ProductDetail?product=${pr.productID}">
                                                                <img src="${pr.productImg}" alt="">
                                                            </a>
                                                            <div class="sale-tag">
                                                                <span class="new">new</span>
                                                                <span class="sale">sale</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-7">
                                                    <div class="product-content pro-list-content pr-0 mb-50">
                                                        <div class="pro-cat mb-10">
                                                            <a href="SearchProduct?cate=${pr.mCate.categoryID}">${pr.mCate.categoryName} > </a>
                                                            <a href="#">${pr.sCate.categoryName}</a>
                                                        </div>
                                                        <h4>
                                                            <a href="ProductDetail?product=${pr.productID}">${pr.productName}</a>
                                                        </h4>
                                                        <div class="product-meta mb-10">
                                                            <div class="pro-price">
                                                                <span><fmt:formatNumber value="${pr.price}"/>đ</span>
                                                                <!--<span class="old-price">$230.00 USD</span>-->
                                                            </div>
                                                        </div>
                                                        <p>${pr.description}</p>
                                                        <div class="product-action">
                                                            <a href="#" title="Thêm vào giỏ hàng">
                                                                <i class="flaticon-shopping-cart"></i>
                                                            </a>
                                                            <a href="ProductDetail?product=${pr.productID}" title="Xem chi tiết">
                                                                <i class="flaticon-eye"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="basic-pagination basic-pagination-2 text-center mt-20">
                                    <ul>
                                        <c:if test="${param.page != null}">
                                            <c:set var="page" value="${param.page}"/>
                                        </c:if>
                                        <c:if test="${param.page == null}">
                                            <c:set var="page" value="${1}"/>
                                        </c:if>
                                        <c:if test="${page > 1}">
                                            <li><a href="SearchProduct?${param.cate != null ? "cate" : "kw"}=${param.cate != null ? param.cate : param.kw}&page=${1}"><i class="fas fa-angle-double-left"></i></a></li>
                                                </c:if>
                                                <c:if test="${page > 1}">
                                            <li><a href="SearchProduct?${param.cate != null ? "cate" : "kw"}=${param.cate != null ? param.cate : param.kw}&page=${page - 1}"><i class="fas fa-angle-left"></i></a></li>
                                                </c:if>
                                        <li class="active"><a href="SearchProduct?${param.cate != null ? "cate" : "kw"}=${param.cate != null ? param.cate : param.kw}&page=${page}">${page}</a></li>
                                            <c:if test="${page < num}">
                                            <li><a href="SearchProduct?${param.cate != null ? "cate" : "kw"}=${param.cate != null ? param.cate : param.kw}&page=${page + 1}"><i class="fas fa-angle-right"></i></a></li>
                                                </c:if>
                                                <c:if test="${page < num}">
                                            <li><a href="SearchProduct?${param.cate != null ? "cate" : "kw"}=${param.cate != null ? param.cate : param.kw}&page=${num}"><i class="fas fa-angle-double-right"></i></a></li>
                                                </c:if>
                                    </ul>
                                </div>
                            </c:if>
                        </div>
                        <div class="col-xl-4 col-lg-4">
                            <div class="sidebar-box">

                                <div class="shop-widget" style="padding-bottom: 70px;">
                                    <h3 class="shop-title">Filter selection</h3>
                                    <form action="PriceFilter?${param.cate != null ? "cate" : "kw"}=${param.cate != null ? param.cate : param.kw}" method="post">
                                        <div class="price-filter">
                                            <div id="slider-range"></div>
                                            <input type="text" id="amount" name="range">
                                        </div>
                                        <button  style="color: #fff;
                                                 position: relative;
                                                 overflow: visible;
                                                 outline: 0;
                                                 background: #ee4d2d;
                                                 height: 40px;
                                                 width: 80px;
                                                 border: 0;
                                                 float: right;
                                                 margin-bottom: 15px;" id="filter-price">
                                            Lọc giá
                                        </button>
                                    </form>
                                </div>

                                <div class="shop-widget">
                                    <h3 class="shop-title">Catergories</h3>
                                    <ul class="shop-link">
                                        <c:forEach var="cate" items="${sessionScope.main_category_list}">
                                            <li><a href="SearchProduct?cate=${cate.categoryID}"><i class="far fa-square"></i> ${cate.categoryName}</a></li>
                                            </c:forEach>
                                    </ul>
                                </div>

                                <div class="shop-widget">
                                    <h3 class="shop-title">Recent View</h3>
                                    <ul class="shop-sidebar-product">
                                        <c:forEach var="pr" items="${sessionScope.recent_list}">
                                            <li>
                                                <div class="side-pro-img">
                                                    <a href="ProductDetail?product=${pr.productID}"><img src="${pr.productImg}" alt=""></a>
                                                </div>
                                                <div class="side-pro-content">
                                                    <div class="side-pro-rating">
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                    </div>
                                                    <h5><a href="ProductDetail?product=${pr.productID}">${pr.productName}</a></h5>
                                                    <div class="side-pro-price">
                                                        <span><fmt:formatNumber value="${pr.price}"/>đ</span>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>

                                <div class="shop-widget">
                                    <div class="shop-sidebar-banner">
                                        <a href="shop.html"><img src="img/banner/shop-banner.jpg" alt=""></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- shop-area end -->
        </main>        

        <jsp:include page="footer.jsp"></jsp:include>

            <script>
                if ($("#slider-range").length) {

                    $("#slider-range").slider({

                        range: true,

                        min: 0,

                        max: ${requestScope.max_price},

                        values: [0, ${requestScope.max_price}],

                        slide: function (event, ui) {

                            $("#amount").val(ui.values[0] + "đ - " + ui.values[1] + "đ");

                        }

                    });

                    $("#filter-price").addEventListener

                    $("#amount").val($("#slider-range").slider("values", 0) +
                            "đ - " + $("#slider-range").slider("values", 1) + "đ");





                    $('#filter-btn').on('click', function () {

                        $('.filter-widget').slideToggle(1000);

                    });



                }
        </script>
    </body>
</html>
