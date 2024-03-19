<%-- 
    Document   : handle_waiting_order
    Created on : 18-Mar-2024, 18:04:05
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade Custom Order Management</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

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
        <jsp:include page="../header.jsp"></jsp:include>

            <main>
                <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-text text-center">
                                    <h1>Đơn hàng đang chờ bạn xử lý</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="login-area pt-100 pb-100">
                <jsp:useBean id="noti" scope="session" class="java.util.ArrayList" />
                <div>
                    <table class="table table-bordered">
                        <thead>
                            <tr> 
                                <th>Id đơn hàng</th> 
                                <th>Ngày đặt hàng</th>
                                <th>Yêu cầu phương thức vận chuyển</th>
                                <th>Chi tiết</th>
                            </tr>
                        </thead>
                        <tbody> 
                            <c:forEach var="c" items="${noti}">
                                <tr> 
                                    <td><c:out value="${c.order_id}"/></td>
                                    <td><fmt:formatDate value="${c.order_date}" pattern="HH:mm dd/MM/yyyy"/></td>
                                    <td><c:out value="${c.shipping_method}"/></td>
                                    <td><a href="OrderDetail?id=${c.order_id}" style="color: blue">Chi tiết</a></td>
                                </tr>
                            </c:forEach>
                        </tbody> 
                    </table>
                </div>

                <!-- Add Category Popup -->
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
                                <form action="AcceptOrder" method="get">
                                    <input type="hidden" name="act" value="acc">
                                    <input type="hidden" id="orderId" name="orderId">
                                    <div class="form-group">
                                        <input type="hidden" name="act" value ="add">
                                        <select name="unit" class="form-control">
                                            <c:forEach var="u" items="${sessionScope.sunits}">
                                                <option value="${u.id}">${u.name}</option>
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

                <!-- Add Category Popup -->
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
                                <form action="CancelOrder" method="post">
                                    <input type="hidden" name="act" value="dec">
                                    <input type="hidden" id="orderId" name="orderId">
                                    <div class="form-group">
                                        <input type="radio" id="reason1" name="reason" value="Trong đơn chứa sản phẩm mà shop không còn hàng thực tế">
                                        <label for="reason1">Trong đơn chứa sản phẩm mà shop không còn hàng thực tế</label>
                                    </div>
                                    <div class="form-group">
                                        <input type="radio" id="reason2" name="reason" value="Khác">
                                        <label for="reason2">Khác</label>
                                        <input type="text" id="otherReason" name="otherReason" class="form-control" placeholder="Nhập lý do khác">
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
        </script>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>