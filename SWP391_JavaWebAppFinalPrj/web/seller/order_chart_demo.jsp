<%-- 
    Document   : order_chart_demo
    Created on : 17-Mar-2024, 00:15:59
    Author     : ASUS
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">
            <title>Tổng quan phân tích bán hàng</title>
            <!-- Include Chart.js library -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
        </head>
        <body>
            <h1>Tổng quan</h1>
            <table>
                <tr>
                    <td>Tổng doanh thu</td>
                    <td>Tổng số đơn hàng</td>
                    <td>Doanh thu trên mỗi đơn hàng</td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
            </table>
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
                                label: 'Order Counts',
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
                                        max: 25,
                                        stepSize: 2
                                    }
                                }]
                        }
                    }
                });
        </script>
    </body>
</html>
