<%-- 
    Document   : order_chart_demo
    Created on : 17-Mar-2024, 00:15:59
    Author     : ASUS
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Tổng quan phân tích bán hàng</title>
        <!-- CSS here -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <main style="width: 90%; margin: auto;">
                <div class="row justify-content-between" style="margin: 10px;">
                    <form action="ordercontroller" method="get" class="d-flex justify-content-between">
                        <div>
                            <label for="month_year">Khung thời gian</label>
                        <input id="month_year" name="month_year" type="month" value="${fn:substring(requestScope.month.toString(),0,7)}"/>
                        <button type="submit">Đổi</button>
                        </div>
                        <div>
                            <button formmethod="post" type="submit" class="button btn-success">Xuất chi tiết doanh thu</button>
                        </div>
                    </form>
                </div>
            <h2>Tổng quan tháng ${requestScope.month.getMonthValue()} năm ${month.getYear()}</h2>
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

            <h2>Biểu đồ lượng order nhận được một ngày trong tháng</h2>
            <div style="width: 75%;">
                <canvas id="scatterChart"></canvas>
            </div>
        </main>
        <!-- Include Chart.js library -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
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
