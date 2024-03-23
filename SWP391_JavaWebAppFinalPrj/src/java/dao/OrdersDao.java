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
import java.util.*;
import model.*;

/**
 *
 * @author ASUS
 */
public class OrdersDao {

    private static final String GETORDERSBYSHOP = "SELECT * FROM [orders] WHERE [shop_id]=? AND status=N'đã nhận'";
    private static final String GETORDERSBYSHOPANDDATE = "SELECT * FROM [orders] WHERE CONVERT(date, order_date) = ? AND [shop_id]=?";
    private static final String GETORDERSCOUNTBYHOUR = "SELECT DATEPART(HOUR, order_date) AS hour, COUNT(*) AS count FROM [orders] "
            + "WHERE CONVERT(date, order_date) = ? AND [shop_id] = ? AND status=N'đã nhận' GROUP BY DATEPART(HOUR, order_date)";
    private static final String GETORDERSCOUNTBYMONTH = "SELECT DAY(order_date) AS day, COUNT(*) AS count FROM [orders] "
            + "WHERE MONTH(order_date) = ? AND YEAR(order_date) = ? AND [shop_id] = ? AND status=N'đã nhận' GROUP BY DAY(order_date)";
    private static final String CALTOTALREVENUEINAMOTH = "EXEC CalculateTotalRevenueForShopAndMonth @ShopID = ?, @Month = ?, @Year = ?";
    private static final String GETCOMPLETEORDERCOUNTINMONTHOFSHOP = "SELECT COUNT(order_id) as [count] FROM [orders] "
            + "WHERE [shop_id] = ? AND MONTH(order_date) = ? AND YEAR(order_date) = ? AND [status] = N'đã nhận'";
    private static final String GETTOTALPRODUCTSELL = "EXEC GetTotalProductSell @ShopId = ?, @Month = ?, @Year = ?";
    private static final String GETWAITINGORDERS = "SELECT * FROM [orders] WHERE [shop_id]=? AND [status]=N'chờ người bán xác nhận'";

    private static final String GETCUSTOMORDERS = "SELECT co.*,o.status,total FROM [custom_order] co join [orders] o on co.id = o.order_id WHERE o.shop_id = ?";
    private static final String CREATECUSTOMORDER = "EXEC CREATECUSTOMORDERS @ShopId = ?, @Price=?,@ProductName=?, @Deadline = ?";
    private static final String ACCEPTCUSTOMORDER = "UPDATE [orders] set [status]='' ";

    private static final String UPDATE_PROCESS = "INSERT INTO [custom_order_detail]([customorder_id],[process_img],[process_video],[description]) VALUES (?,?,?,?)";

    private static final String UPDATE_STATUS = "UPDATE [orders] SET [status]=? WHERE [order_id]=?";

    //query cua tien
    private static final String GET_ORDER_DETAILS = "SELECT od.*, p.* FROM orderdetail od INNER JOIN products p ON od.product_id = p.product_id WHERE od.order_id = ?";
    private static final String ADD_ORDER = "INSERT INTO orders (customer_id, shop_id, shipping_cost, total, payment_method, status, receiver_name, receiver_phone, receiver_address, shipping_method, type, voucher_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String ADD_ORDER_DETAIL = "INSERT INTO orderdetail (orderID, productID, quantity, cancel_reason, totalPrice) VALUES (?, ?, ?, NULL, ?)";
    private static final String GET_ORDER_BY_ID = "SELECT * FROM orders WHERE order_id = ?";
    private static final String GET_ORDERS_BY_USER_ID = "SELECT * FROM orders WHERE customer_id = ?";
    private static final String GET_ORDER_AND_DETAILS_BY_ID = "SELECT o.*,  p.product_id, p.img, p.name, p.price,  od.quantity, od.id FROM orders o "
            + "  JOIN orderdetail od ON o.order_id = od.orderID "
            + "   JOIN products p ON od.productID = p.product_id "
            + "WHERE o.order_id = ?";
    private static final String UPDATE_ORDER_STATUS = "UPDATE orders SET status = ? WHERE order_id = ?";
    private static final String REQUEST_RETURN = "UPDATE orderdetail SET cancel_reason = ? WHERE id = ?";
    private static final String GET_ORDER_DETAIL_BY_ID = "SELECT * FROM orderdetail WHERE id = ?";

    public static OrderDetail getOrderDetailById(int orderDetailId) {
        OrderDetail orderDetail = null;
        

        try (Connection con = SQLConnection.getConnection();
                PreparedStatement pstmt = con.prepareStatement(GET_ORDER_DETAIL_BY_ID)) {
            pstmt.setInt(1, orderDetailId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    orderDetail = new OrderDetail();
                    orderDetail.setId(rs.getInt("id"));
                    orderDetail.setOrderID(rs.getInt("orderID"));
                    orderDetail.setProductID(rs.getInt("productID"));
                    orderDetail.setQuantity(rs.getInt("quantity"));
                    orderDetail.setCancel_reason(rs.getString("cancel_reason"));
                    orderDetail.setTotalPrice(rs.getInt("totalPrice"));
                    // Set other properties if needed
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderDetail;
    }

    public static boolean requestReturn(int orderDetailId, String cancelReason) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement pstmt = con.prepareStatement(REQUEST_RETURN)) {
            pstmt.setString(1, cancelReason);
            pstmt.setInt(2, orderDetailId);

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // tao don hang va chi tiet don hang
    public static boolean addOrderAndDetails(Orders order, List<OrderDetail> orderDetails) throws Exception {
        Connection con = null;
        PreparedStatement addOrderStmt = null;
        PreparedStatement addOrderDetailStmt = null;
        ResultSet generatedKeys = null;

        try {
            con = SQLConnection.getConnection();
            con.setAutoCommit(false); // Bắt đầu transaction

            // Thêm đơn hàng vào bảng orders
            addOrderStmt = con.prepareStatement(ADD_ORDER, Statement.RETURN_GENERATED_KEYS);
            addOrderStmt.setInt(1, order.getCustomer_id());
            addOrderStmt.setInt(2, order.getShop_id());
            addOrderStmt.setInt(3, order.getShipping_cost());
            addOrderStmt.setInt(4, order.getTotal());
            addOrderStmt.setNString(5, order.getPayment_method());
            addOrderStmt.setNString(6, "Chờ xác nhận");
            addOrderStmt.setNString(7, order.getReceiver_name());
            addOrderStmt.setNString(8, order.getReceiver_phone());
            addOrderStmt.setNString(9, order.getReceiver_address());
            addOrderStmt.setNString(10, order.getShipping_method());
            addOrderStmt.setInt(11, 1);
            addOrderStmt.setInt(12, order.getVoucher_id());
            int affectedRows = addOrderStmt.executeUpdate();

            if (affectedRows == 0) {
                throw new Exception("Creating order failed, no rows affected.");
            }

            generatedKeys = addOrderStmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                order.setOrder_id(generatedKeys.getInt(1));
            } else {
                throw new Exception("Creating order failed, no ID obtained.");
            }

            // Thêm chi tiết đơn hàng vào bảng orderdetail
            addOrderDetailStmt = con.prepareStatement(ADD_ORDER_DETAIL);
            for (OrderDetail detail : orderDetails) {
                addOrderDetailStmt.setInt(1, order.getOrder_id());
                addOrderDetailStmt.setInt(2, detail.getProductID());
                addOrderDetailStmt.setInt(3, detail.getQuantity());
                addOrderDetailStmt.setDouble(4, detail.getTotalPrice());
                addOrderDetailStmt.addBatch();
            }
            addOrderDetailStmt.executeBatch();

            con.commit(); // Kết thúc transaction
            return true;
        } catch (SQLException e) {
            if (con != null) {
                try {
                    System.err.print("Transaction is being rolled back");
                    con.rollback();
                } catch (SQLException excep) {
                    excep.printStackTrace();
                }
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (generatedKeys != null) {
                    generatedKeys.close();
                }
                if (addOrderStmt != null) {
                    addOrderStmt.close();
                }
                if (addOrderDetailStmt != null) {
                    addOrderDetailStmt.close();
                }
                if (con != null) {
                    con.setAutoCommit(true); // Trả lại trạng thái ban đầu cho AutoCommit
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    //lay danh sach don hang de hien trong orderlist.jsp
    public List<Orders> getOrdersByUserId(int userId) {
        List<Orders> orders = new ArrayList<>();

        try (Connection con = SQLConnection.getConnection();
                PreparedStatement getOrdersStmt = con.prepareStatement(GET_ORDERS_BY_USER_ID)) {
            getOrdersStmt.setInt(1, userId);

            try (ResultSet rs = getOrdersStmt.executeQuery()) {
                while (rs.next()) {
                    Orders order = extractOrderFromResultSet(rs);
                    if (order != null) {
                        orders.add(order);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    private Orders extractOrderFromResultSet(ResultSet rs) {
        try {
            Orders order = new Orders();
            order.setOrder_id(rs.getInt("order_id"));

            order.setCustomer(getUserById(rs.getInt("customer_id")));
            order.setShop_id(rs.getInt("shop_id"));
            order.setShipping_cost(rs.getInt("shipping_cost"));
            order.setTotal(rs.getInt("total"));
            order.setPayment_method(rs.getString("payment_method"));
            order.setStatus(rs.getString("status"));
            order.setReceiver_name(rs.getString("receiver_name"));
            order.setReceiver_phone(rs.getString("receiver_phone"));
            order.setReceiver_address(rs.getString("receiver_address"));
            order.setShipping_method(rs.getString("shipping_method"));
            order.setShippingunit_id(rs.getInt("shippingunit_id"));
            order.setOrder_date(rs.getDate("order_date"));
            order.setType(rs.getInt("type"));
            return order;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
// lấy dữ liệu để hiển thị trong orderdetail.jsp

    public Orders getOrderAndDetailsById(int orderId) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement getOrderAndDetailsStmt = con.prepareStatement(GET_ORDER_AND_DETAILS_BY_ID)) {
            getOrderAndDetailsStmt.setInt(1, orderId);

            try (ResultSet rs = getOrderAndDetailsStmt.executeQuery()) {
                Orders order = null;
                List<OrderDetail> orderDetails = new ArrayList<>();

                while (rs.next()) {
                    if (order == null) {
                        order = extractOrderFromResultSet(rs);
                    }

                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setId(rs.getInt("id"));
                    orderDetail.setQuantity(rs.getInt("quantity"));

                    Products product = new Products();
                    product.setProduct_id(rs.getInt("product_id"));
                    product.setName(rs.getString("name"));
                    // product.setMoney(rs.getInt("money"));
                    product.setImg(rs.getString("img"));

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

    //day la customer update status 
    public static boolean updateOrderStatus(int orderId, String newStatus) throws ClassNotFoundException {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement updateStatusStmt = con.prepareStatement(UPDATE_ORDER_STATUS)) {
            updateStatusStmt.setNString(1, newStatus);
            updateStatusStmt.setInt(2, orderId);

            int affectedRows = updateStatusStmt.executeUpdate();

            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private static Orders getOrderObject(ResultSet rs) throws SQLException {
        int order_id = rs.getInt("order_id");
        int customer_id = rs.getInt("customer_id");
        int shop_id = rs.getInt("shop_id");
        int shipping_cost = rs.getInt("shipping_cost");
        int total = rs.getInt("total");
        String payment_method = rs.getString("payment_method");
        String status = rs.getString("status");
        String receiver_name = rs.getString("receiver_name");
        String receiver_phone = rs.getString("receiver_phone");
        String receiver_address = rs.getString("receiver_address");
        String shipping_method = rs.getString("shipping_method");
        int shippingunit_id = rs.getInt("shippingunit_id");
        Date created_date = new Date(rs.getTimestamp("order_date").getTime());
        int type = rs.getInt("type");
        Orders order = new Orders(order_id, customer_id, shop_id, shipping_cost, total, payment_method, status,
                receiver_name, receiver_phone, receiver_address, shipping_method, shippingunit_id, created_date, type);
        return order;
    }

    public static ArrayList<Orders> getOrdersByShop(int shop_id) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Orders order = null;
        ArrayList<Orders> orderses = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETORDERSBYSHOP);
            ptm.setInt(1, shop_id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                order = getOrderObject(rs);
                orderses.add(order);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return orderses;
    }

    public static List<Orders> getOrdersesByShopAndDate(int shop_id, LocalDate date) {
        List<Orders> orders = new ArrayList<>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Orders order = null;
        try (Connection con = SQLConnection.getConnection()) {
            statement = con.prepareStatement(GETORDERSBYSHOPANDDATE);
            statement.setDate(1, java.sql.Date.valueOf(date));
            statement.setInt(2, shop_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                order = getOrderObject(resultSet);
                orders.add(order);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return orders;
    }

    public static Map<Integer, Integer> getOrdersCountByHour(int shop_id, LocalDate date) {
        Map<Integer, Integer> ordersCountByHour = new HashMap<>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Orders order = null;
        try (Connection con = SQLConnection.getConnection()) {
            statement = con.prepareStatement(GETORDERSCOUNTBYHOUR);
            statement.setDate(1, java.sql.Date.valueOf(date));
            statement.setInt(2, shop_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int hour = resultSet.getInt("hour");
                int count = resultSet.getInt("count");
                ordersCountByHour.put(hour, count);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ordersCountByHour;
    }

    public static Map<Integer, Integer> getOrdersCountADateInMonth(int shop_id, int month, int year) {
        Map<Integer, Integer> ordersADateInMonth = new HashMap<>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Orders order = null;
        try (Connection con = SQLConnection.getConnection()) {
            statement = con.prepareStatement(GETORDERSCOUNTBYMONTH);
            statement.setInt(1, month);
            statement.setInt(2, year);
            statement.setInt(3, shop_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int day = resultSet.getInt("day");
                int count = resultSet.getInt("count");
                ordersADateInMonth.put(day, count);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ordersADateInMonth;
    }

    public static List<Orders> getWaitingOrders(int shop_id) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Orders order = null;
        ArrayList<Orders> orderses = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETWAITINGORDERS);
            ptm.setInt(1, shop_id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                order = getOrderObject(rs);
                orderses.add(order);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return orderses;
    }

    public static Integer getTotalRevenueInAMonthOfShop(int shop_id, int month, int year) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Integer totalRev = 0;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(CALTOTALREVENUEINAMOTH);
            ptm.setInt(1, shop_id);
            ptm.setInt(2, month);
            ptm.setInt(3, year);
            rs = ptm.executeQuery();
            if (rs.next()) {
                totalRev = rs.getInt("TotalRevenue");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return totalRev;
    }

    public static Integer getOrdersCountInAMonthOfShop(int shop_id, int month, int year) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Integer ttOrdersCount = 0;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETCOMPLETEORDERCOUNTINMONTHOFSHOP);
            ptm.setInt(1, shop_id);
            ptm.setInt(2, month);
            ptm.setInt(3, year);
            rs = ptm.executeQuery();
            if (rs.next()) {
                ttOrdersCount = rs.getInt("count");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ttOrdersCount;
    }

    public static Integer getTotalProductSell(int shop_id, int month, int year) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Integer ttProduct = 0;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETTOTALPRODUCTSELL);
            ptm.setInt(1, shop_id);
            ptm.setInt(2, month);
            ptm.setInt(3, year);
            rs = ptm.executeQuery();
            if (rs.next()) {
                ttProduct = rs.getInt("totalProductQuantity");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return ttProduct;
    }

    public static void createCustomOrder(int shop_id, int priceProduct, String productName, Date deadline) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(CREATECUSTOMORDER);
            ptm.setInt(1, shop_id);
            ptm.setInt(2, priceProduct);
            ptm.setNString(3, productName);
            ptm.setDate(4, (java.sql.Date) deadline);
            ptm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<CustomOrder> getCustomOrderOfShop(int shop_id) {
        List<CustomOrder> list = new ArrayList<>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETCUSTOMORDERS);
            ptm.setInt(1, shop_id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt("id");
                int price = rs.getInt("total");
                String productName = rs.getString("product_name");
                String status = rs.getString("status");
                Date deadline = rs.getDate("expected_complete_date");
                CustomOrder co = new CustomOrder(order_id, productName, deadline);
                Orders o = new Orders();
                o.setTotal(price);
                o.setStatus(status);
                co.setOrder(o);
                list.add(co);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void updateCustomOrderProcessDetai(CustomOrderDetail cod, String status) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(UPDATE_STATUS);
            ptm.setInt(2, cod.getCustomorder_id());
            ptm.setNString(1, status);
            ptm.execute();
            ptm = con.prepareStatement(UPDATE_PROCESS);
            ptm.setInt(1, cod.getCustomorder_id());
            ptm.setNString(1, cod.getProcess_img());
            ptm.setNString(1, cod.getProcess_video());
            ptm.setNString(1, cod.getDescription());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<ShippingUnits> getLocalShippingUnits(String shop_address) {
        List<ShippingUnits> shippingUnits = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection()) {
            PreparedStatement statement = con.prepareStatement("EXEC SearchShippingUnitsByAddress @input_address = ?");
            statement.setNString(1, shop_address);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ShippingUnits unit = new ShippingUnits();
                unit.setId(resultSet.getInt("id"));
                unit.setSupport_shippingmethod(resultSet.getInt("support_shippingmethod"));
                unit.setName(resultSet.getNString("name"));
                shippingUnits.add(unit);
            }
        } catch (Exception e) {
        }
        return shippingUnits;
    }

    public static Orders getOrderByID(int order_id) {
        Orders o = null;
        try (Connection con = SQLConnection.getConnection()) {
            PreparedStatement statement = con.prepareStatement("SELECT * FROM [orders] WHERE [order_id]=?");
            statement.setInt(1, order_id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                o = getOrderObject(rs);
            }
        } catch (Exception e) {
        }
        return o;
    }

    public static List<OrderDetail> getOrderDetail(int order_id) {
        List<OrderDetail> ods = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection()) {
            PreparedStatement statement = con.prepareStatement("SELECT od.*,p.name FROM [orderdetail] od join [products] p on p.product_id = od.productID WHERE od.orderID = ?");
            statement.setInt(1, order_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                OrderDetail od = new OrderDetail();
                Products p = new Products();
                p.setName(resultSet.getString("name"));
                od.setOrderID(resultSet.getInt("orderID"));
                od.setQuantity(resultSet.getInt("quantity"));
                od.setProduct(p);
                od.setOrder(getOrderByID(order_id));
                ods.add(od);
            }
        } catch (Exception e) {
        }
        return ods;
    }

    public static void main(String[] args) throws Exception {

        OrdersDao ordersDao = new OrdersDao();

        // Tạo một đơn hàng mới
        Orders order = new Orders();
        order.setCustomer_id(6);
        order.setShop_id(2);
        order.setShipping_cost(10);
        order.setTotal(1000000000);
        order.setShippingunit_id(1);
        order.setVoucher_id(1);
        order.setTotal(100000);
        order.setShipping_method("1");
        order.setPayment_method("COD");
        //order.setStatus("Chờ xác nhận");
        order.setReceiver_name("John Doe");
        order.setReceiver_phone("1234567890");
        order.setReceiver_address("123 Main St, City, Country");
        order.setOrder_date(new Date());
        //   order.setType(1);
        order.setVoucher_id(1);

        // Tạo danh sách chi tiết đơn hàng
        List<OrderDetail> orderDetails = new ArrayList<>();
        OrderDetail detail1 = new OrderDetail();
        detail1.setProductID(2);
        detail1.setQuantity(2);
        detail1.setTotalPrice(300);
        orderDetails.add(detail1);

        OrderDetail detail2 = new OrderDetail();
        detail2.setProductID(1);
        detail2.setQuantity(1);
        detail2.setTotalPrice(200);
        orderDetails.add(detail2);

        // Thêm đơn hàng và chi tiết đơn hàng vào cơ sở dữ liệu
        boolean success = ordersDao.addOrderAndDetails(order, orderDetails);
        if (success) {
            System.out.println("Đã thêm đơn hàng và chi tiết đơn hàng thành công.");
        } else {
            System.out.println("Đã xảy ra lỗi khi thêm đơn hàng và chi tiết đơn hàng.");
        }
    }
}
