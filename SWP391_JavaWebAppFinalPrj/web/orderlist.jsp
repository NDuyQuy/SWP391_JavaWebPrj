<%@ page import="java.util.List" %>
<%@ page import="dao.OrderDao" %>
<%@ page import="model.Order" %>
<%@ page import="model.OrderDetail" %>
<%@ page import="model.User" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Orders</title>
    <!-- Include your CSS and other headers if needed -->
</head>
<body>
    <%-- Include your header.jsp --%>
    <%@ include file="header.jsp" %>

    <div id="content" style="margin: 20px;">
        <h2>User Orders</h2>

        <%-- Get the user from the session (assuming you have a session attribute "user") --%>
        <c:set var="user" value="${sessionScope.user}" />

        <%-- Check if the user is logged in --%>
        <c:if test="${user ne null}">
            <%-- Use OrderDao to get user orders --%>
            <%
                OrderDao orderDao = new OrderDao();
                List<Order> userOrders = orderDao.getOrdersByUserId(user.getUserId());
            %>

            <%-- Display user orders --%>
            <c:if test="${not empty userOrders}">
                <ul>
                    <c:forEach var="order" items="${userOrders}">
                        <li>
                            Order ID: ${order.getOrderId}<br>
                            Order Date: ${order.getOrderDate}<br>
                            Order Total: ${order.getOrderTotal}<br>

                            <%-- Provide a link to view order details --%>
                            <a href="OrderDetail.jsp?orderId=${order.getOrderId}">View Details</a>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>

            <%-- If the user has no orders --%>
            <c:if test="${empty userOrders}">
                <p>No orders found for this user.</p>
            </c:if>
        </c:if>

        <%-- If the user is not logged in --%>
        <c:if test="${user eq null}">
            <p>Please log in to view your orders.</p>
        </c:if>
    </div>

    <%-- Include your footer or other content if needed --%>

</body>
</html>
