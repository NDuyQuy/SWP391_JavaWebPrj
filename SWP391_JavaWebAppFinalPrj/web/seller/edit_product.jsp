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
                    <div class="col-md-8">
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
                                <label for="productDetail">Phân loại:</label>
                                <br>
                                <a href="javascript:void(0)" id="add_row" class="btn btn-secondary border" onclick="addRow();checkDelete()">Thêm phân loại</a>
                                <table id="pdetails" border="1">
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
                                        <c:forEach var="pd" items="${}">
                                            <tr>
                                                <td>
                                                    <img style="width: 90px; height: 90px; object-fit: contain" id="img-${pd.id}" src="${pd.img}" onclick="$('#detail-img-1').click()">
                                                    <input type="file" accept="image/*" id="detail-img-${pd.id}" name="detail-img-${pd.id}" style="display: none;" class="form-control" onchange="readURL(this)" required="">
                                                </td>
                                                <td><input value="${pd.name}" type="text" class="form-control" name="detail-name-${pd.id}" required=""></td>
                                                <td><input type="number" value="${pd.price}" class="form-control" name="detail-price-${pd.id}" required=""></td>
                                                <td><input type="number" value="${pd.quantity}" class="form-control" name="detail-quantity-${pd.id}" required=""></td>
                                                <td style='text-align:center'><i class='fa fa-times' style='color:black' onclick='deleteFunc(this);checkDelete()'></i></td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <div class="form-group">
                                <label for="description">Mô tả:</label>
                                <textarea class="form-control" id="description" name="description" rows="3">${product.description}</textarea>
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
                (pd_id) + "' src='default/default.jpg' onclick='$(`#detail-img-" + (pd_id) + 
                "`).click()'><input type='file' accept='image/*' id='detail-img-" + (pd_id) + 
                "' name='detail-img-" + (pd_id) + "' style='display: none;' class='form-control' onchange='readURL(this)' required></td><td>" +
                "<input value='Default' type='text' class='form-control' name='detail-name-" + (pd_id) +
                "' required></td><td><input type='number' class='form-control' name='detail-price-" + (pd_id) +
                "' required></td><td><input type='number' class='form-control' name='detail-quantity-" + (pd_id) +
                "' required></td><td style='text-align:center'><i class='fa fa-times' style='color:black' id='dlt-" + pd_id + 
                "' onclick='deleteFunc(this);checkDelete()'></i></td></tr>");
                                        
            }
                                    
            function checkDelete(){
                if($('#pdetails tbody tr').length === 1){
                    $('#pdetails tbody tr td i').remove();
                } else{
                    if($('#pdetails tbody tr:first').find('td:nth-child(5) i').length == 0){
                        $('#pdetails tbody tr:first').find('td:nth-child(5)').append("<i class='fa fa-times' style='color:black' id='dlt-" + pd_id + 
                "' onclick='deleteFunc(this);checkDelete()'></i>");
                    }
                    
                }
            }
        </script>
    </body>
</html>
