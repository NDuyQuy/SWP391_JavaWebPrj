<%-- 
    Document   : AdminBan
    Created on : Feb 27, 2024, 8:49:31 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/AdminServlet?Action=ViewBan"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade Ban/Unban Users</title>
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
                                    <h1>Ban/Unban Users</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- breadcrumb-area-end -->

                <!-- login Area Strat-->
                <section class="login-area pt-100 pb-100">
                    <div class="container">
                    <jsp:useBean id="BL" scope="session" class="java.util.ArrayList" />
                    <div>
                        <table class="table table-bordered">
                            <thead>
                                <tr> 
                                    <th>Username</th> 
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th>Shop name</th>
                                    <th>Report By</th>
                                    <th>Report Count</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody> 
                                <c:forEach var="s" items="${sessionScope.BL}">
                                    <tr> 
                                        <td><c:out value="${s.userName}"/></td>
                                        <td><c:out value="${s.email}"/></td>
                                        <td><c:out value="${s.status}"/></td>
                                        <td><c:out value="${s.shopname}"/></td>
                                        <td><c:out value="${s.reportBy}"/></td>
                                        <td><c:out value="${s.count}"/></td>
                                        <td>
                                            <!-- Edit link with data-id attribute -->
                                            <a class="edit-link" style="color: blue; cursor: pointer;" data-id="${s.userID}" onclick="openPopup('edit',${s.userID},'${s.userName}','${s.reportBy}','${s.date}','${s.reason}','${s.detail}')">Choose Action</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody> 
                        </table>
                    </div>
                    
                    <!-- Edit Category Popup -->
                    <div class="modal" id="editPopup">
                        <div class="modal-dialog  modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Request Detail</h4>
                                    <button type="button" class="close" data-dismiss="modal" onclick="closePopup('edit')">&times;</button>
                                </div>

                                <!-- Modal Body -->
                                <div class="modal-body">
                                    <form action="AdminServlet?Action=ApplyBan" method="post">
                                        <div class="form-group">
                                            <!-- Hidden input to store the category ID -->
                                            <input type="hidden" name="userId" id="userId">
                                            <p>User: </p><p id="user"></p><br>
                                            <p>Report By: </p><p id="reportBy"></p><br>
                                            <p>Time: </p><p id="date"></p><br>
                                            <p>Reason: </p><p id="reason"></p><br>
                                            <p>Detail: </p><p id="detail"></p><br>
                                            <input type="radio" id="activeUser" name="banAction" value="0">
                                            <label for="activeUser">Activate User</label><br>
                                            <input type="radio" id="ban7" name="banAction" value="7">
                                            <label for="ban7">Ban this reported user for 7 days</label><br>
                                            <input type="radio" id="ban14" name="banAction" value="14">
                                            <label for="ban14">Ban this reported user for 14 days</label><br>
                                            <input type="radio" id="ban30" name="banAction" value="30">
                                            <label for="ban30">Ban this reported user for 30 days</label><br>
                                            <input type="radio" id="banInfi" name="banAction" value="999999">
                                            <label for="banInfi">Ban this reported user forever</label><br>
                                        </div>
                                        <button type="submit" name="status" class="btn btn-primary">Apply</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closePopup('edit')">Cancel</button>
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
            function openPopup(type, userId, userName, reportBy, date, reason, detail) {
                if (type === 'edit') {
                    document.getElementById('userId').setAttribute('value', userId);
                    document.getElementById('user').innerHTML = userName;
                    document.getElementById('reportBy').innerHTML = reportBy;
                    document.getElementById('date').innerHTML = date;
                    document.getElementById('reason').innerHTML = reason;
                    document.getElementById('detail').innerHTML = detail;
                }
                $('#' + type + 'Popup').modal('show');
            }

            function closePopup(type) {
                $('#' + type + 'Popup').modal('hide');
            }
        </script>
    </body>
</html>
