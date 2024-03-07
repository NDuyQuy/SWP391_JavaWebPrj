<%-- 
    Document   : shopcategory_management
    Created on : Feb 27, 2024, 8:49:17 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade Shop Category Management</title>
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
    </head>
    <body>
        <jsp:include page="../header.jsp"></jsp:include>

            <main>
                <!-- breadcrumb-area-start -->
                <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-text text-center">
                                    <h1>Category Management</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- breadcrumb-area-end -->

                <!-- login Area Strat-->
                <section class="login-area pt-100 pb-100">
                    <jsp:useBean id="shop_categories" scope="session" class="java.util.ArrayList" />
                    <div>
                        <table class="table table-bordered">
                            <thead>
                                <tr> 
                                    <th>Category ID</th> 
                                    <th>Tên Category</th>
                                    <th>Thuộc ngành</th>
                                    <th>Sửa</th>
                                    <th>Xóa</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <c:forEach var="s" items="${shop_categories}">
                                    <tr> 
                                        <td><c:out value="${s.categoryID}"/></td>
                                        <td><c:out value="${s.categoryName}"/></td>
                                        <td><c:out value="${s.mCate.categoryName}"/></td>
                                        <td>
                                            
                                            <a class="edit-link" style="color: blue; cursor: pointer;" onclick="openPopup('edit',${s.categoryID})">Edit</a>
                                        </td>
                                        <td>
                                            <a class="delete-link" style="color: red; cursor: pointer;" onclick="openPopup('delete',${s.categoryID})">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody> 
                        </table>
                    </div>
                    <button type="button" class="btn btn-primary" onclick="openPopup('add')">
                        Add New Category
                    </button>
                    <!-- Add Category Popup -->
                    <div class="modal" id="addPopup">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Add New Category</h4>
                                    <button type="button" class="close" data-dismiss="modal" onclick="closePopup('add')">&times;</button>
                                </div>

                                <!-- Modal Body -->
                                <div class="modal-body">
                                    <form action="shopcategorycontroller" method="post">
                                        <div class="form-group">
                                            <input type="hidden" name="act" value ="addnew">
                                            <label for="addCategoryName">Category Name:</label>
                                            <input type="text" id="addCategoryName" name="categoryName" class="form-control" required> <br>
                                            <select name="a_mc"class="form-control">
                                                <c:forEach var="s" items="${sessionScope.main_category_list}">
                                                    <option value="${s.categoryID}">${s.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-success">Add</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closePopup('add')">Cancel</button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- Edit Category Popup -->
                    <div class="modal" id="editPopup">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Edit Category</h4>
                                    <button type="button" class="close" data-dismiss="modal" onclick="closePopup('edit')">&times;</button>
                                </div>
                                <!-- Modal Body -->
                                <div class="modal-body">
                                    <form action="shopcategorycontroller" method="post">
                                        <div class="form-group">
                                            <input type="hidden" name="act" value ="edit">
                                            <label for="editCategoryName">Category Name:</label>
                                            <input type="text" id="editCategoryName" name="categoryName" class="form-control" required>        <br>
                                            <!-- Hidden input to store the category ID -->
                                            <select name="e_mc"class="form-control">
                                                <c:forEach var="s" items="${sessionScope.main_category_list}">
                                                    <option value="${s.categoryID}">${s.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                            <input type="hidden" name="categoryId" id="editCategoryId">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Edit</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closePopup('edit')">Cancel</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Delete Category Popup -->
                    <div class="modal" id="deletePopup">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Delete Category</h4>
                                    <button type="button" class="close" data-dismiss="modal" onclick="closePopup('delete')">&times;</button>
                                </div>
                                <!-- Modal Body -->
                                <div class="modal-body">
                                    <form action="shopcategorycontroller" method="post">
                                        <div class="form-group">
                                            <input type="hidden" name="act" value ="delete">
                                            <p class="form-control">Do you sure you want to delete this?</p>
                                            <input type="hidden" name="categoryId" id="deleteCategoryId">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Yes</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closePopup('delete')">Cancel</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

            </section>
            <!-- login Area End-->


        </main>

        <jsp:include page="../footer.jsp"></jsp:include>
        <!-- JavaScript to control the display of the popups -->
        <script>
            function openPopup(type, categoryId,categoryName) {
                if (type === 'edit' ) {
                    // Set the category ID in the edit popup
                    document.getElementById('editCategoryId').setAttribute('value', categoryId);
                }else if (type === 'delete'){
                    document.getElementById('deleteCategoryId').setAttribute('value', categoryId);
                }
                $('#' + type + 'Popup').modal('show');
            }

            function closePopup(type) {
                $('#' + type + 'Popup').modal('hide');
            }
        </script>
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
    </body>
</html>
