<%-- 
    Document   : ReturnRequest
    Created on : Mar 21, 2024, 1:55:57 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yêu cầu trả hàng/hoàn tiền/title>
    </head>
    <body>
        <h1>Yêu cầu trả hàng/hoàn tiền</h1>
        <form action="ReturnRequestServlet" method="post">
            <h2>Danh sách sản phẩm trong đơn hàng</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>Hình ảnh sản phẩm</th>
                        <th>Sản phẩm</th>
                        <th>Giá</th>
                        <th>Chọn trả</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Hiển thị danh sách sản phẩm --%>
                <c:forEach var="orderDetail" items="${order.orderDetails}">

                    <tr>
                        <td>${orderDetail.product.getImg()}</td>
                        <td>${orderDetail.product.getName()}</td>
                        <td>${orderDetail.totalPrices}</td>
                        <td>
                            <input type="checkbox" name="returnProduct" value="${orderDetail.id}">
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <h2>Lý do trả hoàn</h2>
            <textarea name="reason" rows="4" cols="50"></textarea>


            <h2>Tổng tiền sản phẩm đã chọn</h2>
            <div id="totalAmount"></div>
            <input type="hidden" id="totalAmountInput" name="refundAmount">
            <input type="submit" value="Gửi yêu cầu" disabled>
        </form>

        <script>
            // Tính tổng tiền của các sản phẩm đã chọn
            var checkboxes = document.querySelectorAll('input[name="returnProduct"]');
            checkboxes.forEach(function (checkbox) {
                checkbox.addEventListener('change', function () {
                    var totalAmount = 0;
                    checkboxes.forEach(function (checkbox) {
                        if (checkbox.checked) {
                            var price = parseInt(checkbox.parentElement.previousElementSibling.textContent);
                            totalAmount += price;
                        }
                    });
                    document.getElementById('totalAmount').textContent = totalAmount;
                    document.getElementById('totalAmountInput').value = totalAmount;

                    var submitButton = document.querySelector('input[type="submit"]');
                    submitButton.disabled = totalAmount <= 0;
                });
            });
        </script>
    </body>
</html>
