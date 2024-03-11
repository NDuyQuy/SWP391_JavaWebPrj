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
        <link rel="stylesheet" href="../css/bootstrap.min.css">
    </head>
    <body>
            <main>
                <div class="container mt-5">
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <h3 class="text-center mb-4">Cập nhật tiến trình hình thành sản phẩm</h3>
                            <form action="CustomOrderController" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="act" value="updateprocess">
                                <div class="form-group">
                                    <div class="form-control">
                                        <label for="productImg">Hình ảnh sản phẩm</label>
                                        <input accept="image/*"type="file" id="productImg" name="productImg" required>
                                    </div>
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
                                    <option value="1">Chưa hoàn thành</option>
                                    <option value="2">Đã hoàn thành</option>
                                    <option value="3">Đã giao cho đơn vị vận chuyển</option>
                                </select>
                            </div>
                                <!--
                            <div class="form-group">
                                <a href="javascript:void(0)" onclick="$('#pro-image').click()" class="btn btn-secondary border">Upload Image</a>
                                <input accept="image/*" type="file" id="pro-image" name="images" style="display: none;" class="form-control" multiple>
                                <div class="preview-images-zone"></div>
                                <small class="form-text text-muted">Tối đa 10 hình ảnh.</small>
                            </div>
                                -->
                            <div class="form-group">
                                <a href="../productcontroller" class="btn btn-secondary">Hủy</a>
                                <button type="submit" class="btn btn-success" id="submit-btn">Cập nhật</button>
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
    </body>
</html>