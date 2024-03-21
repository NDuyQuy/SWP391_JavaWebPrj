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
public class MessageDao {
    private static final String GETMESSAGELISTBY2ID = "SELECT * FROM [dbo].[messages] WHERE [shop_id] = ? AND [customer_id] = ?";
    
    private static final String SENDMESSAGE = "INSERT INTO [dbo].[messages]([shop_id], [customer_id], [message_status], [content]) VALUES (?, ?, ?, ?)";
    
    private static final String UPDATESTATUS = "UPDATE [dbo].[messages] SET [message_status] = ? WHERE [shop_id] = ? AND [customer_id] = ? AND [message_status] = ?";
    
    private static final String DELETEMESSAGE = "UPDATE [dbo].[messages] SET [message_status] = ? WHERE [message_id] = ?";
    
    private static final String GETUNSEENMESSAGE = "SELECT * FROM [dbo].[messages] WHERE [shop_id] = ? AND [customer_id] = ? AND [message_status] = ?";
    
    private static final String GETCHATLIST = "SELECT DISTINCT [shop_id] FROM [dbo].[messages] WHERE [customer_id] = ? ORDER BY [shop_id]";
    
    private static final String GETUSERCHATLIST = "SELECT DISTINCT [customer_id] FROM [dbo].[messages] WHERE [shop_id] = ? ORDER BY [customer_id]";
    
    
    
    public static ArrayList<Messages> GetMessageList(int shopId, int userId) {
        ArrayList<Messages> result = new ArrayList<Messages>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETMESSAGELISTBY2ID);
            ptm.setInt(1, shopId);
            ptm.setInt(2, userId);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("message_id");
                String content = rs.getString("content");
                Timestamp time = rs.getTimestamp("time_stamp");
                int status = rs.getInt("message_status");
                Messages m = new Messages(id, shopId, userId, time, status, content);
                m.setShop(SellersDao.getShopById(shopId));
                m.setCustomer(UsersDao.getUserById(userId));
                result.add(m);
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static ArrayList<Messages> GetUnseenMessage(int shopId, int userId, int status) {
        ArrayList<Messages> result = new ArrayList<Messages>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETUNSEENMESSAGE);
            ptm.setInt(1, shopId);
            ptm.setInt(2, userId);
            ptm.setInt(3, status);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("message_id");
                String content = rs.getString("content").trim();
                Timestamp time = rs.getTimestamp("time_stamp");
                Messages m = new Messages(id, shopId, userId, time, status, content);
                m.setShop(SellersDao.getShopById(shopId));
                m.setCustomer(UsersDao.getUserById(userId));
                result.add(m);
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static void SendMessage(int shopId, int userId, int status, String content) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(SENDMESSAGE);
            ptm.setInt(1, shopId);
            ptm.setInt(2, userId);
            ptm.setInt(3, status);
            ptm.setString(4, content);
            ptm.executeUpdate();
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void SeenMessage(int shopId, int userId, int status) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(UPDATESTATUS);
            if (status == 0) ptm.setInt(1, 1);
            else if (status == 2) ptm.setInt(1, 3);
            ptm.setInt(2, shopId);
            ptm.setInt(3, userId);
            ptm.setInt(4, status);
            ptm.executeUpdate();
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void DeleteMessage(int id, int status) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(DELETEMESSAGE);
            ptm.setInt(1, status);
            ptm.setInt(2, id);
            ptm.executeUpdate();
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static ArrayList<Shops> GetChatList(int id) {
        ArrayList<Shops> result = new ArrayList<Shops>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETCHATLIST);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int shopid = rs.getInt("shop_id");
                Shops shop = SellersDao.getShopById(shopid);
                result.add(shop);
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static ArrayList<Users> GetUserList(int id) {
        ArrayList<Users> result = new ArrayList<Users>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETUSERCHATLIST);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int userid = rs.getInt("customer_id");
                Users u = UsersDao.getUserById(userid);
                result.add(u);
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static void main(String[] args) {
        GetMessageList(1,3).forEach(System.out::println);
    }
}
