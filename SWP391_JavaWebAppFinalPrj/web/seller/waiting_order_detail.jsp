<%-- 
    Document   : handle_waiting_order
    Created on : 18-Mar-2024, 18:04:05
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade Custom Order Management</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Place favicon.ico in the root directory -->
        <!-- CSS here -->

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
        <jsp:include page="../header.jsp"></jsp:include>
            <main>
                <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-text text-center">
                                    <h1>Chi tiết đơn hàng</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="login-area pt-100 pb-100">
                <jsp:useBean id="wod" scope="request" class="java.util.ArrayList" />
                <c:set var="o" value="${wod.get(0)}"/>
                <div>
                    <table class="table table-bordered">
                        <thead>
                            <tr> 
                                <th>Id đơn hàng</th> 
                                <th>Tên sản phẩm</th>
                                <th>Số lượng sản phẩm</th>
                            </tr>
                        </thead>
                        <tbody> 
                            <c:forEach var="c" items="${wod}">
                                <tr> 
                                    <td><c:out value="${c.orderID}"/></td>
                                    <td><c:out value="${c.product.name}"/></td>
                                    <td><c:out value="${c.quantity}"/></td>
                                </tr>
                            </c:forEach>
                        </tbody> 
                    </table>
                </div>
                <button class="btn btn-primary" onclick="openPopup('acc')">Chấp nhận đơn hàng</button>
                <button class="btn btn-danger" onclick="openPopup('dec')">Từ chối(Hủy) đơn hàng</button>

                <!-- Accept Popup -->
                <div class="modal" id="accPopup">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Lựa chọn đơn vị vận chuyển</h4>
                                <button type="button" class="close" data-dismiss="modal" onclick="closePopup('acc')">&times;</button>
                            </div>
                            <!-- Modal Body -->
                            <div class="modal-body">
                                <form action="OrderDetail" method="POST">
                                    <input type="hidden" name="act" value="acc">
                                    <input type="hidden" id="orderId" name="orderId" value="${o.orderID}">
                                    <div class="form-group">
                                        <select name="unit" class="form-control">
                                            <c:forEach var="u" items="${requestScope.sunits}">
                                                <c:choose>
                                                    <c:when test="${o.order.shipping_method eq 'nhanh' && u.support_shippingmethod eq 1}">
                                                        <option value="${u.id}">${u.name}</option>
                                                    </c:when>
                                                    <c:when test="${o.order.shipping_method eq 'hỏa tốc' && u.support_shippingmethod eq 2}">
                                                        <option value="${u.id}">${u.name}</option>
                                                    </c:when>
                                                    <c:when test="${o.order.shipping_method eq 'tiết kiệm' && u.support_shippingmethod eq 3}">
                                                        <option value="${u.id}">${u.name}</option>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closePopup('acc')">Hủy</button>
                                    <button type="submit" class="btn btn-success">Xác nhận</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Decline Popup -->
                <div class="modal" id="decPopup">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Chọn lý do hủy đơn hàng</h4>
                                <button type="button" class="close" data-dismiss="modal" onclick="closePopup('dec')">&times;</button>
                            </div>
                            <!-- Modal Body -->
                            <div class="modal-body">
                                <form action="OrderDetail" method="POST" onsubmit="return validateForm()">
                                    <input type="hidden" name="act" value="dec">
                                    <input type="hidden" id="orderId" name="orderId" value="${o.orderID}">
                                    <div class="form-group">
                                        <input type="radio" id="reason1" name="reason" value="Đơn chứa sản phẩm hết hàng tồn kho">
                                        <label for="reason1">Trong đơn chứa sản phẩm mà shop không còn hàng thực tế</label>
                                    </div>
                                    <div class="form-group">
                                        <input type="radio" id="reason2" name="reason" value="other">
                                        <label for="reason2">Khác</label>
                                        <input type="text" id="otherReason" name="otherReason" class="form-control" placeholder="Nhập lý do khác" onclick="selectRadio()" maxlength="50">
                                    </div>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closePopup('dec')">Hủy</button>
                                    <button type="submit" class="btn btn-danger">Xác nhận</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <jsp:include page="../footer.jsp"></jsp:include>                     
        <!-- JavaScript to control the display of the popups -->
        <script>
            function openPopup(type, orderId) {

                $('#' + type + 'Popup').modal('show');
            }

            function closePopup(type) {
                $('#' + type + 'Popup').modal('hide');
            }

            function selectRadio() {
                document.getElementById("reason2").checked = true;
            }

            function validateForm() {
                var reason1Checked = document.getElementById("reason1").checked;
                var reason2Checked = document.getElementById("reason2").checked;
                var otherReason = document.getElementById("otherReason").value.trim();

                if (!reason1Checked && !reason2Checked) {
                    alert("Vui lòng chọn ít nhất một lý do.");
                    return false;
                }

                if (reason2Checked && otherReason === "") {
                    alert("Vui lòng nhập lý do khác.");
                    return false;
                }

                return true;
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
</html>