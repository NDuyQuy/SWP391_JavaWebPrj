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
import java.util.Calendar;
import model.Category;
import model.RefundRequest;
import model.ReportedUser;
import model.SellerRequest;
import model.Voucher;
/**
 *
 * @author DELL
 */
public class AdminDAO {
    //SQL STATEMENT
    private static final String GETCATEGORYLIST = "SELECT [id], [name], [description] FROM [dbo].[maincategory]";

    private static final String ADDCATEGORYLIST = "INSERT INTO [dbo].[maincategory]([name], [description]) values (?, ?)";
    
    private static final String UPDATECATEGORY = "UPDATE [maincategory] SET [name] = ?, [description] = ? WHERE  [id] = ?";
    
    private static final String DELETECATEGORY = "DELETE [maincategory] WHERE [id] = ?";
    
    private static final String GETVOUCHERLIST = "SELECT [voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [use_count] FROM [dbo].[vouchers] WHERE [type] = ?";
    
    private static final String GETVOUCHER = "SELECT [voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [use_count] FROM [dbo].[vouchers] WHERE [voucher_id] = ?";
    
    private static final String GETAPPLIEDLIST_PRODUCT = "SELECT [product_id] FROM [dbo].[productvoucherdetail] WHERE [voucher_id] = ?";
    
    private static final String GETAPPLIEDLIST_SHOP = "SELECT [shop_id] FROM [dbo].[shopvoucherdetail] WHERE [voucher_id] = ?";
    
    private static final String ADDVOUCHER = "INSERT INTO [dbo].[vouchers]([code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [use_count]) values (?, ?, ?, ?, ?, ?, ?, ?)";
    
    private static final String UPDATEVOUCHER = "UPDATE [dbo].[vouchers] SET [code] = ?, [discount_amount] = ?, [expire_date] = ?, [min_require] = ?, [description] = ?, [use_count] = ? WHERE [voucher_id] = ?";
    
    private static final String DELETEVOUCHER = "DELETE [dbo].[vouchers] WHERE [voucher_id] = ?";
    
    private static final String GETREFUNDLIST = "SELECT [id], [orderdetail_id], [reason], [detail], [status] FROM [dbo].[refundsnreturns]";
    
    private static final String GETREFUNDDETAIL = "SELECT [orderID], [productID] FROM [dbo].[orderdetail] WHERE [id] = ?";
    
    private static final String UPDATEREFUND = "UPDATE [dbo].[refundsnreturns] SET [status] = ? WHERE [id] = ?";
    
    private static final String GETBANLIST = "SELECT [id], [user_id], [reporter_id], [date], [reason], [detail] FROM [dbo].[reportedusers] ORDER BY [id] DESC";
    
    private static final String GETBANDETAIL = "SELECT [username], [email], [status], [bantime] FROM [dbo].[users] WHERE [id] = ?";
    
    private static final String GETSHOPDETAIL = "SELECT [shop_name], [shop_reported_count] FROM [dbo].[shops] WHERE [shop_id] = ?";
    
    private static final String UPDATEBAN = "UPDATE [dbo].[users] SET [status] = ?, [bantime] = ? WHERE [id] = ?";
    
    private static final String GETAPPROVELIST = "SELECT [id], [user_id], [request_date], [shopname], [CCCD] FROM [dbo].[sellerrequest] ORDER BY [id] DESC";
    
    private static final String GETAPPROVEREQUEST = "SELECT [id], [user_id], [request_date], [shopname], [CCCD] FROM [dbo].[sellerrequest] WHERE [user_id] = ?";
    
    private static final String GETAPPROVEDETAIL = "SELECT [id], [username], [fullname], [createdate] FROM [dbo].[users] WHERE [id] = ?";
    
    private static final String DOAPPROVESELLER = "UPDATE [dbo].[users] SET [role] = ? WHERE [id] = ?";
    
    private static final String CREATESHOP = "INSERT INTO [dbo].[shops]([shop_id], [shop_name], [CCCD], [shop_reported_count]) values (?, ?, ?, ?)";
    
    private static final String DELETEAPPROVEREQUEST = "DELETE [dbo].[sellerrequest] WHERE [user_id] = ?";
    
    private static final String SENDNOTIFICATION = "INSERT INTO [dbo].[notifications]([userid], [detail], [status], [createdate]) values (?, ?, ?, ?)";
    
    //NOTIFICATION SAMPLE
    
    private static final String ACCEPTSELLERREQUEST = "Yêu cầu trở thành Seller của bạn đã được chấp thuận. Hãy cập nhật thêm một số thông tin cho shop của bạn.";
    
    private static final String DECLINESELLERREQUEST = "Yêu cầu trở thành Seller của bạn đã bị từ chối. Vui lòng kiểm tra lại thông tin trước khi gửi lại yêu cầu.";
    
    private static final String ACCEPTREFUNDREQUEST = "Yêu cầu trả hàng/hoàn tiền cho đơn hàng [1] đã được chấp nhận...";
    
    private static final String DECLINEREFUNDREQUEST = "Yêu cầu trả hàng/hoàn tiền cho đơn hàng [1] đã bị từ chối.";
    
    private static final String APPLYBANSTATUS = "Tài khoản của bạn đã bị hạn chế chức năng bán hàng vì vi phạm quy định của Co. Handmade.\nLý do: [1]\nThời gian hiệu lực: [2]";
    
    private static final String REMOVEBANSTATUS = "Các hạn chế đối với tài khoản của bạn đã được gỡ bỏ. Vui lòng xem lại và tuân thủ các quy định, điều khoản và chính sách của Co. Handmade để tránh những hình phạt đối với tài khoản.";
    
    
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
        String notification = "";
        try (Connection con = SQLConnection.getConnection()) {
            int status = -1;
            if (Status.equals("Waiting")) status = 0;
            else if (Status.equals("Accept")) {
                status = 1;
                notification = ACCEPTREFUNDREQUEST;
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
    
    public static ArrayList<ReportedUser> Get_Report_List() {
        ArrayList<ReportedUser> result = new ArrayList<ReportedUser>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETBANLIST);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int userId = rs.getInt("user_id");
                int reporterId = rs.getInt("reporter_id");
                Timestamp date = rs.getTimestamp("date");
                String reason = rs.getString("reason").trim();
                String detail = rs.getString("detail").trim();
                ReportedUser r = new ReportedUser(id, userId, null, null, null, null, null, -1, date, null, reason, detail);
                r = Get_Report_Detail(r, userId, reporterId);
                result.add(r);                
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static ReportedUser Get_Report_Detail(ReportedUser r, int userId, int reporterId) {
        ReportedUser result = r;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETBANDETAIL);
            ptm.setInt(1, userId);
            rs = ptm.executeQuery();
            if (rs.next()) {
                Timestamp bantime = rs.getTimestamp("bantime");
                String username = rs.getString("username").trim();
                String email = rs.getString("email").trim();
                String status = new String();
                switch(rs.getInt("status")) {
                    case -1:
                        status = "Active";
                        break;
                    case 1:
                        status = "Reported";
                        break;
                    case 2:
                        status = "Ban (Temporary)";
                        break;
                    case 3:
                        status = "Ban (Unlimited)";
                        break;
                }
                result.setBantime(bantime);
                result.setUserName(username);
                result.setEmail(email);
                result.setStatus(status);
            }
            rs = null;
            ptm = con.prepareStatement(GETBANDETAIL);
            ptm.setInt(1, reporterId);
            rs = ptm.executeQuery();
            if (rs.next()) {
                String username = rs.getString("username").trim();
                result.setReportBy(username);
            }
            rs = null;
            ptm = con.prepareStatement(GETSHOPDETAIL);
            ptm.setInt(1, userId);
            rs = ptm.executeQuery();
            if (rs.next()) {
                String shopname = rs.getString("shop_name").trim();
                int count = rs.getInt("shop_reported_count");
                result.setCount(count);
                result.setShopname(shopname);
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static void Apply_Ban(int id, int status, int bandays) {
        PreparedStatement ptm = null;
        Timestamp bantime = new Timestamp(System.currentTimeMillis());
        try (Connection con = SQLConnection.getConnection()) {
            bantime = addDays(bantime, bandays);
            ptm = con.prepareStatement(UPDATEBAN);
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
    
    public static ArrayList<SellerRequest> Get_Approve_List() {
        ArrayList<SellerRequest> result = new ArrayList<SellerRequest>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETAPPROVELIST);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int userId = rs.getInt("user_id");
                Timestamp date = rs.getTimestamp("request_date");
                String shopname = rs.getString("shopname").trim();
                String CCCD = rs.getString("CCCD").trim();
                SellerRequest r = new SellerRequest(id, userId, null, null, shopname, CCCD, null, date);
                r = Get_Approve_Detail(r, userId);
                result.add(r);                
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static SellerRequest Get_Approve_Detail(SellerRequest r, int userId) {
        SellerRequest result = r;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETAPPROVEDETAIL);
            ptm.setInt(1, userId);
            rs = ptm.executeQuery();
            if (rs.next()) {
                Timestamp date = rs.getTimestamp("createdate");
                String username = rs.getString("username").trim();
                String fullname = rs.getString("fullname").trim();
                result.setCreateDate(date);
                result.setFullname(fullname);
                result.setUserName(username);
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static void Approve_Seller(int id, boolean accept) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            if (accept) {
                String CCCD = new String();
                String shopname = new String();
                ptm = con.prepareStatement(GETAPPROVEREQUEST);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    CCCD = rs.getString("CCCD");
                    shopname = rs.getString("shopname");
                }
                ptm = con.prepareStatement(DOAPPROVESELLER);
                ptm.setInt(1, id);
                ptm.executeUpdate();
                ptm = con.prepareStatement(CREATESHOP);
                ptm.setInt(1, id);
                ptm.setString(2, CCCD);
                ptm.setString(3, shopname);
                ptm.executeUpdate();
            }
            ptm = con.prepareStatement(DELETEAPPROVEREQUEST);
            ptm.setInt(1, id);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void Send_Notification(int toUser, String detail) {
        PreparedStatement ptm = null;
        Timestamp createtime = new Timestamp(System.currentTimeMillis());
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(SENDNOTIFICATION);
            ptm.setInt(1, toUser);
            ptm.setString(2, detail);
            ptm.setInt(3, 0);
            ptm.setTimestamp(4, createtime);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        Update_Main_Category(3, "houseware", "");
    }
    
}