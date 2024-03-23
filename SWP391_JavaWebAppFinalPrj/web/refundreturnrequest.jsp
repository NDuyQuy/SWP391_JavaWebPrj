<%@page import="model.OrderDetail"%>
<%@page import="dao.OrdersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="model.CartDetail" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.UsersDao" %>
<%@ page import="model.Users" %>

<html class="no-js" lang="zxx">


    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> My Shopping Cart</title>
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
    </head>
    <body>

        <jsp:include page="header.jsp"></jsp:include>
        <% int orderDetailId = (int) request.getAttribute("orderDetailId"); %>

        <%-- Tạo một đối tượng OrderDetailDAO và sử dụng nó để lấy chi tiết đơn hàng --%>
        <% OrdersDao orderDetailDAO = new OrdersDao(); %>
        <% OrderDetail orderDetail = orderDetailDAO.getOrderDetailById(orderDetailId);%>
        <h2>Thông tin sản phẩm trả hàng/hoàn tiền</h2>
        <div>
            <p><strong>ID sản phẩm:</strong> <%= orderDetail.getProductID()%></p>
            <p><strong>Số lượng:</strong> <%= orderDetail.getQuantity()%></p>
            <p><strong>Giá:</strong> <%= orderDetail.getTotalPrice()%></p>
        </div>

        <h2>Lý do trả hàng/hoàn tiền</h2>
        <form action="ReturnRequestServlet" method="post">
            <input type="hidden" name="orderDetailId" value="<%= request.getAttribute("orderDetailId")%>">
            <div>
                <label for="cancelReason">Chọn lý do:</label>
                <select name="cancelReason" id="cancelReason">
                    <option value="Lỗi sản phẩm">Lỗi sản phẩm</option>
                    <option value="Không đúng kích thước">Không đúng kích thước</option>
                    <option value="Không hài lòng về chất lượng">Không hài lòng về chất lượng</option>
                    <option value="Sản phẩm không đúng mô tả">Sản phẩm không đúng mô tả</option>
                    <option value="Sản phẩm không phù hợp với nhu cầu">Sản phẩm không phù hợp với nhu cầu</option>
                </select>
            </div>
            <button type="submit">Gửi yêu cầu</button>
        </form>
    </main>
    <jsp:include page="footer.jsp"></jsp:include>
</script>
<!-- JS here -->
<script src="js/vendor/jquery-1.12.4.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
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

<!-- Mirrored from wphix.com/template/vue/vue/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 21 Oct 2023 08:30:39 GMT -->
</html>