<%-- 
    Document   : product_detail
    Created on : 05-Apr-2024, 00:00:52
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Information</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <jsp:useBean id="pdl" scope="request" class="java.util.ArrayList" />
        <jsp:useBean id="product" scope="request" class="model.Products" />
        <jsp:include page="header.jsp"></jsp:include>
            <main>
                <div class="container">
                    <h3>Thông tin sản phẩm</h3>
                    <p><strong>Tên sản phẩm:</strong> ${product.name}</p>
                    <p>
                        <strong>Mô tả:</strong><br>
                        ${product.description}
                    </p>
                    <h4>Thông tin chi tiết</h4>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Hình ảnh</th>
                                <th scope="col">Tên phân loại</th>
                                <th scope="col">Giá</th>
                                <th scope="col">Số lượng tồn kho</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="pd" items="${pdl}">
                                <tr>
                                    <td><img src="${pd.img}" alt="" style="width: 100px; height: 100px"></td>
                                    <td>${pd.name}</td>
                                    <td>${pd.price}</td>
                                    <td>${pd.quantity}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <a href="${pageContext.request.contextPath}/productcontroller" class="btn btn-success">Trờ về danh sách sản phẩm</a>
                </div>
            </main>

        <!-- Bootstrap JS -->
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
    </body>
</html>