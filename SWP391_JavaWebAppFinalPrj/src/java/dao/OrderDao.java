/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.UsersDao.getUserById;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.User;

public class OrderDao {

    private static final String ADD_ORDER = "INSERT INTO orders (user_id, shippingunit_id, voucher_code, total, shipping_method, payment_method, status, receiver_name, receiver_phone, receiver_address, order_date, cancel_reason) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String ADD_ORDER_DETAIL = "INSERT INTO orderdetail (order_id, product_id, quantity) VALUES (?, ?, ?)";
    private static final String GET_ORDER_DETAILS = "SELECT od.*, p.* FROM orderdetail od INNER JOIN products p ON od.product_id = p.product_id WHERE od.order_id = ?";
    private static final String GET_ORDER_BY_ID = "SELECT * FROM orders WHERE order_id = ?";
    private static final String GET_ORDERS_BY_USER_ID = "SELECT * FROM orders WHERE customer_id = ?";
    private static final String GET_ORDER_AND_DETAILS_BY_ID = "SELECT o.*,  p.product_id, p.img, p.name, p.price,  od.quantity, od.id FROM orders o "
            + "  JOIN orderdetail od ON o.order_id = od.orderID "
            + "   JOIN products p ON od.productID = p.product_id "
            + "WHERE o.order_id = ?";
    private static final String UPDATE_ORDER_STATUS = "UPDATE orders SET status = ? WHERE order_id = ?";

    public int addOrderDetail(OrderDetail orderDetail) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement addOrderDetailStmt = con.prepareStatement(ADD_ORDER_DETAIL, Statement.RETURN_GENERATED_KEYS)) {
            addOrderDetailStmt.setInt(1, orderDetail.getOrder().getOrderId());
            addOrderDetailStmt.setInt(2, orderDetail.getProduct().getProductID());
            addOrderDetailStmt.setInt(3, orderDetail.getQuantity());

            int affectedRows = addOrderDetailStmt.executeUpdate();

            if (affectedRows == 0) {
                return -1; // Thất bại khi thêm chi tiết đơn hàng
            }

            try (ResultSet generatedKeys = addOrderDetailStmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // Trả về ID của chi tiết đơn hàng mới được tạo ra
                } else {
                    return -1; // Không có ID được tạo ra
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int checkout(Order order) {
        try (Connection con = SQLConnection.getConnection()) {
            con.setAutoCommit(false);

            // Thêm đơn hàng
            try (PreparedStatement addOrderStmt = con.prepareStatement(ADD_ORDER, Statement.RETURN_GENERATED_KEYS)) {
                addOrderStmt.setInt(1, order.getUser().getUserID());
                addOrderStmt.setInt(2, order.getShippingUnitId());
                addOrderStmt.setString(3, order.getVoucherCode());
                addOrderStmt.setDouble(4, order.getTotal());
                addOrderStmt.setString(5, order.getShippingMethod());
                addOrderStmt.setString(6, order.getPaymentMethod());
                addOrderStmt.setString(7, order.getStatus());
                addOrderStmt.setString(8, order.getReceiverName());
                addOrderStmt.setString(9, order.getReceiverPhone());
                addOrderStmt.setString(10, order.getReceiverAddress());
                addOrderStmt.setDate(11, java.sql.Date.valueOf(order.getOrderDate()));
                addOrderStmt.setString(12, order.getCancelReason());

                int affectedRows = addOrderStmt.executeUpdate();

                if (affectedRows == 0) {
                    con.rollback();
                    return -1; // Thất bại khi thêm đơn hàng
                }

                try (ResultSet generatedKeys = addOrderStmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int orderId = generatedKeys.getInt(1);

                        // Thêm các chi tiết đơn hàng
                        for (OrderDetail orderDetail : order.getOrderDetails()) {
                            try (PreparedStatement addOrderDetailStmt = con.prepareStatement(ADD_ORDER_DETAIL)) {
                                addOrderDetailStmt.setInt(1, orderId);
                                addOrderDetailStmt.setInt(2, orderDetail.getProduct().getProductID());
                                addOrderDetailStmt.setInt(3, orderDetail.getQuantity());
                                addOrderDetailStmt.executeUpdate();
                            }
                        }

                        con.commit();
                        return orderId; // Thành công, trả về ID của đơn hàng mới
                    } else {
                        con.rollback();
                        return -1; // Không có ID được tạo ra
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

// quan trong
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> orders = new ArrayList<>();

        try (Connection con = SQLConnection.getConnection();
                PreparedStatement getOrdersStmt = con.prepareStatement(GET_ORDERS_BY_USER_ID)) {
            getOrdersStmt.setInt(1, userId);

            try (ResultSet rs = getOrdersStmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setOrderId(rs.getInt("order_id"));
                    order.setUser(getUserById(rs.getInt("customer_id"))); // Lấy thông tin người dùng
                    order.setShippingUnitId(rs.getInt("shippingunit_id"));
                    order.setVoucherCode(rs.getString("voucher_code"));
                    order.setTotal(rs.getDouble("total"));
                    order.setShippingMethod(rs.getString("shipping_method"));
                    order.setPaymentMethod(rs.getString("payment_method"));
                    order.setStatus(rs.getString("status"));
                    order.setReceiverName(rs.getString("receiver_name"));
                    order.setReceiverPhone(rs.getString("receiver_phone"));
                    order.setReceiverAddress(rs.getString("receiver_adress"));
                    //   order.setOrderDate(rs.getObject("order_date", LocalDate.class));
                    order.setCancelReason(rs.getString("cancel_reason"));
                    // Lấy và hiển thị các chi tiết đơn hàng
                    //List<OrderDetail> orderDetails = getOrderDetails(order.getOrderId());
                    // if (orderDetails != null && !orderDetails.isEmpty()) {
                    //     order.setOrderDetails(orderDetails);
                    // }

                    orders.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;

    }

    /*public Order getOrderDetailByOrderId(int orderId) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement getOrderStmt = con.prepareStatement(GET_ORDER_BY_ID)) {
            getOrderStmt.setInt(1, orderId);
            try (ResultSet rs = getOrderStmt.executeQuery()) {
                if (rs.next()) {
                    Order order = extractOrderFromResultSet(rs);
                    List<OrderDetail> orderDetails = getOrderDetails(orderId);
                    order.setOrderDetails(orderDetails);
                    return order;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }*/
    private Order extractOrderFromResultSet(ResultSet rs) {
        try {
            Order order = new Order();
            order.setOrderId(rs.getInt("order_id"));
            order.setUser(getUserById(rs.getInt("customer_id")));
            order.setShippingUnitId(rs.getInt("shippingunit_id"));
            order.setVoucherCode(rs.getString("voucher_code"));
            order.setTotal(rs.getDouble("total"));
            order.setShippingMethod(rs.getString("shipping_method"));
            order.setPaymentMethod(rs.getString("payment_method"));
            order.setStatus(rs.getString("status"));
            order.setReceiverName(rs.getString("receiver_name"));
            order.setReceiverPhone(rs.getString("receiver_phone"));
            order.setReceiverAddress(rs.getString("receiver_adress"));
            String orderDateString = rs.getString("order_date");
            LocalDate orderDate = LocalDate.parse(orderDateString);
            order.setOrderDate(orderDate);
            order.setCancelReason(rs.getString("cancel_reason"));
            return order;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /*public List<OrderDetail> getOrderDetails(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement getOrderDetailsStmt = con.prepareStatement(GET_ORDER_DETAILS)) {
            getOrderDetailsStmt.setInt(1, orderId);
            try (ResultSet rs = getOrderDetailsStmt.executeQuery()) {
                while (rs.next()) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setId(rs.getInt("id"));
                    orderDetail.setQuantity(rs.getInt("quantity"));
                    Product product = new Product();
                    product.setProductID(rs.getInt("product_id"));
                    product.setProductName(rs.getString("name"));
                    product.setPrice(rs.getFloat("price"));
                    product.setProductImg(rs.getString("img"));

                    orderDetail.setProduct(product);
                    orderDetails.add(orderDetail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderDetails;
    }*/
// quantrong
    public Order getOrderAndDetailsById(int orderId) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement getOrderAndDetailsStmt = con.prepareStatement(GET_ORDER_AND_DETAILS_BY_ID)) {
            getOrderAndDetailsStmt.setInt(1, orderId);

            try (ResultSet rs = getOrderAndDetailsStmt.executeQuery()) {
                Order order = null;
                List<OrderDetail> orderDetails = new ArrayList<>();

                while (rs.next()) {
                    if (order == null) {
                        order = extractOrderFromResultSet(rs);
                    }

                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setId(rs.getInt("id"));
                    orderDetail.setQuantity(rs.getInt("quantity"));

                    Product product = new Product();
                    product.setProductID(rs.getInt("product_id"));
                    product.setProductName(rs.getString("name"));
                    product.setPrice(rs.getFloat("price"));
                    product.setProductImg(rs.getString("img"));

                    orderDetail.setProduct(product);
                    orderDetails.add(orderDetail);
                }

                if (order != null) {
                    order.setOrderDetails(orderDetails);
                }

                return order;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean updateOrderStatus(int orderId, String newStatus) throws ClassNotFoundException {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement updateStatusStmt = con.prepareStatement(UPDATE_ORDER_STATUS)) {
            updateStatusStmt.setString(1, newStatus);
            updateStatusStmt.setInt(2, orderId);

            int affectedRows = updateStatusStmt.executeUpdate();

            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) throws ClassNotFoundException {
        Order order = new Order();
        order.setOrderId(7); // Thay thế 1 bằng order_id thích hợp
        Product product = new Product();
        product.setProductID(8); // Thay thế 1 bằng product_id thích hợp
        OrderDetail orderDetail = new OrderDetail(order, product, 2);

        // Gọi phương thức để thêm OrderDetail vào cơ sở dữ liệu
        OrderDao orderDao = new OrderDao();
        int orderDetailId = orderDao.addOrderDetail(orderDetail);

        // Kiểm tra kết quả
        if (orderDetailId != -1) {
            System.out.println("Đã thêm chi tiết đơn hàng mới với ID: " + orderDetailId);
        } else {
            System.out.println("Đã xảy ra lỗi khi thêm chi tiết đơn hàng.");
        }
    }
}
