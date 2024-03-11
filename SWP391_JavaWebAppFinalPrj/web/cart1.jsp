<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đơn Đặt Hàng</title>
    <!-- Thêm các thư viện, CSS, JavaScript cần thiết tại đây -->
</head>
<body>
    <h1>Thông Tin Người Nhận Hàng</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Tên</th>
                <th>Số Điện Thoại</th>
                <th>Địa Chỉ</th>
                <th>Thao Tác</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>John Doe</td>
                <td>123456789</td>
                <td>123 Main Street</td>
                <td>
                    <button onclick="openEditModal()">Sửa</button>
                </td>
            </tr>
            <!-- Thêm các hàng dữ liệu khác nếu cần -->
        </tbody>
    </table>

    <!-- Modal Sửa Thông Tin Người Nhận Hàng -->
    <div id="editModal" style="display:none;">
        <!-- Form sửa thông tin -->
    </div>

    <h1>Thông Tin Sản Phẩm</h1>
    <table border="1">
        <!-- Bảng 2: Hiển thị thông tin sản phẩm -->
    </table>

    <h1>Chọn Voucher và Thanh Toán</h1>
    <table border="1">
        <!-- Bảng 3: Chọn Voucher và Thanh Toán -->
    </table>

    <script>
        function openEditModal() {
            // Hiển thị modal sửa thông tin
        }
    </script>
</body>
</html>
