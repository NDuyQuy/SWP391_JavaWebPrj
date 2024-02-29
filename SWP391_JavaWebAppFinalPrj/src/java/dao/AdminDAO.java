/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;
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
    
    private static final String GETVOUCHERLIST = "SELECT [voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [use_count] FROM [dbo].[vouchers]";
    
    private static final String GETAPPLIEDLIST_PRODUCT = "SELECT [product_id] FROM [dbo].[productvoucherdetail] WHERE [voucher_id] = ?";
    
    private static final String GETAPPLIEDLIST_SHOP = "SELECT [shop_id] FROM [dbo].[shopvoucherdetail] WHERE [voucher_id] = ?";
    
    private static final String GETAPPLIEDLIST_MAIN = "SELECT [category_id] FROM [dbo].[mainvoucherdetail] WHERE [voucher_id] = ?";
    
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
            rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("voucher_id");
                String Code = rs.getString("code").trim();
                int Discount = rs.getInt("discount_amount");
                Date Start = rs.getDate("start_date");
                Date End = rs.getDate("expire_date");
                int Type = rs.getInt("type");
                int Min = rs.getInt("min_require");
                String Description = rs.getString("description").trim();
                int Count = rs.getInt("use_count");
                Voucher v = new Voucher(id, Code, Discount, Start, End, Type, Min, Description, Count);
                v = Get_Applied_List(v);
                result.add(v);                
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
    
    
    
    public static void main(String[] args) {
        Update_Main_Category(3, "houseware", "");
    }
    
}
