<%-- 
    Document   : AdminCategory
    Created on : Feb 27, 2024, 8:49:17 PM
    Author     : DELL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/AdminServlet?Action=ViewCategory"/>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade Category Management</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.html">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/fontawesome-all.min.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/meanmenu.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/meanmenu.css">
        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/default.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <link rel="stylesheet" href="css/png.css">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

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
                    <div class="container">
                    <jsp:useBean id="CL" scope="session" class="java.util.ArrayList" />
                    <div>
                        <table class="table table-bordered">
                            <thead>
                                <tr> 
                                    <th>Category ID</th> 
                                    <th>Category Name</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <c:forEach var="s" items="${sessionScope.CL}">
                                    <tr> 
                                        <td><c:out value="${s.id}"/></td>
                                        <td><c:out value="${s.name}"/></td>
                                        <td>
                                            <!-- Edit link with data-id attribute -->
                                            <a class="edit-link" style="color: blue; cursor: pointer;" data-id="${s.getId()}" onclick="openPopup('edit',${s.id},'${s.name}','${s.description}')">Edit</a>
                                        </td>
                                        <td><a class="delete-link" style="color: red; cursor: pointer;" data-id="${s.getId()}" onclick="openPopup('delete',${s.id},'${s.name}','${s.description}')">Delete</a></td>
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
                        <div class="modal-dialog  modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Add New Category</h4>
                                    <button type="button" class="close" data-dismiss="modal" onclick="closePopup('add')">&times;</button>
                                </div>

                                <!-- Modal Body -->
                                <div class="modal-body">
                                    <form action="AdminServlet?Action=AddCategory" method="post">
                                        <div class="form-group">
                                            <label for="addCategoryName">Category Name:</label>
                                            <input type="text" id="addCategoryName" name="categoryName" class="form-control" required>
                                            <label for="addDescription">Short Description:</label>
                                            <textarea class="form-control" rows="4" id="addDescription" name="categoryDescription" placeholder="Enter Description"></textarea>
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
                        <div class="modal-dialog  modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Edit Category</h4>
                                    <button type="button" class="close" data-dismiss="modal" onclick="closePopup('edit')">&times;</button>
                                </div>

                                <!-- Modal Body -->
                                <div class="modal-body">
                                    <form action="AdminServlet?Action=EditCategory" method="post">
                                        <div class="form-group">
                                            <label for="editCategoryName">Category Name:</label>
                                            <input type="text" id="editCategoryName" name="categoryName" class="form-control" required>
                                            <label for="editDescription">Short Description:</label>
                                            <textarea class="form-control" rows="4" id="editDescription" name="categoryDescription" placeholder="Enter Description"></textarea>
                                            <!-- Hidden input to store the category ID -->
                                            <input type="hidden" name="categoryId" id="editCategoryId">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Edit</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closePopup('edit')">Cancel</button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                    
                    <!-- Delete confirm -->
                    <div class="modal" id="deletePopup">
                        <div class="modal-dialog  modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Delete Category?</h4>
                                    <button type="button" class="close" data-dismiss="modal" onclick="closePopup('delete')">&times;</button>
                                </div>

                                <!-- Modal Body -->
                                <div class="modal-body">
                                    <form action="AdminServlet?Action=DeleteCategory" method="post">
                                        <input type="hidden" name="categoryId" id="deleteCategoryId">
                                        <button type="submit" class="btn btn-primary">Delete</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closePopup('delete')">Cancel</button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


            </section>
            <!-- login Area End-->


        </main>

        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Bootstrap JS and jQuery -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- JavaScript to control the display of the popups -->
        <script>
            function openPopup(type, categoryId, categoryName, Description) {
                if (type === 'edit') {
                    // Set the category ID in the edit popup
                    document.getElementById('editCategoryId').setAttribute('value', categoryId);
                    document.getElementById('editCategoryName').setAttribute('value', categoryName);
                    document.getElementById('editDescription').innerHTML = Description;
                }
                if (type === 'delete') {
                    // Set the category ID in the delete popup
                    document.getElementById('deleteCategoryId').setAttribute('value', categoryId);
                }
                $('#' + type + 'Popup').modal('show');
            }

            function closePopup(type) {
                $('#' + type + 'Popup').modal('hide');
            }
        </script>

    </body>
</html>
