<%-- 
    Document   : order_chart_demo
    Created on : 17-Mar-2024, 00:15:59
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Chart</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h2 class="text-danger">Chart display</h2>
        <canvas id="ordersChart" width="400" height="400"></canvas>
        <script>
        var ordersCountByHour = ${ordersCountByHour}; // Get orders count by hour from the servlet
        
        // Prepare data for the chart
        var hours = Object.keys(ordersCountByHour);
        var counts = Object.values(ordersCountByHour);
        
        var xyValues = Array.from(ordersCountByHour.entries()).map(([key, value]) => [key, value]);
        // Render chart using Chart.js
        var ctx = document.getElementById('ordersChart').getContext('2d');
        var chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: hours,
                datasets: [{
                    label: 'Orders Count by Hour',
                    data: xyValues,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
    </body>
</html>
