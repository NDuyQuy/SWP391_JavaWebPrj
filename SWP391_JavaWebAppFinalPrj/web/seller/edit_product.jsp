<%-- 
    Document   : edit_product
    Created on : 06-Mar-2024, 17:43:23
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Edit Product</title>
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
        <link rel="stylesheet" href="../css/imageInput.css">
    </head>
    <body>
        <jsp:useBean id="product" scope="session" class="model.Products" />
        <main>
            <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h3 class="text-center mb-4">Sửa thông tin sản phẩm</h3>
                        <form action="../productcontroller" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="act" value="edit">
                            <input type="hidden" name="productId" value="${product.product_id}">
                            <div class="form-group">
                                <label for="productName">Tên sản phẩm:</label>
                                <input type="text" class="form-control" id="productName" name="productName" value="${product.name}" required>
                            </div>
                            <div class="form-group">
                                <label for="category">Thuộc danh mục:</label>
                                <select class="form-control" id="category" name="category" >
                                    <!-- Add your category options here -->
                                    <c:forEach var="c" items="${sessionScope.SCategoryList}">
                                        <option value="${c.id}" ${(product.scate_id == c.id) ? 'selected' : ''}>${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="price">Giá:</label>
                                <input type="number" class="form-control" id="price" name="price" value="${product.money}"required>
                            </div>
                            <div class="form-group">
                                <label for="quantity">Số lượng:</label>
                                <input type="number" class="form-control" id="quantity" name="quantity" value="${product.quantity}" required>
                            </div>
                            <div class="form-group">
                                <label for="description">Mô tả:</label>
                                <textarea class="form-control" id="description" name="description" rows="3">${product.description}</textarea>
                            </div>
                            <div class="form-group">
                                <a href="javascript:void(0)" onclick="$('#pro-image').click()" class="btn btn-secondary border">Upload Image</a>
                                <input accept="image/*" type="file" id="pro-image" name="images" style="display: none;" class="form-control" multiple>
                                <div class="preview-images-zone">
                                    <c:forEach var="i" items="${sessionScope.imgs}">
                                        <div class="preview-image">
                                            <div class="image-cancel" data-no="">x</div>
                                            <div class="image-zone"><img src="../${i}"></div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <small class="form-text text-muted">Tối đa 3 hình ảnh.</small>
                                <small class="form-text text-muted">CHÚ Ý:Vì lý do kỹ thuật nên việc upload file ảnh mới sẽ thay thế 
                                    toàn bộ ảnh cũ của sản phẩm.</small>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-success" id="submit-btn">Sửa</button>
                                <a href="../productcontroller" class="btn btn-secondary">Hủy</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
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
        <script src="../js/imageInput.js"></script>                            
    </body>
</html>
