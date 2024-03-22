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
import java.time.LocalDate;
import java.util.*;
import model.*;

/**
 *
 * @author ASUS
 */
public class OrdersDao {

    private static final String GET_ORDERS_BY_UNIT_ID = "Select [order_id],[customer_id],[shop_id],[receiver_name],[receiver_phone],[receiver_adress],[order_date] from [orders] where [shippingunit_id] = ? and [status] like ?";
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
    private static final String GETORDERIDBYREF_RETID = "Select od.orderID from refundsnreturns rnr join orderdetail od on rnr.orderdetail_id = od.id where rnr.id = ?";

    private static final String CREATE_RETURN_ORDER = "INSERT INTO [orders]([customer_id],[shop_id],[status],[receiver_name],[receiver_phone],[receiver_adress],[shippingunit_id],[type]) values (?,?,?,?,?,?,?,3)";

    public List<Orders> getOrdersByUserId(int userId) {
        List<Orders> orders = new ArrayList<>();

        try ( Connection con = SQLConnection.getConnection();  PreparedStatement getOrdersStmt = con.prepareStatement(GET_ORDERS_BY_USER_ID)) {
            getOrdersStmt.setInt(1, userId);

            try ( ResultSet rs = getOrdersStmt.executeQuery()) {
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
            // Bạn cần implement phương thức getUserById để lấy thông tin người dùng từ cơ sở dữ liệu
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

    public Orders getOrderAndDetailsById(int orderId) {
        try ( Connection con = SQLConnection.getConnection();  PreparedStatement getOrderAndDetailsStmt = con.prepareStatement(GET_ORDER_AND_DETAILS_BY_ID)) {
            getOrderAndDetailsStmt.setInt(1, orderId);

            try ( ResultSet rs = getOrderAndDetailsStmt.executeQuery()) {
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

    public static boolean updateOrderStatus(int orderId, String newStatus) throws ClassNotFoundException {
        try ( Connection con = SQLConnection.getConnection();  PreparedStatement updateStatusStmt = con.prepareStatement(UPDATE_ORDER_STATUS)) {
            updateStatusStmt.setString(1, newStatus);
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
        try ( Connection con = SQLConnection.getConnection()) {
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
        try ( Connection con = SQLConnection.getConnection()) {
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
        try ( Connection con = SQLConnection.getConnection()) {
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
        try ( Connection con = SQLConnection.getConnection()) {
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
        try ( Connection con = SQLConnection.getConnection()) {
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
        try ( Connection con = SQLConnection.getConnection()) {
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
        try ( Connection con = SQLConnection.getConnection()) {
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
        try ( Connection con = SQLConnection.getConnection()) {
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
        try ( Connection con = SQLConnection.getConnection()) {
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
        try ( Connection con = SQLConnection.getConnection()) {
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
        try ( Connection con = SQLConnection.getConnection()) {
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
        try ( Connection con = SQLConnection.getConnection()) {
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
        try ( Connection con = SQLConnection.getConnection()) {
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
        try ( Connection con = SQLConnection.getConnection()) {
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

    public static ArrayList<Orders> getOrdersByUnitId(int su_id, String status) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Orders ord = null;
        ArrayList<Orders> orders = new ArrayList<>();
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GET_ORDERS_BY_UNIT_ID);
            ptm.setInt(1, su_id);
            ptm.setString(2, status);
            rs = ptm.executeQuery();
            while (rs.next()) {
                ord = new Orders();
                ord.setOrder_id(rs.getInt(1));
                ord.setCustomer_id(rs.getInt(2));
                ord.setShop_id(rs.getInt(3));
                ord.setReceiver_name(rs.getString(4).trim());
                ord.setReceiver_phone(rs.getString(5).trim());
                ord.setReceiver_address(rs.getString(6).trim());
                ord.setOrder_date(rs.getDate(7));
                orders.add(ord);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return orders;
    }

    public static Orders getOrderByRef_RetId(int id) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Orders order = new Orders();
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETORDERIDBYREF_RETID);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            if (rs.next()) {
                order = getOrderByID(rs.getInt(1));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return order;
    }

    public static void createReturnOrder(int ref_id) {
        PreparedStatement ptm = null;
        Orders order = getOrderByRef_RetId(ref_id);
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(CREATE_RETURN_ORDER);
            ptm.setInt(1, order.getCustomer_id());
            ptm.setInt(2, order.getShop_id());
            ptm.setString(3, "??n h ng ?ang ???c chuy?n cho shippingunit");
            ptm.setString(4, order.getReceiver_name());
            ptm.setString(5, order.getReceiver_phone());
            ptm.setString(6, order.getReceiver_address());
            ptm.setInt(7, order.getShippingunit_id());
            ptm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {

        OrdersDao orderDAO = new OrdersDao();

        // Thay orderId bằng id của đơn hàng cần kiểm tra
        int orderId = 11;

        Orders order = orderDAO.getOrderAndDetailsById(orderId);

        if (order == null) {
            System.out.println("Không tìm thấy đơn hàng có ID là " + orderId);
        } else {
            System.out.println("Thông tin đơn hàng:");
            System.out.println("Order ID: " + order.getOrder_id());
            System.out.println("Customer ID: " + order.getCustomer_id());
            System.out.println("Shop ID: " + order.getShop_id());
            System.out.println("Shipping Cost: " + order.getShipping_cost());
            System.out.println("Total: " + order.getTotal());
            System.out.println("Payment Method: " + order.getPayment_method());
            System.out.println("Status: " + order.getStatus());
            System.out.println("Receiver Name: " + order.getReceiver_name());
            System.out.println("Receiver Phone: " + order.getReceiver_phone());
            System.out.println("Receiver Address: " + order.getReceiver_address());
            System.out.println("Shipping Method: " + order.getShipping_method());
            System.out.println("Shipping Unit ID: " + order.getShippingunit_id());
            System.out.println("Order Date: " + order.getOrder_date());
            System.out.println("Type: " + order.getType());

            // Kiểm tra danh sách chi tiết đơn hàng
            List<OrderDetail> orderDetails = order.getOrderDetails();
            if (orderDetails != null && !orderDetails.isEmpty()) {
                System.out.println("Chi tiết đơn hàng:");
                for (OrderDetail detail : orderDetails) {
                    System.out.println("ID: " + detail.getId());
                    System.out.println("Product ID: " + detail.getProductID());
                    System.out.println("Quantity: " + detail.getQuantity());
                    // In thông tin sản phẩm nếu cần
                    Products product = detail.getProduct();
                    if (product != null) {
                        System.out.println("Product Name: " + product.getName());
                        System.out.println("Price: " + product.getMoney());
                        // In các thông tin khác của sản phẩm nếu cần
                    }
                    // In cancel reason nếu cần
                    System.out.println("Cancel Reason: " + detail.getCancel_reason());
                }
            } else {
                System.out.println("Không có chi tiết đơn hàng cho đơn hàng có ID là " + orderId);
            }
        }
    }
}
