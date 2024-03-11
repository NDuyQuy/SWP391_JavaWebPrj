<%-- 
    Document   : custom_order_management
    Created on : 09-Mar-2024, 11:22:04
    Author     : ASUS
--%>

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
        <jsp:include page="../header.jsp"></jsp:include>

            <main>
                <!-- breadcrumb-area-start -->
                <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-text text-center">
                                    <h1>Category Management</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- breadcrumb-area-end -->

                <!-- login Area Strat-->
                <section class="login-area pt-100 pb-100">
                    <jsp:useBean id="shop_categories" scope="session" class="java.util.ArrayList" />
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
                                <c:forEach var="s" items="${shop_categories}">
                                    <tr> 
                                        <td><c:out value="${s.categoryID}"/></td>
                                        <td><c:out value="${s.categoryName}"/></td>
                                        <td><c:out value="${s.mCate.categoryName}"/></td>
                                        <td>
                                            <a href="../CustomOrderController?open=updateprocess&o_id=${s.id}">Cập nhật quá trình</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody> 
                        </table>
                    </div>
                    <button type="button" class="btn btn-primary" onclick="openPopup('add')">
                        Add New Category
                    </button>
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
                                    <form action="shopcategorycontroller" method="post">
                                        <div class="form-group">
                                            <input type="hidden" name="act" value ="addnew">
                                            <label for="orderCode">Mã Order</label>
                                            <input type="text" id="orderCode" name="orderCode" class="form-control" required> <br>
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
                    
                   

            </section>
            <!-- login Area End-->


        </main>

        <jsp:include page="../footer.jsp"></jsp:include>
        <!-- JavaScript to control the display of the popups -->
        <script>
            function openPopup(type, categoryId,categoryName) {
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
    </body>
</html>