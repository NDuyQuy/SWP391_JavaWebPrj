<%-- 
    Document   : shopproduct_management
    Created on : 06-Mar-2024, 17:41:57
    Author     : ASUS
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Product Management</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.html">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    <body>
        <!-- header start -->
        <jsp:include page="header.jsp"></jsp:include>
        <!-- header end -->
            <main>
                <section style="margin: 10px;">
                    <div class="container">
                        <div class="row d-flex justify-content-between align-items-center">
                            <div>
                                <h3>Sản phẩm của shop</h3>
                            </div>
                            <div>
                                <a href="productcontroller?open=create" class="btn btn-primary">Thêm sản phẩm</a>
                            </div>
                        </div>
                    </div>
                </section>
                <section style="width: 95%;margin: auto">
                    <table class="table table-bordered">
                        <thead>
                            <tr> 
                                <th class="text-center">No</th>
                                <th class="text-center">Tên sản phẩm</th>
                                <th class="text-center">Danh mục</th>
                                <th class="text-center">Chi tiết sản phẩm</th>
                                <th class="text-center">Sửa thông tin sản phẩm</th>
                            </tr>
                        </thead>
                        <tbody> 
                        <jsp:useBean id="products" scope="request" class="java.util.ArrayList" />
                        <c:forEach var="p" items="${products}" varStatus="loop">
                            <tr> 
                                <td class="text-center"><c:out value="${loop.index + 1}"/></td>
                                <td class="text-left"><c:out value="${p.name}"/></td>
                                <td class="text-left"><c:out value="${p.shopCategory.name}"/></td>
                                <td class="text-center"><a class="text-decoration-none" href="productcontroller?open=detail&p_id=${p.product_id}" style="color: orange; cursor: pointer;">Detail</a></td>
                                <td class="text-center">
                                    <a class="text-decoration-none" href="productcontroller?open=edit&p_id=${p.product_id}" style="color: blue; cursor: pointer;">Edit</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody> 
                </table> 
            </section>
        </main>            

        <!-- Delete Category Popup-->
        <div class="modal" id="deletePopup">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Delete Product</h4>
                        <button type="button" class="close" data-dismiss="modal" onclick="closePopup('delete')">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="productcontroller" method="post">
                            <div class="form-group">
                                <input type="hidden" name="act" value ="delete">
                                <p class="form-control">Do you sure you want to delete this product?</p>
                                <input type="hidden" name="productID" id="productID">
                            </div>
                            <button type="submit" class="btn btn-primary">Yes</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closePopup('delete')">Cancel</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>  
        <!-- JavaScript to control the display of the popups -->
        <script>
            function openPopup(type, productID) {
                if (type === 'delete') {
                    document.getElementById('productID').setAttribute('value', productID);
                }
                $('#' + type + 'Popup').modal('show');
            }

            function closePopup(type) {
                $('#' + type + 'Popup').modal('hide');
            }
        </script>
        <!-- JS here -->
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