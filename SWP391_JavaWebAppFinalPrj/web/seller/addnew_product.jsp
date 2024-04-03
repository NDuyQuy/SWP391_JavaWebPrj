<%-- 
    Document   : addnew_product
    Created on : 06-Mar-2024, 17:43:16
    Author     : ASUS
--%>
<%@ page import="dao.ProductDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Create Product</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <style>
            /* Add margin between table rows */
            #pdetails tbody tr {
                margin-bottom: 5px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <main>
                <div class="container mt-5">
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <h3 class="text-center mb-4">Thêm sản phẩm</h3>
                            <form action="${pageContext.request.contextPath}/productcontroller" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="act" value="create">
                            <div class="form-group">
                                <label for="productName">Tên sản phẩm:</label>
                                <input type="text" class="form-control" id="productName" name="productName" maxlength="50" required>
                            </div>
                            <div class="form-group">
                                <label for="category">Thuộc danh mục:</label>
                                <select class="form-control" id="category" name="category" required="">
                                    <option value="0" selected="" disabled="">Xin hãy chọn danh mục của sản phẩm</option>
                                    <c:forEach var="c" items="${requestScope.SCategoryList}">
                                        <option value="${c.id}">${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="productDetail">Phân loại:</label>
                                <br>
                                <a href="javascript:void(0)" id="add_row" class="btn btn-secondary border" onclick="addRow()">Thêm phân loại</a>
                                <table id="pdetails" class="table-bordered" style="width: 100%;">
                                    <thead>
                                        <tr class="text-center">
                                            <th>Ảnh</th>
                                            <th>Tên</th>
                                            <th>Giá</th>
                                            <th>Số lượng</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <img style="width: 90px; height: 90px; object-fit: contain" id="img-1" src="default/default.jpg" onclick="$('#detail-img-1').click()">
                                                <input type="file" accept="image/*" id="detail-img-1" name="images" style="display: none;" class="form-control" onchange="readURL(this)" required="">
                                            </td>
                                            <td width="280"><input value="Default" type="text" class="form-control" id="detail-name-1" name="names" required=""></td>
                                            <td><input type="number" class="form-control" id="detail-price-1" name="prices" required="" min="0"></td>
                                            <td width="150"><input type="number" class="form-control" id="detail-quantity-1" name="quantities" required="" min="0"></td>
                                            <td width="70"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="form-group">
                                <label for="description">Mô tả:</label>
                                <textarea class="form-control" id="description" name="description" rows="3" maxlength="5000"></textarea>
                            </div>
                            <div class="form-group" style="margin: 10px;">
                                <button type="submit" class="btn btn-success" id="submit-btn">Tạo</button>
                                <a href="${pageContext.request.contextPath}/productcontroller" class="btn btn-secondary">Hủy</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <script src="js/vendor/jquery-1.12.4.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/imageInput.js"></script>

        <script>
            function deleteFunc(row) {
                var i = row.parentNode.parentNode.rowIndex;
                document.getElementById("pdetails").deleteRow(i);
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

            var pd_id = 1;

            function addRow() {
                pd_id++;
                var newRow = "<tr>" +
                        "<td>" +
                        "<img style='width: 90px; height: 90px; object-fit: contain' id='img-" + pd_id +
                        "' src='default/default.jpg' onclick='$(\"#detail-img-" + pd_id +
                        "\").click()'>" +
                        "<input type='file' accept='image/*' id='detail-img-" + pd_id +
                        "' name='images' style='display: none;' class='form-control' onchange='readURL(this)' required>" +
                        "</td>" +
                        "<td width='280'>" +
                        "<input value='' type='text' class='form-control' name='names' required>" +
                        "</td>" +
                        "<td>" +
                        "<input type='number' class='form-control' name='prices' required min='0'>" +
                        "</td>" +
                        "<td width='150'>" +
                        "<input type='number' class='form-control' name='quantities' required min='0'>" +
                        "</td>" +
                        "<td style='text-align:center'>" +
                        "<i class='fa fa-times' style='color:black' onclick='deleteFunc(this)'></i>" +
                        "</td>" +
                        "</tr>";

                $('#pdetails tbody').append(newRow);
            }
        </script>
    </body>
</html>