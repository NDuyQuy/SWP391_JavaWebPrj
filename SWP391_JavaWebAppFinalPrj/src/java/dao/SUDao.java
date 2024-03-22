/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.*;
/**
 *
 * @author DELL
 */
public class SUDao {
    private static final String GETORDERLIST = "SELECT * FROM [dbo].[orders] WHERE [shippingunit_id] = ?, [status] = ?";
    
    private static final String UPDATEORDERSTATUS = "UPDATE [dbo].[orders] SET [status] = ? WHERE [order_id] = ?";
    
    private static final String SUWAITING = "chờ shipping unit xác nhận";
    
    private static final String SUACCEPT = "đơn hàng đang được chuyển cho đơn vị vận chuyển";
    
    private static final String SUDECLINE = "chờ người bán xác nhận - shipping unit từ chối";
    
    private static final String SUACCQUIRE = "đang vận chuyển";
    
    public static ArrayList<Orders> GetWaitingOrderList(int SUid) {
        ArrayList<Orders> result = new ArrayList<Orders>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETORDERLIST);
            ptm.setInt(1, SUid);
            ptm.setString(2, SUWAITING);
            rs = ptm.executeQuery();
            while (rs.next()) {
                Orders o = new Orders();
                o = OrdersDao.getOrderObject(rs);
                result.add(o);
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static ArrayList<Orders> GetAcceptOrderList(int SUid) {
        ArrayList<Orders> result = new ArrayList<Orders>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETORDERLIST);
            ptm.setInt(1, SUid);
            ptm.setString(2, SUACCEPT);
            rs = ptm.executeQuery();
            while (rs.next()) {
                Orders o = new Orders();
                o = OrdersDao.getOrderObject(rs);
                result.add(o);
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static void AcceptOrder(int orderId) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(UPDATEORDERSTATUS);
            ptm.setString(1, SUACCEPT);
            ptm.setInt(2, orderId);
            ptm.executeUpdate();
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void DeclineOrder(int orderId) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(UPDATEORDERSTATUS);
            ptm.setString(1, SUDECLINE);
            ptm.setInt(2, orderId);
            ptm.executeUpdate();
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void ShippingOrder(int orderId) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(UPDATEORDERSTATUS);
            ptm.setString(1, SUACCQUIRE);
            ptm.setInt(2, orderId);
            ptm.executeUpdate();
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    
    
}
