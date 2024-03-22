<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.CartDetail" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.UsersDao" %>
<%@ page import="model.Users" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page import="model.Orders" %>
<%@ page import="model.OrderDetail" %>
<%@ page import="model.Products" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
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
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i,900,900i&amp;subset=vietnamese" rel="stylesheet">
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
        <style>
            .profile-area{

                background: rgba(0, 0, 0, 0.05);
            }

            .bottom{
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                margin-top: 20px;
            }

            .profile-table h5{
                font-weight: bold;
            }

            .profile-table{
                font-size: 15px;
            }

            .empty{
                padding-top: 18%;
                text-align: center;
            }

            .profile-table table img{
                height: 100px;
                width: 100px;
                object-fit: cover;
            }

            table td{
                padding-bottom: 20px;
            }

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

        <jsp:include page="header.jsp"></jsp:include>
            <form id="confirmForm" method="post" style="display: none;">
                <input type="hidden" name="orderId" id="orderIdInput" />
                <input type="hidden" name="newStatus" value="đã nhận" />
            </form>


            <main>
                <section class="profile-area pt-30 pb-45" style="padding-bottom: 280px;">
                    <div class="container">
                        <div class="row">
                        <%
                            Orders order = (Orders) request.getAttribute("order");
                            if (order != null) {
                        %>

                        <script>
                            var currentOrderId;
                            function openConfirmModal(orderId) {
                                currentOrderId = orderId;
                                $('#confirmModal').modal('show');
                            }

                            function confirmReceived() {
                                // Set the form action and orderId input value
                                $('#confirmForm').attr('action', 'UpdateOrderStatusServlet');
                                $('#orderIdInput').val(currentOrderId);

                                // Submit the form
                                $('#confirmForm').submit();

                                // Close the modal
                                $('#confirmModal').modal('hide');
                            }
                        </script>
                        <div class="col-xl-10 col-lg-10 offset-1">
                            <div class="widget mt-30" style="background: #fff;">
                                <div class="top" style="border-bottom: 1px solid #eaedff">
                                    <div class="widget-title" >
                                        <strong>Mã đơn hàng:</strong> #<%= order.getOrder_id()%>

                                    </div>
                                    <div style="margin-bottom: 15px;float: right">
                                        <strong>Ngày nhận: </strong>
                                        ${order.order_date.toString()}
                                    </div>
                                </div>
                                <div class="bottom" style="border-bottom: 1px solid #eaedff; padding-bottom: 10px">
                                    <div class="profile-table" style="width: 50%;">
                                        <strong>Trạng thái đơn hàng:</strong>
                                        <%= order.getStatus()%>
                                    </div>
                                    <div class="profile-table" style="padding-left: 20px;border-left: 1px solid #eaedff;">
                                        <h5>Địa chỉ nhận hàng</h5>
                                        <p><strong>Receiver:</strong> <%= order.getReceiver_name()%> (<%= order.getReceiver_phone()%>)</p>
                                        <p><strong>Address:</strong> <%= order.getReceiver_address()%></p>
                                    </div>
                                </div>
                                <div class="bottom" style="border-bottom: 1px solid #eaedff">
                                    <div class="profile-table">
                                        <h5>Nội dung đơn hàng:</h5>
                                        <table border="0">
                                            <tbody>
                                                <c:forEach var="orderDetail" items="${order.orderDetails}">

                                                    <tr>
                                                        <td width="100"><img src="${orderDetail.product.getImg()}\1.png" alt="">
                                                        </td>
                                                        <td style="vertical-align: top; font-size: 20px" width="450">${orderDetail.product.getName()}
                                                            <p>x${orderDetail.quantity}</p></td>

                                                        <td width='350' style="text-align: right">
                                                            <c:if test="${order.status.trim() eq 'đã nhận'}">
                                                                <a type="button" class="btn theme-btn search-trigger" href="#" onclick="setvar('${orderDetail.product.product_id}', '${fn:replace(orderDetail.product.img, '\\', '/')}', '${orderDetail.product.name}')">Đánh giá</a>
                                                            </c:if>
                                                        </td>
                                                    </tr>

                                                </c:forEach>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                                <div class="bottom">
                                    <div class="profile-table">
                                        <p><strong>Phương thức vận chuyển:</strong> <%= order.getShipping_method()%></p>
                                        <p><strong>Phương thức thanh toán:</strong> <%= order.getPayment_method()%></p>
                                        <p><strong>Tổng thanh toán:</strong> <%= order.getTotal()%></p>
                                        <c:if test="${order.status.trim() eq 'đã giao hàng'}">
                                            <button type="button" class="btn theme-btn" onclick="openConfirmModal(${order.getOrder_id()})">Đã nhận hàng</button>
                                            <button type="button" class="btn theme-btn" > Yêu cầu trả hàng/hoàn tiền</button>
                                        </c:if>
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
                            <h3 class="text-center" style="border-bottom: 1px solid #e5e5e5; padding-bottom: 10px; margin-bottom: 40px">Đánh giá sản phẩm này</h3>
                            <form id="form_action" method="post" action="">
                                <table width="550" height="300">
                                    <tr>
                                        <td>
                                            <div class="side-pro-img">
                                                <a id="pr_link1" href=""><img id="pr_img" style="width: 70px;" src="" alt=""></a>
                                            </div>
                                        </td>
                                        <td style="vertical-align: top;">
                                            <div class="side-pro-content">
                                                <h5><a id="pr_link2" href="" style="font-weight: bold; font-size: 20px"></a></h5>
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
            <section class="order-detail">
                <div class="container">
                    <div class="row">

                        <div class="col-12">


                            <h2><strong>Mã đơn hàng:</strong> <%= order.getOrder_id()%></h2>
                            <h2><strong>Trạng thái đơn hàng:</strong> <%= order.getStatus()%></h2>
                            <h3>Địa chỉ nhận hàng</h3>
                            <div>


                                <p><strong>Receiver:</strong> <%= order.getReceiver_name()%> (<%= order.getReceiver_phone()%>)</p>
                                <p><strong>Address:</strong> <%= order.getReceiver_address()%></p>
                                <!-- Add more order information as needed -->

                                <h3>Order Items:</h3>
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>Product Img</th>
                                            <th>Product Name</th>

                                            <th>Quantity</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="orderDetail" items="${order.orderDetails}">

                                            <tr>
                                                <td><img src="${orderDetail.product.getImg()}\1.png" alt="">
                                                </td>
                                                <td>${orderDetail.product.getName()}</td>

                                                <td>${orderDetail.quantity}</td>
                                            </tr>

                                        </c:forEach>
                                    </tbody>

                                </table>

                                <p><strong>Ngày đặt hàng:</strong> <%= order.getOrder_date()%></p>
                                <p><strong>Phương thức vận chuyển:</strong> <%= order.getShipping_method()%></p>

                                <p><strong>Tổng thanh toán:</strong> <%= order.getTotal()%></p>
                            </div>
                            <%
                            } else {
                            %>
                            <p>No order information available.</p>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">



                            <c:if test="${order.status.trim() eq 'đã giao hàng'}">
                                <button type="button" class="btn theme-btn" onclick="openConfirmModal(${order.getOrder_id()})">Đã nhận hàng</button>
                                <button type="button" class="btn theme-btn" > Yêu cầu trả hàng/hoàn tiền</button>
                            </c:if>


                            <c:if test="${order.status.trim() eq 'đã nhận'}">
                                <button type="button" class="btn theme-btn" onclick="redirectToReviewPage()">Đánh giá</button>
                            </c:if>
                        </div>
                    </div>

                </div>
            </section>


            <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmModalLabel">Xác nhận Đã nhận hàng</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc chắn muốn đánh dấu Đã nhận hàng cho đơn hàng này?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy bỏ</button>
                            <button type="button" class="btn btn-primary" onclick="confirmReceived()">Xác nhận</button>
                        </div>
                    </div>
                </div>
            </div>


        </main>
        <jsp:include page="footer.jsp"></jsp:include>


        <script>
            var form_action = document.getElementById("form_action");
            var pr_link1 = document.getElementById("pr_link1");
            var pr_link2 = document.getElementById("pr_link2");
            var pr_img = document.getElementById("pr_img");

            function setvar(val, img, name) {
                let rimg = img.replace("\\", "/");
                form_action.setAttribute("action", "Rating?id=" + val);
                pr_link1.setAttribute("href", "ProductDetail?product=" + val);
                pr_link2.setAttribute("href", "ProductDetail?product=" + val);
                pr_img.src = rimg + "/1.png";
                pr_link2.innerHTML = name;
            }
        </script>

    </body>

    <!-- Mirrored from wphix.com/template/vue/vue/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 21 Oct 2023 08:30:39 GMT -->
</html>