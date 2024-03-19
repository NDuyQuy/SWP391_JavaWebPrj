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
import model.Orders;
/**
 *
 * @author ASUS
 */
public class OrdersDao {
    private static final String GETORDERSBYSHOP = "SELECT * FROM [orders] WHERE [shop_id]=?";
    private static final String GETORDERSBYSHOPANDDATE = "SELECT * FROM [orders] WHERE CONVERT(date, order_date) = ? AND [shop_id]=?";
    private static final String GETORDERSCOUNTBYHOUR = "SELECT HOUR(order_date) AS hour, COUNT(*) AS count FROM [orders]"
            + "WHERE CONVERT(date, order_date) = ? AND [shop_id]=? GROUP BY HOUR(order_date)";
    private static final String CREATECUSTOMORDER = "INSERT INTO [orders]([shop_id],[total],[status],[type]) VALUES (?,?,'wait for customer accept',?)";
    private static final String ACCEPTCUSTOMORDER = "UPDATE [orders] set [status]='', ";
    
    public static Orders getOrderObject(ResultSet rs) throws SQLException{
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
    
    public static void main(String[] args) {
        LocalDate date = LocalDate.of(2024, 3, 16);
        getOrdersesByShopAndDate(1,date).forEach(System.out::println);
    }
}
