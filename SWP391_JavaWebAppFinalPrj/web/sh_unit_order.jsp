<%-- 
    Document   : sh_unit_order
    Created on : Mar 19, 2024, 8:33:55 AM
    Author     : hien
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade - Checking Order</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.html">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
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
        </style>
    </head>
    <body>
        <jsp:include page="sh_unit_header.jsp"></jsp:include>

        <section class="profile-area pt-30 pb-45" style="padding-bottom: 280px;">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-10 col-lg-10 offset-1">
                            <div class="product-review" style="margin: 0 auto;">
                                <ul class="nav review-tab" id="myTabproduct" style="font-family: 'Montserrat', sans-serif;" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="all-tab" data-toggle="tab" href="#all" role="tab" aria-controls="all"
                                           aria-selected="true">Chờ xác nhận</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="cate-tab1" data-toggle="tab" href="#cate1" role="tab" aria-controls="1"
                                           aria-selected="false">Chờ lấy hàng</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="cate-tab2" data-toggle="tab" href="#cate2" role="tab" aria-controls="2"
                                           aria-selected="false">Đang giao hàng</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent2">
                                    <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
                                    <c:if test="${wait_list == null || empty wait_list}">
                                        <div class="empty">
                                            <img src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg/return/5fafbb923393b712b964.png" style="width: 150px">
                                            <h4 style="margin-top: 20px">Không có đơn hàng nào.</h4>
                                        </div>
                                    </c:if>
                                    <c:forEach var="order" items="${wait_list}">
                                        <div class="widget mt-30" style="background: #fff;">
                                            <a id="shop-profile"></a>
                                            <div class="top" style="border-bottom: 1px solid #eaedff">
                                                <div class="widget-title" >
                                                    Đơn hàng #${order.order_id}
                                                </div>
                                                <div style="margin-bottom: 15px;float: right">
                                                    ${order.order_date.toString()}
                                                </div>
                                            </div>
                                            <div class="bottom" style="border-bottom: 1px solid #eaedff; padding-bottom: 10px">
                                                <div class="profile-table" style="width: 50%; border-right: 1px solid #eaedff;">
                                                    <h5>Từ:</h5>
                                                    ${usersDao.getUserById(order.shop_id).fullname} | ${usersDao.getUserById(order.shop_id).phone}<br>
                                                    ${usersDao.getUserById(order.shop_id).address}
                                                </div>
                                                <div class="profile-table" style="padding-left: 20px;">
                                                    <h5>Đến:</h5>
                                                    ${order.receiver_name} | ${order.receiver_phone}<br>
                                                    ${order.receiver_address}
                                                </div>
                                            </div>
                                            <div class="bottom">
                                                <div class="profile-table">
                                                    <h5>Nội dung đơn hàng:</h5>
                                                    <ul>
                                                        <c:set var="prod_list" value="${sessionScope.orderDetailDao.getOrderDetailsByOrderId(order.order_id)}"/>
                                                        <c:forEach var="pr" items="${prod_list}">
                                                            <li>${sessionScope.productDao.getProductById(pr.productID).name} - SL: ${pr.quantity}</li>
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="bottom">
                                                <form action="ShippingUnit?action=accept&id=${order.order_id}" method="post" style="width: 50%" onsubmit="return acceptForm(this);">
                                                    <input type="submit" class="btn white-btn" id="accept" style="width: 100%; font-family: 'Montserrat', sans-serif;" onmouseover="acceptBtn(this);" onmouseout="leftBtn(this);" value="Tiếp nhận">
                                                </form>
                                                <form action="ShippingUnit?action=refuse&id=${order.order_id}" method="post" style="width: 50%" onsubmit="return refuseForm(this);">
                                                    <input type="submit" class="btn white-btn" id="refuse" style="width: 100%; font-family: 'Montserrat', sans-serif;" onmouseover="refuseBtn(this);" onmouseout="leftBtn(this);" value="từ chối">
                                                </form>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="tab-pane fade" id="cate1" role="tabpanel" aria-labelledby="cate-tab1">
                                    <c:if test="${take_list == null || empty take_list}">
                                        <div class="empty">
                                            <img src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg/return/5fafbb923393b712b964.png" style="width: 150px">
                                            <h4 style="margin-top: 20px;">Không có đơn hàng nào.</h4>
                                        </div>
                                    </c:if>
                                    <c:forEach var="order" items="${take_list}">
                                        <c:if test="${order.type == 3}">
                                            <div class="widget mt-30" style="background: #fff;">
                                            <a id="shop-profile"></a>
                                            <div class="top" style="border-bottom: 1px solid #eaedff">
                                                <div class="widget-title" >
                                                    Đơn hàng #${order.order_id}
                                                </div>
                                                <div style="margin-bottom: 15px;float: right">
                                                    ${order.order_date.toString()}
                                                </div>
                                            </div>
                                            <div class="bottom" style="border-bottom: 1px solid #eaedff; padding-bottom: 10px">
                                                <div class="profile-table" style="width: 50%; border-right: 1px solid #eaedff;">
                                                    <h5>Từ:</h5>
                                                    ${order.receiver_name} | ${order.receiver_phone}<br>
                                                    ${order.receiver_address}                                                    
                                                </div>
                                                <div class="profile-table" style="padding-left: 20px;">
                                                    <h5>Đến:</h5>
                                                    ${sessionScope.usersDao.getUserById(order.shop_id).fullname} | ${sessionScope.usersDao.getUserById(order.shop_id).phone}<br>
                                                    ${sessionScope.usersDao.getUserById(order.shop_id).address}
                                                </div>
                                            </div>
                                            <div class="bottom">
                                                <div class="profile-table">
                                                    <h5>Nội dung đơn hàng:</h5>
                                                    <ul>
                                                        <c:set var="prod_list" value="${sessionScope.orderDetailDao.getOrderDetailsByOrderId(order.order_id)}"/>
                                                        <c:forEach var="pr" items="${prod_list}">
                                                            <li>${sessionScope.productDao.getProductById(pr.productID).name}</li>
                                                            </c:forEach>
                                                    </ul>
                                                        <h5>Ghi chú: Đơn trả hàng</h5>
                                                </div>
                                            </div>
                                            <div class="bottom">
                                                <form action="ShippingUnit?action=update&id=${order.order_id}" method="post" style="width: 100%" onsubmit="return updateForm(this);">
                                                    <input type="submit" class="btn white-btn" id="accept" style="width: 50%; font-family: 'Montserrat', sans-serif; float: right;" onmouseover="acceptBtn(this);" onmouseout="leftBtn(this);" value="Xác nhận đã lấy hàng">
                                                </form>
                                            </div>
                                        </div>
                                        </c:if>
                                        <div class="widget mt-30" style="background: #fff;">
                                            <a id="shop-profile"></a>
                                            <div class="top" style="border-bottom: 1px solid #eaedff">
                                                <div class="widget-title" >
                                                    Đơn hàng #${order.order_id}
                                                </div>
                                                <div style="margin-bottom: 15px;float: right">
                                                    ${order.order_date.toString()}
                                                </div>
                                            </div>
                                            <div class="bottom" style="border-bottom: 1px solid #eaedff; padding-bottom: 10px">
                                                <div class="profile-table" style="width: 50%; border-right: 1px solid #eaedff;">
                                                    <h5>Từ:</h5>
                                                    ${sessionScope.usersDao.getUserById(order.shop_id).fullname} | ${sessionScope.usersDao.getUserById(order.shop_id).phone}<br>
                                                    ${sessionScope.usersDao.getUserById(order.shop_id).address}
                                                </div>
                                                <div class="profile-table" style="padding-left: 20px;">
                                                    <h5>Đến:</h5>
                                                    ${order.receiver_name} | ${order.receiver_phone}<br>
                                                    ${order.receiver_address}
                                                </div>
                                            </div>
                                            <div class="bottom">
                                                <div class="profile-table">
                                                    <h5>Nội dung đơn hàng:</h5>
                                                    <ul>
                                                        <c:set var="prod_list" value="${sessionScope.orderDetailDao.getOrderDetailsByOrderId(order.order_id)}"/>
                                                        <c:forEach var="pr" items="${prod_list}">
                                                            <li>${sessionScope.productDao.getProductById(pr.productID).name} - SL: ${pr.quantity}</li>
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="bottom">
                                                <form action="ShippingUnit?action=update&id=${order.order_id}" method="post" style="width: 100%" onsubmit="return updateForm(this);">
                                                    <input type="submit" class="btn white-btn" id="accept" style="width: 50%; font-family: 'Montserrat', sans-serif; float: right;" onmouseover="acceptBtn(this);" onmouseout="leftBtn(this);" value="Xác nhận đã lấy hàng">
                                                </form>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="tab-pane fade" id="cate2" role="tabpanel" aria-labelledby="cate-tab2">
                                    <c:if test="${ship_list == null || empty ship_list}">
                                        <div class="empty">
                                            <img src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg/return/5fafbb923393b712b964.png" style="width: 150px">
                                            <h4 style="margin-top: 20px;">Không có đơn hàng nào.</h4>
                                        </div>
                                    </c:if>

                                    <c:forEach var="order" items="${ship_list}">
                                        <div class="widget mt-30" style="background: #fff;">
                                            <a id="shop-profile"></a>
                                            <div class="top" style="border-bottom: 1px solid #eaedff">
                                                <div class="widget-title" >
                                                    Đơn hàng #${order.order_id}
                                                </div>
                                                <div style="margin-bottom: 15px;float: right">
                                                    ${order.order_date.toString()}
                                                </div>
                                            </div>
                                            <div class="bottom" style="border-bottom: 1px solid #eaedff; padding-bottom: 10px">
                                                <div class="profile-table" style="width: 50%; border-right: 1px solid #eaedff;">
                                                    <h5>Từ:</h5>
                                                    ${usersDao.getUserById(order.shop_id).fullname} | ${usersDao.getUserById(order.shop_id).phone}<br>
                                                    ${usersDao.getUserById(order.shop_id).address}
                                                </div>
                                                <div class="profile-table" style="padding-left: 20px;">
                                                    <h5>Đến:</h5>
                                                    ${order.receiver_name} | ${order.receiver_phone}<br>
                                                    ${order.receiver_address}
                                                </div>
                                            </div>
                                            <div class="bottom">
                                                <div class="profile-table">
                                                    <h5>Nội dung đơn hàng:</h5>
                                                    <ul>
                                                        <c:set var="prod_list" value="${sessionScope.orderDetailDao.getOrderDetailsByOrderId(order.order_id)}"/>
                                                        <c:forEach var="pr" items="${prod_list}">
                                                            <li>${sessionScope.productDao.getProductById(pr.productID).name} - SL: ${pr.quantity}</li>
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="bottom">
                                                <form action="ShippingUnit?action=complete&id=${order.order_id}" method="post" style="width: 100%" onsubmit="return completeForm(this);">
                                                    <input type="submit" class="btn white-btn" id="accept" style="width: 50%; font-family: 'Montserrat', sans-serif; float: right;" onmouseover="acceptBtn(this);" onmouseout="leftBtn(this);" value="Xác nhận đã giao hàng">
                                                </form>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <!-- JS here -->
        <script>
            function acceptBtn(btn) {
                btn.style.background = "#84b77c";
            }

            function refuseBtn(btn) {
                btn.style.background = "#fe4536";
            }

            function leftBtn(btn) {
                btn.style.background = "#fff";
            }

            function acceptForm(form) {
                swal({
                    title: "Xác nhận tiếp nhận?",
                    text: "Sau khi tiếp nhận sẽ không được từ chối đơn hàng.",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((isOkay) => {
                            if (isOkay) {
                                form.submit();
                            }
                        });
                return false;
            }
            
            function updateForm(form) {
                swal({
                    title: "Xác nhận đã lấy hàng?",
                    text: "Sau khi xác nhận sẽ không được chỉnh sửa.",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((isOkay) => {
                            if (isOkay) {
                                form.submit();
                            }
                        });
                return false;
            }
            
            function completeForm(form) {
                swal({
                    title: "Xác nhận đã giao hàng thành công?",
                    text: "Sau khi xác nhận sẽ không được chỉnh sửa.",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((isOkay) => {
                            if (isOkay) {
                                form.submit();
                            }
                        });
                return false;
            }

            function refuseForm(form) {
                swal({
                    title: "Xác nhận từ chối?",
                    text: "Sau khi từ chối sẽ xóa đơn hàng khỏi mục vận chuyển.",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((isOkay) => {
                            if (isOkay) {
                                form.submit();
                            }
                        });
                return false;
            }
        </script>
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </body>
</html>
