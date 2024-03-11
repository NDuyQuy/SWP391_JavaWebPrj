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
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.OrderDetail;
import model.Product;

public class OrderDao {

    private static final String ADD_ORDER = "INSERT INTO orders (user_id, shippingunit_id, voucher_code, total, shipping_method, payment_method, status, receiver_name, receiver_phone, receiver_address, order_date, cancel_reason) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String ADD_ORDER_DETAIL = "INSERT INTO orderdetail (order_id, product_id, quantity) VALUES (?, ?, ?)";
    private static final String GET_ORDER_DETAILS = "SELECT od.*, p.* FROM orderdetail od INNER JOIN products p ON od.productID = p.product_id WHERE od.orderID = ?";
    private static final String GET_ORDER_BY_ID = "SELECT * FROM orders WHERE order_id = ?";
    private static final String GET_ORDERS_BY_USER_ID = "SELECT * FROM orders WHERE customer_id = ?";

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

    public Order getOrderDetailByOrderId(int orderId) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement getOrderStmt = con.prepareStatement(GET_ORDER_BY_ID)) {
            getOrderStmt.setInt(1, orderId);
            try (ResultSet rs = getOrderStmt.executeQuery()) {
                if (rs.next()) {
                    return extractOrderFromResultSet(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<OrderDetail> getOrderDetails(int orderId) {
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
                    product.setQuantity(rs.getInt("product_quantity"));

                    orderDetail.setProduct(product);
                    orderDetails.add(orderDetail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    private Order extractOrderFromResultSet(ResultSet rs) {
        try {
            Order order = new Order();
            order.setOrderId(rs.getInt("order_id"));
            // Điền thông tin khác của đơn hàng

            return order;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

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
                    //  order.setOrderDate(rs.getObject("order_date", LocalDate.class));
                    order.setCancelReason(rs.getString("cancel_reason"));
                    // Lấy và hiển thị các chi tiết đơn hàng
                    List<OrderDetail> orderDetails = getOrderDetails(order.getOrderId());
                    if (orderDetails != null && !orderDetails.isEmpty()) {
                        order.setOrderDetails(orderDetails);
                    }

                    orders.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;

    }

    public static void main(String[] args) {
        OrderDao orderDao = new OrderDao();
        List<Order> orders = orderDao.getOrdersByUserId(27);
        orders.forEach(System.out::println);
        /*int userId = 27;
        
        OrderDao orderDao = new OrderDao();
        List<Order> orders = orderDao.getOrdersByUserId(userId);
        
        if (orders != null && !orders.isEmpty()) {
        for (Order order : orders) {
        System.out.println("Order ID: " + order.getOrderId());
        // Hiển thị thông tin khác của đơn hàng tại đây
        System.out.println("-------------------------------------");
        
        // Lấy và hiển thị các chi tiết đơn hàng
        List<OrderDetail> orderDetails = orderDao.getOrderDetails(order.getOrderId());
        if (orderDetails != null && !orderDetails.isEmpty()) {
        for (OrderDetail orderDetail : orderDetails) {
        System.out.println("Product ID: " + orderDetail.getProduct().getProductID());
        // Hiển thị thông tin khác của chi tiết đơn hàng tại đây
        System.out.println("-------------------------------------");
        }
        }
        }
        } else {
        System.out.println("Không có đơn hàng nào cho người dùng có ID là " + userId);
        }*/
    }
}
