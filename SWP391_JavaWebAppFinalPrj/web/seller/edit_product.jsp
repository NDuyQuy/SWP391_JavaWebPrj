<%-- 
    Document   : edit_product
    Created on : 06-Mar-2024, 17:43:23
    Author     : ASUS
--%>
<%@ page import="dao.ProductDao" %>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:useBean id="product" scope="request" class="model.Products" />
        <main>
            <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <h3 class="text-center mb-4">Sửa thông tin sản phẩm</h3>
                        <form action="${pageContext.request.contextPath}/productcontroller" method="POST" enctype="multipart/form-data">
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
                                    <c:forEach var="c" items="${requestScope.SCategoryList}">
                                        <option value="${c.id}" ${(product.scate_id == c.id) ? 'selected' : ''}>${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="productDetail">Phân loại:</label>
                                <br>
                                <a href="javascript:void(0)" id="add_row" class="btn btn-secondary border" onclick="addRow()">Thêm phân loại</a>
                                <table id="pdetails" class="table border">
                                    <thead>
                                        <tr>
                                            <th>Ảnh</th>
                                            <th width="280">Tên</th>
                                            <th>Giá</th>
                                            <th width="150">Số lượng</th>
                                            <th width="70"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="pd" items="${requestScope.pdl}" varStatus="loop">
                                        <tr>
                                            <input type="hidden" name="ids" value="${pd.id}">
                                            <input type="hidden" name="imgs" value="${pd.img}">
                                            <td>
                                                <img style="width: 90px; height: 90px; object-fit: contain" id="img-${pd.id}" src="${pd.img}" onclick="$('#detail-img-${pd.id}').click()">
                                                <input type="file" accept="image/*" id="detail-img-${pd.id}" name="image_${loop.index}" style="display: none;" class="form-control" onchange="readURL(this)">
                                            </td>
                                            <td><input value="${pd.name}" type="text" class="form-control" name="names" required></td>
                                            <td><input type="number" value="${pd.price}" class="form-control" name="prices" required></td>
                                            <td><input type="number" value="${pd.quantity}" class="form-control" name="quantities" required></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="form-group">
                                <label for="description">Mô tả:</label>
                                <textarea class="form-control" id="description" name="description" rows="3" required>${product.description}</textarea>
                            </div>

                            <div class="form-group" style="margin-top: 20px;">
                                <button type="submit" class="btn btn-success" id="submit-btn">Sửa</button>
                                <a href="${pageContext.request.contextPath}/productcontroller" class="btn btn-secondary">Hủy</a>
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>
        </main>

    </body>
    <!-- JS here -->
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/imageInput.js"></script>
    
    <script>
        function deleteFunc(row) {
            var rowIndex = row.parentNode.parentNode.rowIndex;
            
            document.getElementById("pdetails").deleteRow(rowIndex);
            checkDelete();
        }

        function readURL(input) {
            let img_id = input.id;
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#img-' + img_id.substring(11)).attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        var pd_id = 0;

        function addRow() {
            pd_id = pd_id + 1;
            $('#pdetails tbody').append("<tr><td><img style='width: 90px; height: 90px; object-fit: contain' id='img-" +
                    (pd_id) + "' src='default/default.jpg' onclick='$(`#detail-img-" + (pd_id) +
                    "`).click()'><input type='file' accept='image/*' id='detail-img-" + (pd_id) +
                    "' name='new_imgs' style='display: none;' class='form-control' onchange='readURL(this)' required></td><td>" +
                    "<input value='Default' type='text' class='form-control' name='new_names' required></td><td><input type='number' class='form-control' name='new_prices' required></td><td><input type='number' class='form-control' name='new_quantities' required></td>\n\
                    <td style='text-align:center'><i class='fa fa-times' style='color:black' id='dlt-" + pd_id +
                    "' onclick='deleteFunc(this)'></i></td></tr>");

        }
    </script>
</html>