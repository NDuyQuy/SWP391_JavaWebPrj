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
        <jsp:useBean id="product" scope="request" class="model.Product" />
        <c:set var="directoryPath" value="${product.productImg}" />
        <c:set var="imageExtensions" value=".jpg,.jpeg,.png,.gif" />
        <c:set var="imageFiles" value="" />
        <c:forEach var="extension" items="${fn:split(imageExtensions, ',')}">
            <c:forEach var="file" items="${fn:split(fn:substringAfter(imageFiles, extension), ',')}">
                <c:set var="imageFiles" value="${imageFiles},${fn:substringBefore(file, extension)}${extension}" />
            </c:forEach>
        </c:forEach>
        <main>
            <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h3 class="text-center mb-4">Sửa thông tin sản phẩm</h3>
                        <form action="../productcontroller" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="act" value="edit">
                            <div class="form-group">
                                <label for="productName">Tên sản phẩm:</label>
                                <input type="text" class="form-control" id="productName" name="productName" value="${product.productName}" required>
                            </div>
                            <div class="form-group">
                                <label for="category">Thuộc ngành:</label>
                                <select class="form-control" id="category" name="category" >
                                    <!-- Add your category options here -->
                                    <c:forEach var="c" items="${sessionScope.main_category_list}">
                                        <option value="${c.categoryID}" ${(product.getmCate().categoryID == c.categoryID) ? 'selected' : ''}>${c.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="price">Giá:</label>
                                <input type="text" class="form-control" id="price" name="price" required>
                            </div>
                            <div class="form-group">
                                <label for="quantity">Số lượng:</label>
                                <input type="text" class="form-control" id="quantity" name="quantity" required>
                            </div>
                            <div class="form-group">
                                <label for="description">Mô tả:</label>
                                <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <a href="javascript:void(0)" onclick="$('#pro-image').click()" class="btn btn-secondary border">Upload Image</a>
                                <input accept="image/*" type="file" id="pro-image" name="images" style="display: none;" class="form-control" multiple>
                                <div class="preview-images-zone">
                                    <c:if test="${not empty imageFiles}">
                                        <c:forEach var="imageFile" items="${fn:split(imageFiles, ',')}">
                                            <img src="${imageFile}" alt="Image" width="100" height="100">
                                        </c:forEach>
                                    </c:if>
                                </div>
                                <small class="form-text text-muted">Tối đa 10 hình ảnh.</small>
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