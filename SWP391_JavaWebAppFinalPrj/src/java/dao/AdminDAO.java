/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.*;
import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;
import model.RefundRequest;
import model.Voucher;
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
    
    private static final String GETVOUCHERLIST = "SELECT [voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [use_count] FROM [dbo].[vouchers] WHERE [type] = ?";
    
    private static final String GETVOUCHER = "SELECT [voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [use_count] FROM [dbo].[vouchers] WHERE [voucher_id] = ?";
    
    private static final String GETAPPLIEDLIST_PRODUCT = "SELECT [product_id] FROM [dbo].[productvoucherdetail] WHERE [voucher_id] = ?";
    
    private static final String GETAPPLIEDLIST_SHOP = "SELECT [shop_id] FROM [dbo].[shopvoucherdetail] WHERE [voucher_id] = ?";
    
    private static final String GETAPPLIEDLIST_MAIN = "SELECT [category_id] FROM [dbo].[mainvoucherdetail] WHERE [voucher_id] = ?";
    
    private static final String ADDVOUCHER = "INSERT INTO [dbo].[vouchers]([code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [use_count]) values (?, ?, ?, ?, ?, ?, ?, ?)";
    
    private static final String UPDATEVOUCHER = "UPDATE [dbo].[vouchers] SET [code] = ?, [discount_amount] = ?, [expire_date] = ?, [min_require] = ?, [description] = ?, [use_count] = ? WHERE [voucher_id] = ?";
    
    private static final String DELETEVOUCHER = "DELETE [dbo].[vouchers] WHERE [voucher_id] = ?";
    
    private static final String GETREFUNDLIST = "SELECT [id], [orderdetail_id], [reason], [detail], [status] FROM [dbo].[refundsnreturns]";
    
    private static final String GETREFUNDDETAIL = "SELECT [orderID], [productID] FROM [dbo].[orderdetail] WHERE [id] = ?";
    
    private static final String UPDATEREFUND = "UPDATE [dbo].[refundsnreturns] SET [status] = ? WHERE [id] = ?";
    
    
    
    public static ArrayList<Category> Get_Category_List() {
        ArrayList<Category> result = new ArrayList<Category>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETCATEGORYLIST);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String Name = rs.getString("name").trim();
                String Description = rs.getString("description").trim();
                Category c = new Category(id, Name, Description);
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
    public static void Update_Main_Category(int id, String Name, String Description) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(UPDATECATEGORY);
            ptm.setString(1, Name);
            ptm.setString(2, Description);
            ptm.setInt(3, id);
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
    
    public static ArrayList<Voucher> Get_Voucher_List() {
        ArrayList<Voucher> result = new ArrayList<Voucher>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETVOUCHERLIST);
            ptm.setInt(1, 0);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("voucher_id");
                String Code = rs.getString("code").trim();
                int Discount = rs.getInt("discount_amount");
                Timestamp Start = rs.getTimestamp("start_date");
                Timestamp End = rs.getTimestamp("expire_date");
                int Type = rs.getInt("type");
                int Min = rs.getInt("min_require");
                String Description = rs.getString("description").trim();
                int Count = rs.getInt("use_count");
                Voucher v = new Voucher(id, Code, Discount, Start, End, Type, Min, Description, Count);
                result.add(v);                
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static Voucher Get_Voucher(int id) {
        Voucher result = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETVOUCHER);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            if (rs.next()) {
                id = rs.getInt("voucher_id");
                String Code = rs.getString("code").trim();
                int Discount = rs.getInt("discount_amount");
                Timestamp Start = rs.getTimestamp("start_date");
                Timestamp End = rs.getTimestamp("expire_date");
                int Type = rs.getInt("type");
                int Min = rs.getInt("min_require");
                String Description = rs.getString("description").trim();
                int Count = rs.getInt("use_count");
                result = new Voucher(id, Code, Discount, Start, End, Type, Min, Description, Count);
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static Voucher Get_Applied_List(Voucher v) {
        int type = v.getType();
        String command = new String();
        String column = new String();
        ArrayList<Integer> ListApplied = new ArrayList<Integer>();
        switch (type) {
            case 1:
                command = GETAPPLIEDLIST_PRODUCT;
                column = "product_id";
                break;
            case 2:
                command = GETAPPLIEDLIST_SHOP;
                column = "shop_id";
                break;
            case 3:
                command = GETAPPLIEDLIST_MAIN;
                column = "category_id";
                break;
            default:
                return v;
        }
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(command);
            ptm.setInt(1, v.getId());
            rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(column);
                ListApplied.add(id);
            }
            v.setListApplied(ListApplied);
            SQLConnection.closeConnection(con);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return v;
    }
    
    
    
    public static void Add_New_Voucher(Voucher v) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(ADDVOUCHER);
            ptm.setString(1, v.getCode());
            ptm.setInt(2, v.getDiscount());
            ptm.setTimestamp(3, v.getStart());
            ptm.setTimestamp(4, v.getEnd());
            ptm.setInt(5, v.getType());
            ptm.setInt(6, v.getMin());
            ptm.setString(7, v.getDescription());
            ptm.setInt(8, v.getCount());
            ptm.executeUpdate();
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void Update_Voucher(Voucher v) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(UPDATEVOUCHER);
            ptm.setString(1, v.getCode());
            ptm.setInt(2, v.getDiscount());
            ptm.setTimestamp(3, v.getEnd());
            ptm.setInt(4, v.getMin());
            ptm.setString(5, v.getDescription());
            ptm.setInt(6, v.getCount());
            ptm.setInt(7, v.getId());
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void Delete_Voucher(int id) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(DELETEVOUCHER);
            ptm.setInt(1, id);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static ArrayList<RefundRequest> Get_Refund_List() {
        ArrayList<RefundRequest> result = new ArrayList<RefundRequest>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETREFUNDLIST);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int orderDetailId = rs.getInt("orderdetail_id");
                String reason = rs.getString("reason").trim();
                String detail = rs.getString("detail").trim();
                String status = new String();
                switch(rs.getInt("status")) {
                    case 0:
                        status = "Waiting";
                        break;
                    case 1:
                        status = "Accept";
                        break;
                    case 2:
                        status = "Decline";
                        break;
                }
                RefundRequest r = new RefundRequest(id, 0, 0, null, null, status, reason, detail, null);
                r = Get_Refund_Detail(r, orderDetailId);
                result.add(r);                
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static RefundRequest Get_Refund_Detail(RefundRequest r, int i) {
        RefundRequest result = r;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETREFUNDDETAIL);
            ptm.setInt(1, i);
            rs = ptm.executeQuery();
            if (rs.next()) {
                result.setOrderId(rs.getInt("orderID"));
                result.setProductId(rs.getInt("productID"));
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
            else if (Status.equals("Accept")) status = 1;
            else if (Status.equals("Decline")) status = 2;
            
            ptm = con.prepareStatement(UPDATEREFUND);
            ptm.setInt(1, status);
            ptm.setInt(2, id);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    
    
    
    public static void main(String[] args) {
        Update_Main_Category(3, "houseware", "");
    }
    
}
