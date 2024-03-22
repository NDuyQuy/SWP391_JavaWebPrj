<%-- 
    Document   : cart
    Created on : Feb 26, 2024, 9:48:59 PM
    Author     : LENOVO
--%>
<%@page import="model.Vouchers"%>
<%@ page import="java.util.List" %>
<%@ page import="model.CartDetail" %>
<%@ page import="model.Products" %>


<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>

<%@ page import="model.Shops" %>
<%@ page import="model.ShopCategory" %>
<%@ page import="model.MainCategory" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
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
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/meanmenu.css">
        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/default.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <link rel="stylesheet" href="css/png.css"/>

        <style>
            .profile-area, .footer-area{
                background-color: #f6f6f6;
            }
            .bottom{
                display: flex;
                flex-direction: row;
                align-items: flex-start;
            }
            .profile-avatar{
                padding-left: 20px;
                overflow: hidden;
                border-left: 1px solid #eaedff;
                justify-content: center;
                display: flex;

            }

            .profile-avatar:nth-child{
                padding-top: 40px;
            }
            .avatar{
                flex-direction: column;
                align-items: center;
                display: flex;
            }
            .bottom{
                margin-top: 20px;
            }
            .cat dd{
                margin-left: 20px;
            }
            .avatar-img{
                width: 100%;
                height: 100%;
                background-position: 50%;
                background-size: cover;
                background-repeat: no-repeat;
                cursor: pointer;
            }
        </style>

    </head>
    <body>
        <jsp:useBean id="user" scope="session" class="model.Users" />

        <!-- Form nhập thông tin người nhận -->
        <h3>Địa Chỉ Nhận Hàng</h3>
        <form action="Checkout" method="post" id="checkoutForm">
            <input type="hidden"  name="receiver_name"  id="receiver_name"   value="${sessionScope.user.fullname}">
            <input type="hidden"  name="receiver_phone" id="receiver_phone" value="${sessionScope.user.phone}">
            <input type="hidden"  name="receiver_addr"  id="receiver_addr"   value="${sessionScope.user.address}">

            <input type="hidden" name="voucherIdStr" id="voucherIdStr" value="">
            <input type="hidden" name="shippingmethodStr" id="shippingmethodStr" value="">
            <table class="table">
                <thead>
                    <tr>
                        <th>Tên</th>
                        <th>Số điện thoại</th>
                        <th>Địa chỉ</th>
                        <th>Chỉnh sửa</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>

                        <td id="fullname"></td>
                        <td id="phone"></td>
                        <td id="address"></td>
                        <td>
                            <button type="button" class="btn btn-primary" id="editInfoBtn">
                                Chỉnh sửa thông tin nhận hàng
                            </button>
                        </td>
                    </tr>

                </tbody>
            </table>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
            <!-- Hiển thị thông tin đơn hàng -->
            <h3>Sản phẩm</h3>
            <table class="table">
                <tbody >
                    <jsp:useBean id="cartGroup" class="java.util.HashMap" scope="session" />

                    <c:forEach var="entry" items="${cartGroup}">

                        <tr>
                            <td colspan="7" class="shop-name">${entry.value.get(0).product.shop.shop_name}</td>
                        </tr>

                        <tr>
                            <td>Hình ảnh</td>
                            <td>Tên sản phẩm</td>
                            <td>Giá của một sản phẩm</td>
                            <td>Số lượng bạn muốn mua</td>
                            <td>Giá tổng sản phẩm</td>
                        </tr>
                        <!-- Initialize totalShopAmount for the current shop -->

                        <c:set var="totalShopAmount"/>
                        <!-- Iterate over the ArrayList values for the current key -->
                        <c:forEach var="value" items="${entry.value}">
                            <tr>
                                <td class="product-thumbnail">
                                    <a href="#"><img src="${value.product.img}" alt=""></a>
                                </td>
                                <td class="product-name">
                                    <a href="#">${value.product.name}</a>
                                </td>
                                <td class="product-price">
                                    <span class="amount">${value.product.money}</span>
                                </td>
                                <td class="product-quantity">
                                    <span class="quantityInput">${value.quantity}</span>
                                </td>
                                <td class="product-subtotal">
                                    <span class="amount">${value.product.money * value.quantity}</span>
                                </td>
                            </tr>
                            <c:set var="totalShopAmount" value="${totalShopAmount + (value.product.money * value.quantity)}" />
                        </c:forEach>
                        <tr>
                            <td colspan="2"></td>
                            <td>Tổng tiền hàng: </td>
                            <td></td>
                            <td class="total-shop-amount">${totalShopAmount}</td> 
                        </tr>

                        <tr>
                            <!--VOUCHER SELECTION START HERE-->
                            <td colspan="2"></td>
                            <td><label for="vouchers">Voucher giảm giá:</label></td>
                            <td>

                                <select id="vouchers" name="shopVoucher" onchange="removeSelectedVoucherFromBelow(this)">
                                    <option data-voucher-id="0">-- Chọn voucher --</option>

                                    <c:forEach var="voucher" items="${entry.key}">
                                        <option class="shop-voucher" value="${voucher.discount_amount}" data-voucher-id="${voucher.voucher_id}">${voucher.code}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>
                                <span class="selectedVoucherAmount"></span>
                            </td>

                        </tr>


                        <tr>
                            <td colspan="2"></td>
                            <td>Chọn phương thức vận chuyển:</td>
                            <td>
                                <select id="shipping_method" name="shipment" onchange="updateShippingCost(this)" required="">
                                    <option disabled value="" disabled selected >-- Chọn phương thức vận chuyển --</option>
                                    <option value="10000">nhanh</option>
                                    <option value="20000">hỏa tốc</option>
                                    <option value="5000">tiết kiệm</option>
                                </select>
                            </td>

                            <td>
                                <span class="selectedShippingCost"></span>
                            </td>

                        <tr>
                            <td colspan="2"></td>
                            <td>Tổng:</td>
                            <td></td>
                            <td><span class="group-total"></span></td> <!-- Display group total -->
                        </tr>

                    </c:forEach>

                </tbody>

            </table>


            <h3>Thông Tin Khác</h3>


            <div class="form-group">
                <label for="paymentMethod">Phương thức thanh toán:</label>
                <select id="paymentMethod" name="paymentMethod">
                    <option value="COD">Thanh toán khi nhận hàng</option>
                    <option value="OnlineBanking">Thanh toán online</option>
                </select>
            </div>


            <div class="form-group">
                <label for="grandTotal">Tổng tiền hàng: </label> <p id="totalAllProducts"></p><br>
            </div>


            <div class="form-group">
                <label for="totalAmount">Tổng thanh toán: </label>
                <input type="text" id="grandTotal" name="grandTotal" value="${grandTotalAmount}" readonly><br><br>
            </div>

            <input type="submit" class="btn btn-danger rounded-pill py-2 btn-block"  value="Đặt hàng"/>
            <a class="btn btn-dark rounded-pill py-2 btn-block white-color" href="Cart">Hủy</a>
        </form>


        <!-- Add a modal for editing user information -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Chỉnh sửa thông tin nhận hàng</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Add a form for editing user information here -->
                        <!-- Populate form fields with default user information -->
                        <form id="editForm">
                            <div class="form-group">
                                <label for="editFullname">Tên:</label>
                                <input type="text" class="form-control" id="editFullname" >
                            </div>
                            <div class="form-group">
                                <label for="editPhone">Số điện thoại:</label>
                                <input type="text" class="form-control" id="editPhone" >
                            </div>
                            <div class="form-group">
                                <label for="editAddress">Địa chỉ:</label>
                                <input type="text" class="form-control" id="editAddress">
                            </div>

                            <button type="button" class="btn btn-primary" id="saveChangesBtn">Lưu thay đổi</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- Bootstrap JS và các phụ thuộc của nó -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


        <script>

                                    function removeSelectedVoucherFromBelow(selectElement) {
                                        var selectedVoucherId = selectElement.value;
// Kiểm tra nếu đã chọn lựa chọn mặc định
                                        if (selectedVoucherId === "") {
                                            // Đặt giá trị của cột selectedVoucherAmount thành 0
                                            var row = selectElement.closest('tr');
                                            var voucherAmountElement = row.querySelector('.selectedVoucherAmount');
                                            voucherAmountElement.innerText = "0";
                                            // Không cần xử lý ẩn voucher nào cả, vì không có voucher nào được chọn
                                            return;
                                        }

                                        // Lặp qua tất cả các hàng trong bảng để ẩn voucher đã chọn ở những hàng khác
                                        var allRows = document.querySelectorAll('tr');
                                        allRows.forEach(function (row) {
                                            var allOptionsBelow = row.querySelectorAll('.shop-voucher');
                                            allOptionsBelow.forEach(function (option) {
                                                if (option.value === selectedVoucherId) {
                                                    // Nếu tìm thấy voucher đã chọn, ẩn nó
                                                    option.style.display = 'none'; // Ẩn voucher đã chọn
                                                } else {
                                                    option.style.display = ''; // Hiển thị lại các voucher khác
                                                }
                                            });
                                        });
                                        // Lặp qua các hàng trong bảng để tìm hàng tương ứng và cập nhật discount_amount của nó
                                        var row = selectElement.closest('tr');
                                        var voucherAmountElement = row.querySelector('.selectedVoucherAmount');
                                        var allOptionsBelow = row.querySelectorAll('.shop-voucher');
                                        allOptionsBelow.forEach(function (option) {
                                            if (option.value === selectedVoucherId) {
                                                // Nếu tìm thấy voucher đã chọn, cập nhật discount_amount và ẩn nó
                                                var selectedVoucherAmount = parseFloat(selectElement.value);
                                                var voucherAmountElement = selectElement.closest('tr').querySelector('.selectedVoucherAmount');
                                                voucherAmountElement.innerText = selectedVoucherAmount;
                                                updateTotal();
                                                option.style.display = 'none'; // Ẩn voucher đã chọn
                                            } else {
                                                option.style.display = ''; // Hiển thị lại các voucher khác
                                            }
                                        });
                                    }

        </script>

        <script>


            function updateShippingCost(selectElement) {
                var selectedShippingCost = parseFloat(selectElement.value);
                // Lặp qua các hàng trong bảng để tìm hàng tương ứng và cập nhật cost của phí vận chuyển
                var row = selectElement.closest('tr');
                var shippingCostElement = row.querySelector('.selectedShippingCost');
                shippingCostElement.innerText = selectedShippingCost;
                updateTotal();
            }

        </script>
        <script>

            // Call the updateTotal function when the page is loaded
            $(document).ready(function () {
                updateTotal();
            });


            function updateTotal() {
                var total = 0;

                // Select all elements containing total shop amounts, selected voucher amounts, and selected shipping costs
                var totalShopAmounts = document.querySelectorAll('.total-shop-amount');
                var selectedVoucherAmounts = document.querySelectorAll('.selectedVoucherAmount');
                var selectedShippingCosts = document.querySelectorAll('.selectedShippingCost');
                var groupTotalElements = document.querySelectorAll('.group-total'); // Elements to display group totals
                var totalAllProducts = 0;



                // Loop through each element and calculate the total
                for (var i = 0; i < totalShopAmounts.length; i++) {

                    var totalShopAmount = parseFloat(totalShopAmounts[i].innerText);
                    var selectedVoucherAmount = parseFloat(selectedVoucherAmounts[i].innerText);
                    var selectedShippingCost = parseFloat(selectedShippingCosts[i].innerText);
                    // Kiểm tra nếu bất kỳ giá trị nào không phải là số, nếu có thì đặt giá trị là 0
                    totalShopAmount = isNaN(totalShopAmount) ? 0 : totalShopAmount;
                    selectedVoucherAmount = isNaN(selectedVoucherAmount) ? 0 : selectedVoucherAmount;
                    selectedShippingCost = isNaN(selectedShippingCost) ? 0 : selectedShippingCost;
                    totalAllProducts += totalShopAmount;
                    // Calculate total for this group
                    var totalForGroup = totalShopAmount - selectedVoucherAmount + selectedShippingCost;
                    if (totalForGroup < 0) {
                        totalForGroup = 0;
                    }
                    // Update the HTML to display the group total
                    groupTotalElements[i].innerText = totalForGroup.toFixed(2);

                    // Add total for this group to overall total
                    total += totalForGroup;
                }
                document.getElementById('totalAllProducts').innerText = totalAllProducts.toFixed(2);

                // Update the overall total in the HTML
                document.getElementById('grandTotal').value = total.toFixed(2);
            }
        </script>

        <script>

            $(document).ready(function () {
                // Lưu thông tin người nhận hàng ban đầu khi trang được tải
                var defaultFullname = "${sessionScope.user.fullname}";
                var defaultPhone = "${sessionScope.user.phone}";
                var defaultAddress = "${sessionScope.user.address}";
                // Hiển thị thông tin người nhận hàng ban đầu trong bảng
                $("#fullname").text(defaultFullname);
                $("#phone").text(defaultPhone);
                $("#address").text(defaultAddress);
                // Show the modal when the edit button is clicked
                $("#editInfoBtn").click(function () {
                    // Populate modal fields with default user information
                    $("#editFullname").val(defaultFullname);
                    $("#editPhone").val(defaultPhone);
                    $("#editAddress").val(defaultAddress);
                    $("#editModal").modal("show");
                });

                $("#saveChangesBtn").click(function () {
                    // Lấy giá trị mới từ các trường nhập liệu trong modal
                    var newFullname = $("#editFullname").val();
                    var newPhone = $("#editPhone").val();
                    var newAddress = $("#editAddress").val();
                    defaultFullname = newFullname;
                    defaultPhone = newPhone;
                    defaultAddress = newAddress;
                    // Cập nhật thông tin người nhận hàng trong bảng thông tin địa chỉ nhận hàng
                    $("#fullname").text(newFullname);
                    $("#phone").text(newPhone);
                    $("#address").text(newAddress);
                    //
                    $('#receiver_name').val(newFullname);
                    $("#receiver_phone").text(newPhone);
                    $("#receiver_addr").text(newAddress);
                    // Ẩn modal
                    $("#editModal").modal("hide");
                });
            });

            //checkoutForm
            //checkoutForm
            $('#checkoutForm').submit(function (event) {
                // Initialize an empty array to store the data-voucher-id values
                var voucherIdsArray = [];
                var shippingArray = [];

                // Get all select elements with the name 'shopVoucher'
                var selectElements = document.getElementsByName('shopVoucher');

                // Iterate over each select element
                for (var i = 0; i < selectElements.length; i++) {
                    var selectElement = selectElements[i];
                    // Get the selected option
                    var selectedOption = selectElement.options[selectElement.selectedIndex];
                    // Get the data-voucher-id attribute value of the selected option
                    var voucherId = selectedOption.getAttribute('data-voucher-id');
                    // Add the voucherId to the array
                    voucherIdsArray.push(voucherId);

                    // Get the selected shipping method
                    var selectedMethod = document.getElementsByName('shipment')[i];
                    var shippingCost = selectedMethod.value;
                    // Add the shipping cost to the array
                    shippingArray.push(shippingCost);
                }

                // Join the array elements into a string separated by commas
                var voucherIdsString = voucherIdsArray.join(',');
                var shippingMethodString = shippingArray.join(',');
                console.log(voucherIdsString);
                console.log(shippingMethodString);
                // Update hidden input fields
                $('#voucherIdStr').val(voucherIdsString);
                $('#shippingmethodStr').val(shippingMethodString);

            });


        </script>

        <script>
            $('#checkoutForm').submit(function (event) {
                // Get the selected value of the shipment dropdown
                var selectedValue = $('#shipping_method').val();

                // Check if the selected value is the default value
                if (selectedValue === "") {
                    // If the default value is selected, prevent form submission
                    event.preventDefault();
                    alert("Vui lòng chọn một phương thức vận chuyển.");
                }
            });


        </script>

    </body>
</html>