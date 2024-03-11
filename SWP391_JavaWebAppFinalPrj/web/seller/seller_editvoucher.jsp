<%-- 
    Document   : seller_createvoucher
    Created on : 01-Mar-2024, 11:06:50
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>EditVoucher</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.html">
        <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/owl.carousel.min.css">
        <link rel="stylesheet" href="../css/animate.min.css">
        <link rel="stylesheet" href="../css/magnific-popup.css">
        <link rel="stylesheet" href="../css/fontawesome-all.min.css">
        <link rel="stylesheet" href="../css/flaticon.css">
        <link rel="stylesheet" href="../css/meanmenu.css">
        <link rel="stylesheet" href="../css/jquery-ui.css">
        <link rel="stylesheet" href="../css/meanmenu.css">
        <link rel="stylesheet" href="../css/slick.css">
        <link rel="stylesheet" href="../css/default.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/responsive.css">
    </head>
    <body>
        <jsp:useBean id="voucher" scope="request" class="model.Voucher" />
        <!-- header start -->
        <jsp:include page="../header.jsp"></jsp:include>
            <!-- header end -->
            <main>
                <div class="container mt-5">
                    <form action="sellersvouchercontroller" method="post">
                        <input type="hidden" id ="act" name="act" value="edit">
                        <input type="hidden" id ="voucher_id" name="voucher_id" value="${voucher.voucher_id}">
                    <div class="form-row justify-content-center">
                        <div class="form-group col-md-6">
                            <label for="voucher_type">Loại mã</label>
                            <select class="form-control" id="voucher_type" name="voucher_type">
                                <option value="1" ${voucher.type == 1 ? 'selected' : ''}>Voucher toàn shop</option>
                                <option value="2" ${voucher.type == 2 ? 'selected' : ''}>Voucher sản phẩm</option>
                            </select>

                        </div>
                    </div>

                    <div class="form-row justify-content-center">
                        <div class="form-group col-md-6">
                            <label for="voucher_code">Mã Voucher</label>
                            <input type="text" class="form-control" id="voucher_code" name="voucher_code" value="${voucher.code.substring(2)}">
                        </div>
                    </div>

                    <div class="form-row justify-content-center">
                        <div class="form-group col-md-6">
                            <label for="time">Thời gian sử dụng</label>
                            <div class="input-group">
                                <input type="date" class="form-control" id="start_date" name="start_date" value="${voucher.start_date}">
                                <div class="input-group-append">
                                    <span class="input-group-text">đến</span>
                                </div>
                                <input type="date" class="form-control" id="expire_date" name="expire_date" value="${voucher.expired_date}">
                            </div>
                        </div>
                    </div>

                    <div class="form-row justify-content-center">
                        <div class="form-group col-md-2">
                            <label for="promotion_type">Loại giảm giá</label>
                            <select class="form-control" id="promotion_type" name="promotion_type">
                                <option value="Mv">Giảm tiền trực tiếp</option>
                                <option value="Pv">Giảm theo phần trăm</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="discount_amount">Mức giảm</label>
                            <input type="text" class="form-control" id="discount_amount" name="discount_amount" value="${voucher.discount_amount}">
                        </div>
                    </div>

                    <div class="form-row justify-content-center">
                        <div class="form-group col-md-6">
                            <label for="min_require">Giá trị đơn hàng tối thiểu</label>
                            <input type="text" class="form-control" id="min_require" name="min_require" value="${voucher.min_require}">
                        </div>
                    </div>

                    <div class="form-row justify-content-center">
                        <div class="form-group col-md-6">
                            <label for="use_count">Tổng lượt sử dụng tối đa</label>
                            <input type="text" class="form-control" id="use_count" name="use_count" value="${voucher.use_count}">
                        </div>
                    </div>

                    <div class="form-row justify-content-center">
                        <div class="form-group col-md-6">
                            <label for="description">Mô tả</label>
                            <input type="text" class="form-control" id="description" name="description" value="${voucher.description}">
                        </div>
                    </div>

                    <div class="form-row justify-content-center">
                        <div class="form-group col-md-6">
                            <label for="product_applied">Sản phẩm được áp dụng</label>
                            <select class="form-control" id="product_applied" name="product_applied">
                                <!-- Add options here -->
                            </select>
                        </div>
                    </div>

                    <div class="form-row justify-content-center">
                        <a href="sellersvouchercontroller" class="btn btn-secondary mr-2">Hủy</a>
                        <button type="submit" class="btn btn-primary">Sửa</button>
                    </div>
                </form>
            </div>
        </main>

        <!-- footer start -->
        <jsp:include page="../footer.jsp"></jsp:include>
        <!-- footer end -->



        <!-- JS here -->
        <script src="../js/vendor/jquery-1.12.4.min.js"></script>
        <script src="../js/jquery-ui.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/owl.carousel.min.js"></script>
        <script src="../js/isotope.pkgd.min.js"></script>
        <script src="../js/slick.min.js"></script>
        <script src="../js/jquery.meanmenu.min.js"></script>
        <script src="../js/ajax-form.js"></script>
        <script src="../js/wow.min.js"></script>
        <script src="../js/jquery.scrollUp.min.js"></script>
        <script src="../js/jquery.final-countdown.min.js"></script>
        <script src="../js/imagesloaded.pkgd.min.js"></script>
        <script src="../js/jquery.magnific-popup.min.js"></script>
        <script src="../js/plugins.js"></script>
        <script src="../js/main.js"></script>
    </body>
</html>
