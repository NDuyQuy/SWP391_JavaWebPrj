<%-- 
    Document   : AdminAddVoucher
    Created on : Mar 19, 2024, 2:36:32 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade</title>
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

        <!-- header start -->
        <jsp:include page="../header.jsp"></jsp:include>
            <!-- header end -->
            <main>
                <div class="container mt-5">
                    <form action="AdminServlet?Action=AddNewVoucher" method="post">
                        <input type="hidden" id ="voucher_id" name="voucher_id" value="-1">
                        

                        <div class="form-row justify-content-center">
                            <div class="form-group col-md-6">
                                <label for="voucher_code">Mã Voucher</label>
                                <input type="text" class="form-control" id="voucher_code" name="voucher_code" required>
                            </div>
                        </div>

                        <div class="form-row justify-content-center">
                            <div class="form-group col-md-6">
                                <label for="time">Thời gian sử dụng</label>
                                <div class="input-group">
                                    <input type="date" class="form-control" id="start_date" name="start_date" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text">đến</span>
                                    </div>
                                    <input type="date" class="form-control" id="expire_date" name="expire_date" required>
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
                                <input type="number" class="form-control" id="discount_amount" name="discount_amount" required>
                            </div>
                        </div>

                        <div class="form-row justify-content-center">
                            <div class="form-group col-md-6">
                                <label for="min_require">Giá trị đơn hàng tối thiểu</label>
                                <input type="number" class="form-control" id="min_require" name="min_require" required>
                            </div>
                        </div>

                        <div class="form-row justify-content-center">
                            <div class="form-group col-md-6">
                                <label for="use_count">Tổng lượt sử dụng tối đa</label>
                                <input type="number" class="form-control" id="use_count" name="use_count" required>
                            </div>
                        </div>

                        <div class="form-row justify-content-center">
                            <div class="form-group col-md-6">
                                <label for="description">Mô tả</label>
                                <input type="text" class="form-control" id="description" name="description" required>
                            </div>
                        </div>

                        <div class="form-row justify-content-center">
                            <a href="AdminVoucher.jsp" class="btn btn-secondary mr-2">Hủy</a>
                            <button type="submit" class="btn btn-primary">Tạo</button>
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