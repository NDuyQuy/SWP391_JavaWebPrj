<%-- 
    Document   : update_customorder_process
    Created on : 09-Mar-2024, 13:13:21
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Create Product</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.html">
        <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
        <!-- Place favicon.ico in the root directory -->
        <!-- CSS here -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <main>
            <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h3 class="text-center mb-4">Cập nhật tiến trình hình thành sản phẩm</h3>
                        <form action="CustomOrderController" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="act" value="updateprocess">
                            <input type="hidden" name="orderId" value="${requestScope.orderID}">
                            <div class="form-group">
                                <label for="productImg">Hình ảnh sản phẩm</label>
                                <input accept="image/*"type="file" class="form-control"id="productImg" name="productImg" required>
                            </div>
                            <div class="form-group">
                                <label for="productVideo">Video sản phẩm</label>
                                <input accept="video/mp4"type="file" class="form-control" id="productVideo" name="productVideo" >
                            </div>
                            <div class="form-group">
                                <label for="description">Mô tả:</label>
                                <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="status">Tình trạng sản phẩm</label>
                                <select name="status" id="status" class="form-control">
                                    <option value="Chưa hoàn thành">Chưa hoàn thành</option>
                                    <option value="Đã hoàn thành">Đã hoàn thành</option>
                                    <option value="Đang giao cho đơn vị vận chuyển">Đang giao cho đơn vị vận chuyển</option>
                                    <option value="Đã giao cho đơn vị vận chuyển">Đã giao cho đơn vị vận chuyển</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <a href="CustomOrderController" class="btn btn-secondary">Hủy</a>
                                <button type="submit" class="btn btn-success" id="submit-btn">Cập nhật</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <!-- JS here-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>