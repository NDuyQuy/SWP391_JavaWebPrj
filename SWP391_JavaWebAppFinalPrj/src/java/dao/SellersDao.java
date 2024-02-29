/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.*;
/**
 *
 * @author ASUS
 */
public class SellersDao {
   
    private static final String GETSHOPBYID = "SELECT [shop_description],[shop_img],[shop_name] FROM [shops] WHERE [shop_id]=?";
    
    //SHOP CATEGORY RELATED SQL STATEMENT 
    private static final String GETSHOPCATEGORIES = "SELECT s.[id], s.[name],m.[name] FROM [shopcategory] s inner join [maincategory] m on s.[maincate_id] = m.[id] WHERE [shop_id]=?";
    private static final String CREATESHOPCATEGORY ="INSERT INTO [shopcategory](maincate_id,shop_id,name)VALUES(?,?,?)";
    private static final String EDITSHOPCATEGORY = "UPDATE [shopcategory] SET [name] = ?, [maincate_id]=? WHERE [id] = ?";
    private static final String DELETESHOPCATEGORY = "DELETE [shopcategory] WHERE [id]=?";
    //PRODUCTS RELATED SQL STATEMENT
    private static final String CREATEPRODUCT = "INSERT [products](mcate_id,description,created_date,name,price,"
            + "img,quantity) VALUES (?,?,GETDATE(),?,?,?,?)";
    private static final String EDITPRODUCT = "UPDATE [products] SET  [mcate_id]=?, [description]=?, [name]=?, [price]=?, "
            + "[img]=?,quantity=? WHERE [product_id]=?";
    private static final String DELETEPRODUCT = "DELETE [products] WHERE [product_id] = ?";
    
    //SHOP VOUCHERS RELATED SQL STATEMENT
    private static final String CREATEVOUCHER = "INSERT INTO [vouchers]([code],[discount_amount],"
            + "[start_date],[expire_date],[type],[description],[shop_id],[use_count]) VALUES(?,?,?,?,?,?,?,?,?)";
    private static final String EDITVOUCHER = "UPDATE [vouchers] SET [code]=?, [discount_amount]=?, [start_date]=?, [expire_date]=?, "
            + "[type]=?, [description]=?,[shop_id]=?,[use_count]=? WHERE [voucher_id]=?";
    private static final String DELETEVOUCHER = "DELETE [voucher] WHERE [voucher_id]=?";
    public static Shop getShopById(int id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        User user = UsersDao.getUserById(id);
        Shop shop = new Shop();
        try(Connection con=SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETSHOPBYID);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            if(rs.next()){
                shop.setUser(user);
                shop.setDescription(rs.getString("shop_description")==null?null:rs.getString("shop_description").trim());
                shop.setShopImg(rs.getString("shop_img")==null?null:rs.getString("shop_img").trim());
                shop.setShopName(rs.getString("shop_name"));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return shop;
    }
    
    public static ArrayList<ShopCategory> getShopCategories(int shop_id){
        ArrayList<ShopCategory> shopCategories = new ArrayList<>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Shop shop = null; MainCategory mc = null;
        ShopCategory sc = null;
        try(Connection con=SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETSHOPCATEGORIES);
            ptm.setInt(1, shop_id);
            shop = SellersDao.getShopById(shop_id);
            rs = ptm.executeQuery();
            while(rs.next()){
                //GET SHOP CATEGORY ID 
                int id = rs.getInt("id");
                //GET SHOP CATEGORY NAME
                String sname = rs.getString(2).trim();
                //GET MAIN CATEGORY NAME
                String mname = rs.getString(3).trim();
                mc = new MainCategory();    mc.setCategoryName(mname);
                sc = new ShopCategory(id, mc, shop, sname);
                shopCategories.add(sc);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return shopCategories;
    }
    public static void createShopCategory(int maincate_id, int shop_id, String name){
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(CREATESHOPCATEGORY);
            ptm.setInt(1, maincate_id);
            ptm.setInt(2, shop_id);
            ptm.setString(3, name);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void editShopCategory(int maincate_id, int id, String name){
        //id in here is shop_cate_id
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(EDITSHOPCATEGORY);
            ptm.setInt(2, maincate_id);
            ptm.setInt(3, id);
            ptm.setString(1, name);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void deleteShopCategory(int id){
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(DELETESHOPCATEGORY);
            ptm.setInt(1, id);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        getShopCategories(23).forEach(System.out::println);
        //createShopCategory(1, 23, "Blazer");
        //editShopCategory(1, 4, "POLO T-Shirt");
        //deleteShopCategory(4);
    }
}
