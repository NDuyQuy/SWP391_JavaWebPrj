/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.*;
import model.CustomOrder;
import model.Orders;
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
    private static final String GETWAITINGORDERS = "SELECT * FROM [orders] WHERE [shop_id]=? AND [status]=N'%chờ người bán xác nhận%'";
    
    private static final String GETCUSTOMORDERS = "SELECT co.*,o.status,total FROM [custom_order] co join [orders] o on co.id = o.order_id WHERE o.shop_id = ?";
    private static final String CREATECUSTOMORDER = "EXEC CREATECUSTOMORDERS @ShopId = ?, @Price=?,@ProductName=?, @Deadline = ?";
    private static final String ACCEPTCUSTOMORDER = "UPDATE [orders] set [status]='', ";
    
    private static Orders getOrderObject(ResultSet rs) throws SQLException{
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
    public static ArrayList<Orders> getOrdersByShop(int shop_id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Orders order = null;
        ArrayList<Orders> orderses = new ArrayList<>();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETORDERSBYSHOP);
            ptm.setInt(1, shop_id);
            rs = ptm.executeQuery();
            while(rs.next()){
                order = getOrderObject(rs);
                orderses.add(order);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return orderses;
    }
    public static List<Orders> getOrdersesByShopAndDate(int shop_id, LocalDate date){
        List<Orders> orders = new ArrayList<>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Orders order = null;
        try(Connection con = SQLConnection.getConnection()){
            statement = con.prepareStatement(GETORDERSBYSHOPANDDATE);
            statement.setDate(1, java.sql.Date.valueOf(date));
            statement.setInt(2, shop_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                order = getOrderObject(resultSet);
                orders.add(order);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return orders;
    }
    
    public static Map<Integer, Integer> getOrdersCountByHour(int shop_id, LocalDate date) {
        Map<Integer, Integer> ordersCountByHour = new HashMap<>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Orders order = null;
        try(Connection con = SQLConnection.getConnection()){
            statement = con.prepareStatement(GETORDERSCOUNTBYHOUR);
            statement.setDate(1, java.sql.Date.valueOf(date));
            statement.setInt(2, shop_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int hour = resultSet.getInt("hour");
                int count = resultSet.getInt("count");
                ordersCountByHour.put(hour, count);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return ordersCountByHour;
    }
    public static Map<Integer, Integer> getOrdersCountADateInMonth(int shop_id, int month, int year){
        Map<Integer, Integer> ordersADateInMonth = new HashMap<>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Orders order = null;
        try(Connection con = SQLConnection.getConnection()){
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
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return ordersADateInMonth;
    }
    public static List<Orders> getWaitingOrders(int shop_id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Orders order = null;
        ArrayList<Orders> orderses = new ArrayList<>();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETWAITINGORDERS);
            ptm.setInt(1, shop_id);
            rs = ptm.executeQuery();
            while(rs.next()){
                order = getOrderObject(rs);
                orderses.add(order);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return orderses;
    }
    public static Integer getTotalRevenueInAMonthOfShop(int shop_id, int month, int year){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Integer totalRev = 0;
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(CALTOTALREVENUEINAMOTH);
            ptm.setInt(1, shop_id);
            ptm.setInt(2, month);
            ptm.setInt(3, year);
            rs = ptm.executeQuery();
            if(rs.next()){
                totalRev = rs.getInt("TotalRevenue");
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return totalRev;
    }
    public static Integer getOrdersCountInAMonthOfShop(int shop_id, int month, int year){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Integer ttOrdersCount = 0;
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETCOMPLETEORDERCOUNTINMONTHOFSHOP);
            ptm.setInt(1, shop_id);
            ptm.setInt(2, month);
            ptm.setInt(3, year);
            rs = ptm.executeQuery();
            if(rs.next()){
                ttOrdersCount = rs.getInt("count");
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return  ttOrdersCount;
    }
    public static Integer getTotalProductSell(int shop_id, int month, int year){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Integer ttProduct = 0;
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETTOTALPRODUCTSELL);
            ptm.setInt(1, shop_id);
            ptm.setInt(2, month);
            ptm.setInt(3, year);
            rs = ptm.executeQuery();
            if(rs.next()){
                ttProduct = rs.getInt("totalProductQuantity");
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return  ttProduct;
    }
    public static void createCustomOrder(int shop_id,int priceProduct, String productName, Date deadline){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try(Connection con = SQLConnection.getConnection()){
            ptm=con.prepareStatement(CREATECUSTOMORDER);
            ptm.setInt(1, shop_id);
            ptm.setInt(2, priceProduct);
            ptm.setString(3, productName);
            ptm.setDate(4, (java.sql.Date) deadline);
            ptm.execute();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static List<CustomOrder> getCustomOrderOfShop(int shop_id){
        List<CustomOrder> list = new ArrayList<>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETCUSTOMORDERS);
            ptm.setInt(1, shop_id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt("id");
                int price = rs.getInt("total");
                String productName = rs.getString("product_name");
                String status = rs.getString("status");
                Date deadline = rs.getDate("expected_complete_date");
                CustomOrder co = new CustomOrder(order_id,productName,deadline);
                Orders o = new Orders();
                o.setTotal(price); o.setStatus(status); 
                co.setOrder(o);
                list.add(co);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public static void main(String[] args) {
        LocalDate date = LocalDate.of(2024, 3, 17);
        getCustomOrderOfShop(1).forEach(System.out::println);
        //getWaitingOrders(1).forEach(System.out::println);
        //getOrdersCountByHour(1, date).entrySet().forEach(System.out::println);
        //getOrdersCountADateInMonth(1, 3, 2024).entrySet().forEach(System.out::println);
        //System.out.println(getOrdersCountInAMonthOfShop(1, 2, 2024));
    }
}
