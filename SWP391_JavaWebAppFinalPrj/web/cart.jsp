<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="model.CartDetail" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.UsersDao" %>
<%@ page import="model.Users" %>

<html class="no-js" lang="zxx">


    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> My Shopping Cart</title>
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
    </head>
    <body>

        <jsp:include page="header.jsp"></jsp:include>
        <main>
            <!-- breadcrumb-area-start -->
            <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="breadcrumb-text text-center">
                                <h1>Shoping Cart</h1>
                                <ul class="breadcrumb-menu">
                                    <li><a href="Home">home</a></li>
                                    <li><span>Cart</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- breadcrumb-area-end -->
            
            <!-- Cart Area Start -->
            <section class="cart-area pt-100 pb-100">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <form id="checkoutForm" action="Cart" method="post">
                                <input type="hidden" id="selectedItemsInput" name="selectedProductIds" />
                                <div class="table-content table-responsive">
                                    <table class="table table-bordered" >
                                        <tbody>
                                            <jsp:useBean id="cartGroup" class="java.util.HashMap" scope="request" />
                                            <c:forEach var="entry" items="${cartGroup}">
                                                <tr>
                                                    <td colspan="7" class="shop-name text-left" style="background: #CCC"><b>${entry.key}</b></td>
                                                </tr>
                                                <tr>
                                                    <th class="product-checkbox"></th>
                                                    <th class="product-thumbnail">Images</th>
                                                    <th class="cart-product-name">Product</th>
                                                    <th class="product-price">Unit Price</th>
                                                    <th class="product-quantity">Quantity</th>
                                                    <th class="product-subtotal">Total</th>
                                                    <th class="product-remove">Remove</th>
                                                </tr>
                                                <c:set var="totalPrice" value="0" /> 
                                                <!-- Iterate over the ArrayList values for the current key -->
                                                <c:forEach var="value" items="${entry.value}">
                                                    <tr onclick="chooseProduct()">
                                                        <!-- Display the values in each row -->
                                                        <td class="product-checkbox">
                                                            <input type="checkbox" class="itemCheckbox" data-product-id="${value.product.product_id}"/>
                                                        </td>
                                                        <td class="product-thumbnail">
                                                            <a href="#"><img src="${value.product.img}/1.jpg" alt=""></a>
                                                        </td>
                                                        <td class="product-name">
                                                            <a href="#">${value.product.name}</a>
                                                        </td>
                                                        <td class="product-price">
                                                            <span class="amount">${value.product.money}</span>
                                                        </td>
                                                        <td class="product-quantity">
                                                            <a href="UpdateQuantityServlet?id=${value.product.product_id}&quantity=${value.quantity + 1}"><b style="color: blue">+</b></a>
                                                            <input class="text-center"type="number" name="quantity" value="${value.quantity}" data-product-id="${value.product.product_id}"
                                                                   min="0" max="${value.product.quantity}" onkeypress="updateQuantityOnEnter(event)">
                                                            <buton><a href="UpdateQuantityServlet?id=${value.product.product_id}&quantity=${value.quantity - 1}"><b style="color: blue">-</b></a>
                                                        </td>
                                                    <td class="product-subtotal">
                                                        <span class="amount">${value.product.money * value.quantity}</span>
                                                    </td>
                                                    <td class="product-remove">
                                                        <a class="btn btn-danger btn-sm"href="UpdateQuantityServlet?id=${value.product.product_id}&action=remove">X</a>
                                                    </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:forEach>
                                            </tbody>

                                    </table>
                                </div>

                                <div class="row">
                                    <div class="col-md-5 ml-auto">
                                        <div class="cart-page-total">
                                            <h2>Cart totals</h2>
                                            <ul class="mb-20">
                                                <li>Total <span id="totalPrice">0.00</span></li>
                                            </ul>
                                            <a class="btn theme-btn" onclick="proceedToCheckout()">Proceed to checkout</a>
                                        </div>
                                    </div>
                                </div>

                            </form>

                        </div>
                    </div>

                </div>
            </section>
            <!-- Cart Area End-->

        </main>
        <jsp:include page="footer.jsp"></jsp:include>
        <script>
            function chooseProduct(){
                var checkbox = document.getElementById("");
            }
            function updateTotal() {
                var total = 0;
                var checkboxes = document.getElementsByClassName('itemCheckbox');

                for (var i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].checked) {
                        var row = checkboxes[i].closest('tr');
                        var subtotal = parseFloat(row.querySelector('.product-subtotal .amount').innerText);
                        total += subtotal;
                    }
                }

                document.getElementById('totalPrice').innerText = total.toFixed(2);
            }
            // Gọi hàm khi trang được tải   
            window.onload = updateTotal;
            // Gán hàm cho sự kiện click của checkbox
            var checkboxes = document.getElementsByClassName('itemCheckbox');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].addEventListener('click', updateTotal);
            }

            function proceedToCheckout() {
                var selectedItems = [];

                var checkboxes = document.getElementsByClassName('itemCheckbox');
                for (var i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].checked) {
                        var productId = checkboxes[i].getAttribute('data-product-id');
                        selectedItems.push(productId);
                    }
                }

                if (selectedItems.length > 0) {
                    document.getElementById('selectedItemsInput').value = selectedItems.join(',');
                    document.getElementById('checkoutForm').submit();
                } else {
                    alert("Please select at least one item before proceeding to checkout.");
                }
            }
            function updateQuantityOnEnter(event) {
                if (event.key === 'Enter') {
                    event.preventDefault();

                    var productId = event.target.getAttribute('data-product-id');
                    var newQuantity = event.target.value;

                    // Gửi yêu cầu cập nhật số lượng mới đến servlet
                    window.location.href = "UpdateQuantityServlet?id=" + productId + "&quantity=" + newQuantity;
                }
            }
        </script>
        <!-- JS here -->
        <script src="js/vendor/jquery-1.12.4.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/isotope.pkgd.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/jquery.meanmenu.min.js"></script>
        <script src="js/ajax-form.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/jquery.final-countdown.min.js"></script>
        <script src="js/imagesloaded.pkgd.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

    </body>

    <!-- Mirrored from wphix.com/template/vue/vue/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 21 Oct 2023 08:30:39 GMT -->
</html>