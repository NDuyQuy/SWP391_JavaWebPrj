<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade</title>
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
        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/default.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>
    <body>
        <main>
            
            <jsp:include page="header.jsp"></jsp:include>
            <!-- breadcrumb-area-start -->
            <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="breadcrumb-text text-center">
                                <h1>Thông báo</h1>
                                <ul class="breadcrumb-menu">
                                    <li><a href="Home">home</a></li>
                                    <li><span>Notification</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- breadcrumb-area-end -->

            <section class="profile-area pt-30 pb-45" style="padding-bottom: 280px;">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-10 col-lg-10 offset-1">
                            <c:if test="${allNotifications eq null}">
                                <div style="display: block; text-align: center; margin: auto">
                                    <img class="mb-20 mt-60" src="img/icon/notification.png" style=" width: 250px;">
                                    <h3>Không có thông báo nào.</h3>
                                </div>


                            </c:if>
                            <c:if test="${allNotifications != null}">
                                <table>
                                    <c:forEach var="noti" items="${allNotifications}">
                                        <tr>
                                            <td>
                                                ${noti.content}
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </c:if>

                        </div>
                    </div>
                </div>
            </section>
            
            <jsp:include page="footer.jsp"></jsp:include>
        </main>
    </body>
</html>
