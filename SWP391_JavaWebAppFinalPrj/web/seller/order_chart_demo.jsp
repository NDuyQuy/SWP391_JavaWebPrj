<%-- 
    Document   : order_chart_demo
    Created on : 17-Mar-2024, 00:15:59
    Author     : ASUS
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Tổng quan phân tích bán hàng</title>
        <!-- CSS here -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Include Chart.js library -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
    </head>
    <body>
        <div class="row justify-content-between" style="margin: 10px;">
            <form action="ordercontroller">
                <label for="month_year">Khung thời gian</label>
                <input id="month_year" name="month_year" type="month"/>
                <button type="submit">Đổi</button>
            </form>
        </div>
        <h1>Tổng quan</h1>
        <jsp:useBean id="statistics" scope="request" class="java.util.ArrayList" />
        <c:if test="${statistics.size() gt 0}">
            <table class="table table-bordered">
                <tr>
                    <td class="text-center">Tổng doanh thu(vnđ)</td>
                    <td class="text-center">Tổng số đơn hàng</td>
                    <td class="text-center">Doanh thu trên mỗi đơn hàng(vnđ)</td>
                    <td class="text-center">Tổng số sản phẩm bán ra</td>
                </tr>
                <tr>
                    <c:forEach var="s" items="${statistics}">
                        <td class="text-center">${s}</td>
                    </c:forEach>
                </tr>
            </table>
        </c:if>

        <h1>Biểu đồ</h1>
        <div style="width: 75%;">
            <canvas id="scatterChart"></canvas>
        </div>

        <script>
            // Retrieve JSON data from request attribute
            var jsonData = '<%= request.getAttribute("jsonData")%>';
            // Parse JSON data
            var data = JSON.parse(jsonData);

            // Render scatter chart
            var ctx = document.getElementById('scatterChart').getContext('2d');
            var scatterChart = new Chart(ctx, {
                type: 'scatter',
                data: {
                    datasets: [{
                            label: 'Số lượng order trong ngày',
                            data: data,
                            backgroundColor: 'rgba(75, 192, 192, 0.5)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        xAxes: [{
                                type: 'linear',
                                position: 'bottom',
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Hour'
                                },
                                ticks: {
                                    min: 0,
                                    max: ${requestScope.dim},
                                    stepSize: 1
                                }
                            }],
                        yAxes: [{
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Order Count'
                                },
                                ticks: {
                                    min: 0,
                                    max: 24,
                                    stepSize: 2
                                }
                            }]
                    }
                }
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
