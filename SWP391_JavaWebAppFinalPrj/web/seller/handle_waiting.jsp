<%-- 
    Document   : handle_waiting_order
    Created on : 18-Mar-2024, 18:04:05
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade Custom Order Management</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Place favicon.ico in the root directory -->
        <!-- CSS here -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <main>
                <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-text text-center">
                                    <h1>Đơn hàng đang chờ bạn xử lý</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="login-area pt-100 pb-100" style="width: 80%; margin: auto;">
                <jsp:useBean id="noti" scope="session" class="java.util.ArrayList" />
                <div>
                    <table class="table table-bordered">
                        <thead>
                            <tr> 
                                <th>Id đơn hàng</th> 
                                <th>Ngày đặt hàng</th>
                                <th>Tình trạng đơn hàng</th>
                                <th>Yêu cầu phương thức vận chuyển</th>
                                <th>Chi tiết</th>
                            </tr>
                        </thead>
                        <tbody> 
                            <c:forEach var="c" items="${noti}">
                                <tr> 
                                    <td><c:out value="${c.order_id}"/></td>
                                    <td><fmt:formatDate value="${c.order_date}" pattern="HH:mm dd/MM/yyyy"/></td>
                                    <td><c:out value="${c.status}"/></td>
                                    <td><c:out value="${c.shipping_method}"/></td>
                                    <td><a href="OrderDetail?id=${c.order_id}" style="color: blue">Chi tiết</a></td>
                                </tr>
                            </c:forEach>
                        </tbody> 
                    </table>
                </div>
            </section>
        </main>

        <!-- JS here-->
        <script src="${pageContext.request.contextPath}/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>