<%-- 
    Document   : seller_createvoucher
    Created on : 01-Mar-2024, 11:06:50
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    <body>
        <!-- header start -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- header end -->
            <main>
                <div class="row justify-content-center" style="width: 100%; margin-left: 20%;">
                    <form id="voucher_form" action="sellersvouchercontroller" method="post" style="width: 80%; margin: auto;">
                        <input type="hidden" id ="act" name="act" value="create">
                        <div class="form-row justify-content-center">
                            <div class="form-group col-md-6">
                                <label for="voucher_type">Loại mã</label>
                                <select class="form-control" id="voucher_type" name="voucher_type">
                                    <option value="1">Voucher toàn shop</option>
                                    <option value="2">Voucher sản phẩm</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-row justify-content-center">
                            <div class="form-group col-md-6">
                                <label for="voucher_code">Mã Voucher</label>
                                <input type="text" class="form-control" id="voucher_code" name="voucher_code" maxlength="8" required>
                            </div>
                        </div>

                        <div class="form-row justify-content-center" id="dateFields">
                            <div class="form-group col-md-6">
                                <label for="time">Thời gian sử dụng</label>
                                <div class="input-group">
                                    <input type="date" class="form-control" id="start_date" name="start_date" min="${LocalDate.now()}" required>
                                <div class="input-group-append">
                                    <span class="input-group-text">đến</span>
                                </div>
                                <input type="date" class="form-control" id="expire_date" name="expire_date" min="${LocalDate.now()}" required>
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
                            <input type="text" class="form-control" id="description" name="description" >
                        </div>
                    </div>

                    <div class="form-row justify-content-center">
                        <div class="form-group col-md-6">
                            <label for="product_applied">Sản phẩm được áp dụng</label>
                            <select class="form-control" id="product_applied" name="product_applied">
                                <option value="0">Hãy chọn sản phẩm áp dụng</option>
                                <c:forEach var="p" items="${requestScope.productList}">
                                    <option value="${p.product_id}">${p.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-row justify-content-center">
                        <a href="sellersvouchercontroller" class="btn btn-secondary mr-2">Hủy</a>
                        <button type="submit" class="btn btn-primary">Tạo</button>
                    </div>
                </form>
            </div>
        </main>

        <!-- JS here -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                // Handler for voucher_type change event
                $('#voucher_type').change(function () {
                    var selectedValue = $(this).val();
                    if (selectedValue == 1) {
                        // If Voucher toàn shop is selected, disable the product_applied select box
                        $('#product_applied').prop('disabled', true);
                        // Reset product_applied select box to default option
                        $('#product_applied').val(0);
                    } else if (selectedValue == 2) {
                        // If Voucher sản phẩm is selected, enable the product_applied select box
                        $('#product_applied').prop('disabled', false);
                    }
                });

                // Trigger change event on page load to initially set the state of product_applied select box
                $('#voucher_type').trigger('change');
            });

            $(document).ready(function () {
                $('#voucher_form').submit(function (event) {
                    var voucherType = $('#voucher_type').val();
                    var productApplied = $('#product_applied').val();

                    // If voucher type is 2 and product applied is 0, show an alert and prevent form submission
                    if (voucherType == 2 && productApplied == 0) {
                        alert('Please choose a product for voucher application.');
                        event.preventDefault(); // Prevent form submission
                    }
                });
            });
        </script>
    </body>
</html>