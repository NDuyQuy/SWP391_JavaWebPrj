/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import model.ApproveRequest;
import model.MainCategory;
import model.OrderDetail;
import model.RefundsnReturns;
import model.ReportDetail;
import model.Shops;
import model.Users;
/**
 *
 * @author DELL
 */
public class AdminDAO {
    //MAIN CATEGORY RELATED SQL STATEMENT
    private static final String GETCATEGORYLIST = "SELECT [id], [name], [description] FROM [dbo].[maincategory]";

    private static final String ADDCATEGORYLIST = "INSERT INTO [dbo].[maincategory]([name], [description]) values (?, ?)";
    
    private static final String UPDATECATEGORY = "UPDATE [maincategory] SET [name] = ?, [description] = ? WHERE  [id] = ?";
    
    private static final String DELETECATEGORY = "DELETE [maincategory] WHERE [id] = ?";
    
    private static final String GETAPPROVEREQUEST = "SELECT s.shop_id, s.shop_name, s.shop_description FROM [shops] s JOIN [users] u on s.shop_id = u.id WHERE u.role = 1";
    
    private static final String ACCEPTSELLER = "UPDATE [users] SET role = 2 WHERE id = ?";
    
    private static final String DECLINESELLER = "DELETE [shops] WHERE shop_id = ?";
    
    private static final String GETREPORTLIST = "SELECT * FROM [report_detail]";
    
    private static final String UPDATEBAN = "UPDATE [dbo].[shops] SET [ban_status] = ?, [ban_time] = ? WHERE [shop_id] = ?";
    
    private static final String GETREFUNDLIST = "SELECT [id], [orderdetail_id], [reason], [status], [img] FROM [dbo].[refundsnreturns]";
    
    private static final String UPDATEREFUND = "UPDATE [dbo].[refundsnreturns] SET [status] = ? WHERE [id] = ?";
    
    public static ArrayList<MainCategory> Get_Category_List() {
        ArrayList<MainCategory> result = new ArrayList<MainCategory>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETCATEGORYLIST);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String Name = rs.getString("name").trim();
                String Description = rs.getNString("description");
                MainCategory c = new MainCategory(id, Name, Description);
                result.add(c);                
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static void Add_Main_Category(String Name, String Description) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(ADDCATEGORYLIST);
            ptm.setString(1, Name);
            ptm.setString(2, Description);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void Update_Main_Category(MainCategory category) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(UPDATECATEGORY);
            ptm.setString(1, category.getName());
            ptm.setString(2, category.getDescription());
            ptm.setInt(3, category.getId());
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void Delete_Main_Category(int id) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(DELETECATEGORY);
            ptm.setInt(1, id);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static ArrayList<ApproveRequest> Get_Approve_Request() {
        ArrayList<ApproveRequest> result = new ArrayList<ApproveRequest>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETAPPROVEREQUEST);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("shop_id");
                String Name = rs.getString("shop_name").trim();
                String Description = rs.getNString("shop_description");
                Users u = UsersDao.getUserById(id);
                ApproveRequest ar = new ApproveRequest(id, Name, Description);
                ar.setUser(u);
                result.add(ar);                
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static void Accept_Approve_Request(int id) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(ACCEPTSELLER);
            ptm.setInt(1, id);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void Decline_Approve_Request(int id) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(DECLINESELLER);
            ptm.setInt(1, id);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static ArrayList<ReportDetail> Get_Report_List() {
        ArrayList<ReportDetail> result = new ArrayList<ReportDetail>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETREPORTLIST);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int shop_id = rs.getInt("shop_id");
                int reporter_id = rs.getInt("reporter_id");
                Date created_date = rs.getDate("created_date");
                String reason = rs.getNString("reason");
                Users u = UsersDao.getUserById(reporter_id);
                Shops s = SellersDao.getShopById(shop_id);
                ReportDetail ar = new ReportDetail(id, shop_id, reporter_id, created_date, reason);
                ar.setReported_shop(s);
                ar.setReporter(u);
                result.add(ar);                
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static void Update_Ban(int id, int status, int days) {
        PreparedStatement ptm = null;
        Timestamp bantime = new Timestamp(System.currentTimeMillis());
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(UPDATEBAN);
            bantime = addDays(bantime, days);
            ptm.setInt(1, status);
            ptm.setTimestamp(2, bantime);
            ptm.setInt(3, id);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static Timestamp addDays(Timestamp date, int days) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);// w ww.  j ava  2  s  .co m
        cal.add(Calendar.DATE, days); //minus number would decrement the days
        return new Timestamp(cal.getTime().getTime());
    }
    
    public static ArrayList<RefundsnReturns> Get_Refund_List() {
        ArrayList<RefundsnReturns> result = new ArrayList<RefundsnReturns>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETREFUNDLIST);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int orderdetail_id = rs.getInt("orderdetail_id");
                int status = rs.getInt("status");
                String reason = rs.getNString("reason");
                String img = rs.getNString("img");
                OrderDetail od = OrderDetailDao.getOrderDetailById(orderdetail_id);
                RefundsnReturns ar = new RefundsnReturns(id, orderdetail_id, reason, status, img);
                ar.setOrderdetail(od);
                result.add(ar);                
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static void Update_Refund(String Status, int id) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            int status = -1;
            if (Status.equals("Waiting")) status = 0;
            else if (Status.equals("Accept")) {
                status = 1;
                OrdersDao.createReturnOrder(id);
            }
            else if (Status.equals("Decline")) status = 2;
            
            ptm = con.prepareStatement(UPDATEREFUND);
            ptm.setInt(1, status);
            ptm.setInt(2, id);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
}
