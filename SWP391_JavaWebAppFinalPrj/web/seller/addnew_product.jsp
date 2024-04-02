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
        <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link rel="stylesheet" href="../css/fontawesome-all.min.css">
        <link rel="stylesheet" href="../css/flaticon.css">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/imageInput.css">
    </head>
    <body>
        <main>
            <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <h3 class="text-center mb-4">Thêm sản phẩm</h3>
                        <form action="../productcontroller" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="act" value="create">
                            <div class="form-group">
                                <label for="productName">Tên sản phẩm:</label>
                                <input type="text" class="form-control" id="productName" name="productName" maxlength="50" required>
                            </div>
                            <div class="form-group">
                                <label for="category">Thuộc danh mục:</label>
                                <select class="form-control" id="category" name="category" >
                                    <c:forEach var="c" items="${sessionScope.SCategoryList}">
                                        <option value="${c.id}">${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="productDetail">Phân loại:</label>
                                <br>
                                <a href="javascript:void(0)" id="add_row" class="btn btn-secondary border" onclick="addRow()">Thêm phân loại</a>
                                <table id="pdetails" border="1">
                                    <thead>
                                        <tr>
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
                                                <input type="file" accept="image/*" id="detail-img-1" name="detail-img-1" style="display: none;" class="form-control" onchange="readURL(this)" required="">
                                            </td>
                                            <td width="280"><input value="Default" type="text" class="form-control" id="detail-name-1" name="detail-name-1" required=""></td>
                                            <td><input type="number" class="form-control" id="detail-price-1" name="detail-price-1" required=""></td>
                                            <td width="150"><input type="number" class="form-control" id="detail-quantity-1" name="detail-quantity-1" required=""></td>
                                            <td width="70"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="form-group">
                                <label for="description">Mô tả:</label>
                                <textarea class="form-control" id="description" name="description" rows="3" maxlength="200"></textarea>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-success" id="submit-btn">Tạo</button>
                                <a href="../productcontroller" class="btn btn-secondary">Hủy</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <!-- JS here-->
        <script src="../js/vendor/jquery-1.12.4.min.js"></script>
        <script src="../js/jquery-ui.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/imageInput.js"></script>
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
                                                    
                                                    var pd_id = ${ProductDao.getMaxProductDetail()};

                                                    function addRow() {
                                                        pd_id = pd_id + 1;
                                                        $('#pdetails tbody').append("<tr><td><img style='width: 90px; height: 90px; object-fit: contain' id='img-" +
                                                                pd_id + "' src='default/default.jpg' onclick='$(`#detail-img-" +
                                                                pd_id + "`).click()'><input type='file' accept='image/*' id='detail-img-" +
                                                                pd_id + "' name='detail-img-" + pd_id +
                                                                "' style='display: none;' class='form-control' onchange='readURL(this)' required></td><td>" +
                                                                "<input value='Default' type='text' class='form-control' name='detail-name-" + pd_id +
                                                                "' required></td><td><input type='number' class='form-control' name='detail-price-" + pd_id +
                                                                "' required></td><td><input type='number' class='form-control' name='detail-quantity-" + pd_id +
                                                                "' required></td><td style='text-align:center'><i class='fa fa-times' style='color:black' onclick='deleteFunc(this)'></i></td></tr>");
                                                    }
        </script>
    </body>
</html>
