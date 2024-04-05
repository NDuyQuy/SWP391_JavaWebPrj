<%-- 
    Document   : custom_order_management
    Created on : 09-Mar-2024, 11:22:04
    Author     : ASUS
--%>

<%@page import="java.util.List"%>
<%@page import="model.ShippingUnits"%>
<%@page import="model.Users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade Custom Order Management</title>
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
        <jsp:include page="header.jsp"></jsp:include>
            <main style="width: 90%; margin: auto;">

                <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-text text-center">
                                    <h1>Custom Order Management</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="login-area pt-100 pb-100" >
                <jsp:useBean id="c_o_l" scope="request" class="java.util.ArrayList" />
                <div>
                    <table class="table table-bordered">
                        <thead>
                            <tr> 
                                <th>Tên sản phẩm</th> 
                                <th>Trạng thái</th>
                                <th>Giá</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody> 
                            <c:forEach var="c" items="${c_o_l}" varStatus="loop">
                                <tr> 
                                    <td><c:out value="${c.product_name}"/></td>
                                    <td><c:out value="${c.order.status}"/></td>
                                    <td><c:out value="${c.order.total - c.order.shipping_cost}"/></td>
                                    <c:if test="${c.order.status eq 'WAC'}">
                                        <td>
                                            <a class="text-decoration-none blue"name="copyLink" id="copyLink" data-suffix="${c.id}">Lấy link</a>
                                        </td>
                                    </c:if>
                                    <c:if test="${c.order.status eq 'Chưa hoàn thành'}">
                                        <td>
                                            <a class="text-decoration-none green" href="CustomOrderController?open=up&o_id=${c.id}" style="color: orangered">Cập nhật quá trình</a>
                                        </td>
                                    </c:if>
                                    <c:if test="${c.order.status eq 'Đã hoàn thành'}">
                                        <td>
                                            <a style="color: green"class="text-decoration-none orange"href="#" onclick="openPopup('selectShip', '${loop.index}')">Chọn vận chuyển</a>
                                        </td>
                                    </c:if>    
                                </tr>
                            </c:forEach>
                        </tbody> 
                    </table>
                </div>
                <button type="button" class="btn btn-primary" onclick="openPopup('add')">Tạo đơn mới</button>
                <!-- Add Category Popup -->
                <div class="modal" id="addPopup">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Tạo order</h4>
                                <button type="button" class="close" data-dismiss="modal" onclick="closePopup('add')">&times;</button>
                            </div>
                            <!-- Modal Body -->
                            <div class="modal-body">
                                <form action="CustomOrderController" method="post">
                                    <div class="form-group">
                                        <input type="hidden" name="act" value ="add">
                                        <label for="productName">Tên sản phẩm</label>
                                        <input type="text" id="productName" name="productName" class="form-control" required> <br>
                                        <label for="price">Giá</label>
                                        <input type="number" id="price" name="price" class="form-control" required> <br>
                                        <label for="ecd">Thời gian hoàn thành dự kiến</label>
                                        <input type="date" id="ecd" name="ecd" class="form-control" required> <br>
                                    </div>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closePopup('add')">Hủy</button>
                                    <button type="submit" class="btn btn-success">Xác nhận</button>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="modal" id="selectShipPopup">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Lựa chọn đơn vị vận chuyển</h4>
                                <button type="button" class="close" data-dismiss="modal" onclick="closePopup('selectShip')">&times;</button>
                            </div>
                            <!-- Modal Body -->
                            <div class="modal-body">
                                <form action="OrderDetail" method="POST">
                                    <input type="hidden" name="act" value="sls">
                                    <input type="hidden" id="orderId" name="orderId" value="${o.id}">
                                    <div class="form-group">
                                        <%
                                            //String addr = ((Users) session.getAttribute("user")).getAddress();
                                            //List<ShippingUnits> result = dao.OrdersDao.getLocalShippingUnits(addr);
                                        %>
                                        <c:set var="addr" value="${sessionScope.user.address}" />
                                        <c:set var="result" value="${dao.OrdersDao.getLocalShippingUnits(addr)}" />
                                        <%
                                            String addrValue = (String) pageContext.getAttribute("addr");
                                            List<ShippingUnits> result = dao.OrdersDao.getLocalShippingUnits(addrValue);
                                            pageContext.setAttribute("result", result);
                                        %>
                                        <p>${addr}</p>
                                        <select name="unit" class="form-control">
                                            <c:forEach var="u" items="${result}">
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
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closePopup('selectShip')">Hủy</button>
                                    <button type="submit" class="btn btn-success">Xác nhận</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main>

        <script src="js/vendor/jquery-1.12.4.min.js"></script>
        <script src="js/jquery-ui.js"></script>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>

                                        function openPopup(type, index) {
                                            
                                                // Show the popup
                                                $('#' + type + 'Popup').modal('show');
                                            
                                        }




                                        function closePopup(type) {
                                            $('#' + type + 'Popup').modal('hide');
                                        }

                                        $('[name="copyLink"]').click(function (event) {
                                            // Prevent the default behavior of the <a> tag
                                            event.preventDefault();

                                            // Get the suffix from the data attribute
                                            var suffix = $(this).data('suffix');

                                            // Construct the full URL
                                            var fullURL = window.location.protocol + '//' + window.location.host + '${pageContext.request.contextPath}/' + 'CustomOrderAcc?id=' + suffix;

                                            // Copy the link to the clipboard
                                            navigator.clipboard.writeText(fullURL)
                                                    .then(function () {
                                                        // If successful, display a message
                                                        alert('Link is saved to the clipboard: ' + fullURL);
                                                    })
                                                    .catch(function (err) {
                                                        // If unable to copy, display an error message
                                                        console.error('Could not copy text: ', err);
                                                        alert('Error: Unable to copy link to clipboard.');
                                                    });
                                        });
        </script>
    </body>
</html>