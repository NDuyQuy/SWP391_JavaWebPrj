<%-- 
    Document   : custom_checkout
    Created on : 03-Apr-2024, 17:43:56
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <style>
            /* Center the form */
            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 10px;
            }

            .container > form
            {
                margin: 0px 10px;
                background-color: #fcc39b;
                padding: 5px 30px;
                border-radius: 10px;
            }
            /* Add space between rows */
            .form-row {
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="user" scope="session" class="model.Users" />
        <jsp:useBean id="orderInfo" scope="request" class="model.CustomOrder" />
        <main>
            <div class="container">
                <form id="checkoutForm" class="w-50" action="CustomOrderAcc" method="POST">
                    <input type="hidden" name="c_id" value="${user.id}">
                    <input type="hidden" name="o_id" value="${orderInfo.order.order_id}">
                    <h2 class="text-center">Thông tin nhận hàng</h2>
                    <div class="form-row">
                        <label for="name">Tên người nhận:</label>
                        <input type="text" class="form-control" id="name" name="name" value="${user.fullname}" required>
                    </div>
                    <div class="form-row">
                        <label for="phone">Số điện thoại:</label>
                        <input type="tel" class="form-control" id="phone" name="phone" value="${user.phone}" required>
                    </div>
                    <div class="form-row">
                        <label for="address">Địa chỉ:</label>
                        <input type="text" class="form-control" id="address" name="addr" value="${user.address}" required>
                    </div>
                    <h2 class="text-center">Thông tin đơn hàng</h2>
                    <div class="form-row">
                        <label for="productName">Tên sản phẩm:</label>
                        <input type="text" class="form-control" id="productName" name="productName" value="${orderInfo.product_name}" readonly>
                    </div>
                    <div class="form-row">
                        <label for="expectedDate">Ngày hoàn thành dự kiến:</label>
                        <input type="date" class="form-control" id="expectedDate" name="expectedDate" value="${orderInfo.expected_complete_date}" readonly>
                    </div>
                    <div class="form-row">
                        <label for="price">Giá sản phẩm:</label>
                        <input type="text" class="form-control" id="pprice" name="pprice" value="${orderInfo.order.total}" readonly>
                        <input type="hidden" id="price" name="price" value="${orderInfo.order.total}" disabled readonly>
                    </div>
                    <div class="form-row">
                        <label for="paymentMethod">Phương thức thanh toán:</label>
                        <select class="form-control" id="paymentMethod" name="paymentMethod">
                            <option value="onlineBanking">Online Banking</option>
                        </select>
                    </div>
                    <div class="form-row">
                        <label for="shippingMethod">Phương thức vận chuyển:</label>
                        <select class="form-control" id="shippingMethod" name="shipCost">
                            <option value="10000">Nhanh</option>
                            <option value="20000">Hỏa tốc</option>
                            <option value="5000">Tiết kiệm</option>
                        </select>
                    </div>
                    <div class="form-row">
                        <label for="shippingPrice">Phí vận chuyển:</label>
                        <input type="text" class="form-control" id="shippingPrice" name="shippingPrice" readonly>
                    </div>
                    <div class="form-row">
                        <label for="totalPrice">Tổng giá trị đơn hàng:</label>
                        <input type="text" class="form-control" id="total" name="total" readonly>
                        <input type="hidden" id="totalPrice" name="totalPrice" value="" readonly>
                    </div>

                    <div class="form-row justify-content-center">
                        <button type="submit" class="btn btn-primary">Xác nhận</button>
                        <a href="Home" class="btn btn-secondary mx-3">Hủy</a>
                    </div>
                </form>
            </div>
        </main>

        <!-- Bootstrap JS (Optional) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                // Calculate shipping price and total price when the page loads
                calculatePrices();

                // Calculate shipping price and total price when the shipping method changes
                $('#shippingMethod').change(function () {
                    calculatePrices();
                });

                // Function to calculate shipping price and total price
                function calculatePrices() {
                    var shippingPrice = parseFloat($('#shippingMethod').val());
                    var productPrice = parseFloat($('#price').val());
                    var totalPrice = shippingPrice + productPrice;
                    
                    $('#totalPrice').val(totalPrice);
                    
                    $('#pprice').val(formatCurrency(productPrice));
                    $('#shippingPrice').val(formatCurrency(shippingPrice));
                    $('#total').val(formatCurrency(totalPrice));
                }

                // Function to format currency
                function formatCurrency(amount) {
                    return amount.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                }
            });
        </script>
    </body>
</html>
