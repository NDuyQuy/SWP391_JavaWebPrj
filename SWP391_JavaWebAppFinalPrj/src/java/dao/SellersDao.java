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
    private static final String GETVOUCHERS = "SELECT [voucher_id],[code],[discount_amount],[type],[min_require],[use_count] FROM [vouchers] WHERE [shop_id] = ?";
    
    private static final String GETVOUCHERBYID = "SELECT [voucher_id],[code],[discount_amount],[start_date],[expire_date],[type],[min_require],[description],[shop_id],[product_id],[use_count] FROM [vouchers] WHERE [voucher_id] = ?";
    
    private static final String CREATEVOUCHER = "INSERT INTO [vouchers]([code],[discount_amount],"
            + "[start_date],[expire_date],[type],[description],[shop_id],[product_id],[use_count],[min_require]) VALUES(?,?,?,?,?,?,?,?,?,?)";
    private static final String EDITVOUCHER = "UPDATE [vouchers] SET [code]=?, [discount_amount]=?, [start_date]=?, [expire_date]=?, "
            + "[type]=?, [description]=?,[shop_id]=?,[product_id]=?,[use_count]=?,[min_require]=? WHERE [voucher_id]=?";
    private static final String DELETEVOUCHER = "DELETE [vouchers] WHERE [voucher_id]=?";
    
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
    public static ArrayList<Voucher> getShopVouchers(int shop_id){
        ArrayList<Voucher> vouchers = new ArrayList<>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Voucher voucher = null;
        try(Connection con=SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETVOUCHERS);
            ptm.setInt(1, shop_id);
            rs = ptm.executeQuery();
            while(rs.next()){
                int voucher_id = rs.getInt("voucher_id");
                String code = rs.getString("code").trim();
                int discount_amount = rs.getInt("discount_amount");
                int type = rs.getInt("type");
                int min_require = rs.getInt("min_require");
                int use_count = rs.getInt("use_count");
                voucher = new Voucher(voucher_id, code, discount_amount, type, min_require, shop_id, use_count);
                vouchers.add(voucher);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return vouchers;
    }
    
    public static Voucher getVoucherByID(int id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Voucher voucher = null;
        try(Connection con=SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETVOUCHERBYID);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            if(rs.next()){
                int voucher_id = rs.getInt("voucher_id");
                String code = rs.getString("code").trim();
                int discount_amount = rs.getInt("discount_amount");
                Date start_date = (Date)rs.getDate("start_date");
                Date expire_date = (Date)rs.getDate("expire_date");
                int type = rs.getInt("type");
                int min_require = rs.getInt("min_require");
                String description = rs.getString("description").trim();
                int shop_id = rs.getInt("shop_id") ;
                int product_id = rs.getInt("product_id") ;
                int use_count = rs.getInt("use_count");
                voucher = new Voucher(voucher_id, code, discount_amount, start_date, expire_date, type, 
                        min_require, description, shop_id, product_id, use_count);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return voucher;
    }
    public static void createShopVoucher(Voucher voucher){
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(CREATEVOUCHER);
            ptm.setString(1, voucher.getCode());
            ptm.setInt(2, voucher.getDiscount_amount());
            ptm.setDate(3, (Date) voucher.getStart_date());
            ptm.setDate(4, (Date) voucher.getExpired_date());
            ptm.setInt(5, voucher.getType());
            ptm.setString(6, voucher.getDescription());
            ptm.setInt(7, voucher.getShop_id());
            ptm.setInt(8, voucher.getProduct_id());
            ptm.setInt(9, voucher.getUse_count());
            ptm.setInt(10, voucher.getMin_require());
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void editShopVoucher(Voucher voucher){
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(EDITVOUCHER);
            ptm.setString(1, voucher.getCode());
            ptm.setInt(2, voucher.getDiscount_amount());
            ptm.setDate(3, (Date) voucher.getStart_date());
            ptm.setDate(4, (Date) voucher.getExpired_date());
            ptm.setInt(5, voucher.getType());
            ptm.setString(6, voucher.getDescription());
            ptm.setInt(7, voucher.getShop_id());
            ptm.setInt(8, voucher.getProduct_id());
            ptm.setInt(9, voucher.getUse_count());
            ptm.setInt(10, voucher.getMin_require());
            ptm.setInt(11, voucher.getVoucher_id());
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void deleteVoucher(int id){
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(DELETEVOUCHER);
            ptm.setInt(1, id);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static ArrayList<Product> getShopProducts(int shop_id) {
        return ProductDao.getProductsByShop(shop_id);
    }
    
    public static void createShopProducts(Product product){
        
    }
    public static void editShopProducts(Product product){
        
    }
    public static void deleteShopProducts(int product_id){
        
    }
    public static void main(String[] args) {
        System.out.println(getVoucherByID(6));
        /*Date start_date = new Date(2024, 3, 1);
        Date expired_date = new Date(2024, 3, 2);
        Voucher voucher = new Voucher(6, "Mv03", 2, start_date, expired_date, 3, 1, "none", 23, 1, 10);
        editShopVoucher(voucher);*/
        //getShopVouchers(23).forEach(System.out::println);
        //createShopCategory(1, 23, "Blazer");
        //editShopCategory(1, 4, "POLO T-Shirt");
        //deleteShopCategory(4);
    }
}
