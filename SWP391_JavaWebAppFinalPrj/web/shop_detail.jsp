<%-- 
    Document   : shop_detail
    Created on : Mar 5, 2024, 11:23:40 AM
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
        <style>
            .popup-message{
                background: rgba(0, 0, 0, 0.5);
                position: absolute;
                z-index: 999;
                top: 35%;
                width: 20%;
                margin-left: 40%;
                height: 25%;
                transition: all 2s ease-in-out;
            }
            .popup-message h4{

                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                color: #fff;
                margin-left: 23%;
            }
        </style>
    </head>
    <body onload='success_message()'>
        <jsp:include page="header.jsp"></jsp:include>
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
                <section class="shop-details-area pt-50 pb-100" >
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-3 col-lg-3">
                                <div class="product-details-img mb-10">
                                    <div class="tab-content" id="myTabContentpro">
                                        <div class="tab-pane fade show active" id="home" role="tabpanel">
                                            <div class="product-large-img">
                                                <img src="${sh.shopImg}" style="border-radius: 50%;" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-9">
                            <div style="width: 850px">
                                <h2 class="pro-details-title mb-15" style="display: inline-block; width: 96%">${sh.shopName}</h2>

                                <a class="search-trigger" href="#"><i class="fa fa-flag" style="display: inline-block; font-size: 25px; color: #fe4536;" title="Tố cáo người dùng này"></i></a>

                            </div>
                            <div class="product-variant" >
                                <div class="product-info-list variant-item" style="font-size: 15px">
                                    <ul>
                                        <li>Địa chỉ: ${sh.user.address}</li>
                                        <li>
                                            <i class="fa fa-hand-peace" style="color:#FE4536;"></i> ${productDao.getProductsByShop(sh.user.userID).size()} sản phẩm<span style="width: 70px"></span>
                                            <span style="width: 150px"><i class="fa fa-comment-alt" style="color:#FE4536;"></i><a href="Chat"> Chat với Shop</a></span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="product-desc variant-item">
                                    <p>${sh.description}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-30">
                        <div class="col-xl-12 col-lg-12">
                            <div class="product-review">
                                <ul class="nav review-tab" id="myTabproduct" style="font-family: 'Montserrat', sans-serif;" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="all-tab" data-toggle="tab" href="#all" role="tab" aria-controls="all"
                                           aria-selected="true">Tất cả</a>
                                    </li>
                                    <c:forEach var="scate" items="${sessionScope.cate_shop}" varStatus="count">
                                        <li class="nav-item">
                                            <a class="nav-link" id="cate-tab${scate.categoryID}" data-toggle="tab" href="#cate${scate.categoryID}" role="tab" aria-controls="${scate.categoryID}"
                                               aria-selected="false">${scate.categoryName}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                                <div class="tab-content" id="myTabContent2">
                                    <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
                                        <c:set var="plist" value="${sessionScope.product_by_shop}"/>
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
                                                                    <a href="ProductDetail?product=${pr.productID}">
                                                                        <img src="${pr.productImg}" alt="">
                                                                    </a>
                                                                    <div class="product-action text-center">
                                                                        <a href="AddToCart?id=${pr.productID}" title="Thêm vào giỏ hàng">
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
                                                                        <a class="" href="#" style="color: #525470">${pr.sCate.categoryName}</a>
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
                                        </c:if>
                                    </div>
                                    <c:forEach var="cate" items="${sessionScope.cate_shop}">
                                        <div class="tab-pane fade" id="cate${cate.categoryID}" role="tabpanel" aria-labelledby="cate-tab${cate.categoryID}">
                                            <c:set var="sclist" value="${productDao.getProductsByShopCateId(cate.categoryID)}"/>
                                            <c:if test="${sclist == null || sclist.isEmpty()}">
                                                <div>
                                                    <h5>Chưa có sản phẩm nào.</h5>
                                                </div>
                                            </c:if>
                                            <c:if test="${sclist != null}">
                                                <div class="tab-content" id="myTabContent">
                                                    <div class="row">
                                                        <c:forEach var="sc" items="${sclist}">
                                                            <div class="col-lg-3 col-md-3">
                                                                <div class="product-wrapper mb-50">
                                                                    <div class="product-img mb-25">
                                                                        <a href="ProductDetail?product=${sc.productID}">
                                                                            <img src="${sc.productImg}" alt="">
                                                                        </a>
                                                                        <div class="product-action text-center">
                                                                            <a href="AddToCart?id=${sc.productID}" title="Thêm vào giỏ hàng">
                                                                                <i class="flaticon-shopping-cart"></i>
                                                                            </a>
                                                                            <a href="ProductDetail?product=${sc.productID}" title="Xem chi tiết">
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
                                                                            <a href="SearchProduct?cate=${sc.mCate.categoryID}">${sc.mCate.categoryName} > </a>
                                                                            <a href="#" style="color: #525470">${sc.sCate.categoryName}</a>
                                                                        </div>
                                                                        <h4>
                                                                            <a href="ProductDetail?product=${sc.productID}">${sc.productName}</a>
                                                                        </h4>
                                                                        <div class="product-meta">
                                                                            <div class="pro-price">
                                                                                <span><fmt:formatNumber value="${sc.price}"/>đ</span>
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
            <div class="search-wrap" style="background: rgba(0,0,0,.6);">
                <div class="search-inner">
                    <i class="fas fa-times search-close" id="search-close"></i>
                    <div class="search-cell" style="background: #FFF; width: 45%; margin-left: 27%; height: 66%; border-radius: 5px">
                        <div class="basic-login" style="border: 0; padding: 50px 70px;">
                            <h3 class="text-center" style="border-bottom: 1px solid #e5e5e5; padding-bottom: 10px; margin-bottom: 40px">Tố cáo người dùng này</h3>
                            <form method="post" action="ReportUser?id=${sh.user.userID}">
                                <table width="550" height="300">
                                    <tr>
                                        <td style="width: 100%"><span style="color:red;">**</span>Chọn lý do</td>
                                        <td>
                                            <input type="radio" name="reason" id="rs1" value="Người bán có đăng sản phẩm cấm" style="width: 10px; height: 10px; margin-bottom: 0; display: inline-block" required="">
                                            <label for="rs1" style=" display: inline-block">Người bán có đăng sản phẩm cấm</label><br>
                                            <input type="radio" name="reason" id="rs2" value="Người bán có dấu hiệu lừa đảo" style="width: 10px; height: 10px; margin-bottom: 0; display: inline-block">
                                            <label for="rs2" style=" display: inline-block">Người bán có dấu hiệu lừa đảo</label><br>
                                            <input type="radio" name="reason" id="rs3" value="Người bán phát tán nội dung không lịch sự" style="width: 10px; height: 10px; margin-bottom: 0; display: inline-block">
                                            <label for="rs3" style=" display: inline-block">Người bán phát tán nội dung không lịch sự</label><br>
                                            <input type="radio" name="reason" id="rs6" value="Vi phạm quyền riêng tư" style="width: 10px; height: 10px; margin-bottom: 0; display: inline-block">
                                            <label for="rs6" style=" display: inline-block">Vi phạm quyền riêng tư</label><br>
                                            <input type="radio" name="reason" id="rs7" value="Khác" style="width: 10px; height: 10px; margin-bottom: 0; display: inline-block">
                                            <label for="rs7" style=" display: inline-block">Khác</label><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span style="color:red;"> </span>Mô tả</td>
                                        <td><textarea id="detail" name="detail" rows="3" cols="50" style="border: 2px solid #eaedff; margin-top: 10px"></textarea></td>
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
            <c:if test="${requestScope.success != null}">
                <div id="success" class="popup-message" data-animation="jump" data-animation-speed="fast">
                    <h4>Gửi thành công!</h4>
                </div>
            </c:if>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
        <script>
            $(".search-trigger, .basic-login").on('click', function (e) {

                e.stopPropagation();

            });

            function success_message() {
                setTimeout(function () {
                    document.getElementById("success").style.display = "none";
                }, 2000);
            }
        </script>
    </body>
</html>
