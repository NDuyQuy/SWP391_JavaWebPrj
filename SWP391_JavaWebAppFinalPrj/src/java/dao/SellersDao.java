/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import model.*;
/**
 *
 * @author ASUS
 */
public class SellersDao {
   
    private static final String GETSHOPBYID = "SELECT [shop_description],[shop_img],[shop_name] FROM [shops] WHERE [shop_id]=?";
    private static final String GETALLSHOP = "Select [shop_id],[shop_name],[shop_img],[shop_description] from [shops]";
    
    //SHOP CATEGORY RELATED SQL STATEMENT 
    private static final String GETSHOPCATEGORIES = "SELECT s.[id], s.[name],m.[name],m.[id] "
            + "FROM [shopcategory] s inner join [maincategory] m on s.[maincate_id] = m.[id] WHERE [shop_id]=?";
    private static final String CREATESHOPCATEGORY ="INSERT INTO [shopcategory](maincate_id,shop_id,name)VALUES(?,?,?)";
    private static final String EDITSHOPCATEGORY = "UPDATE [shopcategory] SET [name] = ?, [maincate_id]=? WHERE [id] = ?";
    private static final String DELETESHOPCATEGORY = "DELETE [shopcategory] WHERE [id]=?";
    
    //PRODUCTS RELATED SQL STATEMENT
    private static final String CREATEPRODUCT = "INSERT [products](shop_id,mcate_id,description,created_date,name,price,"
            + "img,quantity) VALUES (?,?,?,GETDATE(),?,?,?,?)";
    private static final String EDITPRODUCT = "UPDATE [products] SET  [mcate_id]=?, [description]=?, [name]=?, [price]=?, "
            + "[img]=?, quantity=? WHERE [product_id]=?";
    private static final String DELETEPRODUCT = "DELETE [products] WHERE [product_id] = ?";
    
    //SHOP VOUCHERS RELATED SQL STATEMENT
    private static final String GETVOUCHERS = "SELECT [voucher_id],[code],[discount_amount],[type],[min_require],[use_count],[start_date],[expire_date],[description] FROM [vouchers] WHERE [shop_id] = ?";
    
    private static final String GETVOUCHERBYID = "SELECT [voucher_id],[code],[discount_amount],[start_date],[expire_date],[type],[min_require],[description],[shop_id],[product_id],[use_count] FROM [vouchers] WHERE [voucher_id] = ?";
    
    private static final String CREATEVOUCHER = "INSERT INTO [vouchers]([code],[discount_amount],"
            + "[start_date],[expire_date],[type],[description],[shop_id],[product_id],[use_count],[min_require]) VALUES(?,?,?,?,?,?,?,?,?,?)";
    private static final String EDITVOUCHER = "UPDATE [vouchers] SET [code]=?, [discount_amount]=?, [start_date]=?, [expire_date]=?, "
            + "[type]=?, [description]=?,[shop_id]=?,[product_id]=?,[use_count]=?,[min_require]=? WHERE [voucher_id]=?";
    private static final String DELETEVOUCHER = "DELETE [vouchers] WHERE [voucher_id]=?";
    //CUSTOM ORDER REALTED SQL STATEMENT
    private static final String GETCUSTOMORDERS = "SELECT [id],[product_name],[expected_complete_date],[status],[cost] FROM [custom_order] WHERE [seller_id]=?";
    private static final String CREATECUSTOMORDER = "INSERT INTO [custom_order]([id],[product_name],[expected_complete_date],[seller_id],[status],[cost])VALUES(?,?,?,?,?,?)";
        //UPDATE CUSTOM ORDER COMPLETE PROCESS
    private static final String UPDATESTATUS = "UPDATE [order] SET [status]=? WHERE [id]=?";
    private static final String UPDATECOMPLETEPROCESS = "INSERT INTO [custom_order_detail]([customorder_id],[process_img],[process_video],[description]) VALUES(?,?,?,?)";
    
    public static Shops getShopById(int id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Users user = UsersDao.getUserById(id);
        Shops shop = new Shops();
        try(Connection con=SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETSHOPBYID);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            if(rs.next()){
                shop.users = user;
                shop.setDescription(rs.getString("shop_description")==null?null:rs.getString("shop_description").trim());
                shop.setShop_img(rs.getString("shop_img")==null?null:rs.getString("shop_img").trim());
                shop.setShop_name(rs.getString("shop_name").trim());
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return shop;
    }
    
    public static ArrayList<Shops> getAllShop(){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Shops s = null;
        ArrayList<Shops> shop_list = new ArrayList<>();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETALLSHOP);
            rs = ptm.executeQuery();
            while(rs.next()){
                s = new Shops();
                s.setShop_id(rs.getInt("shop_id"));
                s.users = UsersDao.getUserById(rs.getInt("shop_id"));
                s.setShop_name(rs.getString("shop_name").trim());
                s.setShop_img(rs.getString("shop_img")==null?null:rs.getString("shop_img").trim());
                s.setDescription(rs.getString("shop_description")==null?null:rs.getString("shop_description").trim());
                shop_list.add(s);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return shop_list;
    }
    
    public static ArrayList<ShopCategory> getShopCategories(int shop_id){
        ArrayList<ShopCategory> shopCategories = new ArrayList<>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ShopCategory sc = null;
        try(Connection con=SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETSHOPCATEGORIES);
            ptm.setInt(1, shop_id);
            rs = ptm.executeQuery();
            while(rs.next()){
                sc = new ShopCategory();
                sc.setShop_id(shop_id);
                //GET SHOP CATEGORY ID & NAME
                int id = rs.getInt("id");
                String sname = rs.getString(2).trim();
                //GET MAIN CATEGORY ID & NAME 
                String mname = rs.getString(3).trim();
                int mcate_id = rs.getInt(4);
                sc.maincategory = new MainCategory(mcate_id, mname);
                sc.setId(id);   sc.setName(sname); sc.setMaincate_id(mcate_id);
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
    public static ArrayList<Vouchers> getShopVouchers(int shop_id){
        ArrayList<Vouchers> vouchers = new ArrayList<>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Vouchers voucher = null;
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
                Date start_date = new Date(rs.getTimestamp("start_date").getTime());
                Date expire_date = new Date(rs.getTimestamp("expire_date").getTime());
                String description = rs.getString("description");
                voucher = new Vouchers(voucher_id, code, discount_amount, start_date, expire_date, type, min_require, description);
                vouchers.add(voucher);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return vouchers;
    }
    
    public static Vouchers getVoucherByID(int id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Vouchers voucher = null;
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
                voucher = new Vouchers(voucher_id, code, discount_amount, start_date, expire_date, type, min_require, description);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return voucher;
    }
    public static void createShopVoucher(Vouchers voucher){
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(CREATEVOUCHER);
            ptm.setString(1, voucher.getCode());
            ptm.setInt(2, voucher.getDiscount_amount());
            ptm.setDate(3, (Date) voucher.getStart_date());
            ptm.setDate(4, (Date) voucher.getExpire_date());
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
    public static void editShopVoucher(Vouchers voucher){
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(EDITVOUCHER);
            ptm.setString(1, voucher.getCode());
            ptm.setInt(2, voucher.getDiscount_amount());
            ptm.setDate(3, (Date) voucher.getStart_date());
            ptm.setDate(4, (Date) voucher.getExpire_date());
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
    
    public static ArrayList<Products> getShopProducts(int shop_id) {
        return ProductDao.getProductsByShop(shop_id);
    }
    public static Products getProductById(int product_id){
        return ProductDao.getProductById(product_id);
    }
    public static void createShopProducts(Products product, int shop_id){
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(CREATEPRODUCT);
            ptm.setInt(1, shop_id);
            ptm.setInt(2, product.getShop_id());
            ptm.setString(3, product.getDescription());
            ptm.setString(4, product.getName());
            ptm.setInt(5, (int)product.getMoney());
            ptm.setString(6, product.getImg());
            ptm.setInt(7, product.getQuantity());
            ptm.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void editShopProducts(Products product){
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(EDITPRODUCT);
            ptm.setInt(1, product.getShop_id());
            ptm.setString(2, product.getDescription());
            ptm.setString(3, product.getName());
            ptm.setInt(4, (int)product.getMoney());
            ptm.setString(5, product.getImg());
            ptm.setInt(6, product.getQuantity());
            ptm.setInt(7, product.getProduct_id());
            ptm.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void deleteShopProducts(int product_id){
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(DELETEPRODUCT);
            ptm.setInt(1, product_id);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static ArrayList<CustomOrder> getShopCustomOrders(int seller_id){
        ArrayList<CustomOrder> orders = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETCUSTOMORDERS);
            ptm.setInt(1, seller_id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String product_name = rs.getString("product_name");
                Date expected_complete_date = rs.getDate("expected_complete_date");
                String status = rs.getString("status");
                double cost = rs.getDouble("cost");
                //CustomOrder co = new CustomOrder(id, product_name, expected_complete_date, status, cost);
                //orders.add(co);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return orders;
    }
    public static void createCustomOrder(CustomOrder order){
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(CREATECUSTOMORDER);
            ptm.setInt(1, order.getId());
            ptm.setString(2, order.getProduct_name());
            ptm.setDate(3, (Date) order.getExpected_complete_date());
            ptm.setInt(4, order.order.getShop_id());
            ptm.setString(5, order.order.getStatus());
            ptm.setInt(6, (int)order.order.getTotal());
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
    }
}
