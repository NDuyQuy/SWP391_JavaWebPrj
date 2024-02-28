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
    private static final String GETSHOPCATEGORIES = "SELECT s.[id], s.[name],m.[name] FROM [shopcategory] s inner join [maincategory] m on s.[maincate_id] = m.[id] WHERE [shop_id]=?";
    private static final String CREATESHOPCATEGORY ="INSERT INTO [shopcategory](maincate_id,shop_id,name)VALUE(?,?,?)";
    private static final String CREATEPRODUCT = "INSERT [products](mcate_id,description,created_date,name,price,"
            + "img,quantity) VALUE (?,?,GETDATE(),?,?,?,?)";
    private static final String GETSHOPBYID = "SELECT [shop_description],[shop_img],[shop_name] FROM [shops] WHERE [shop_id]=?";
    
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
                int id = rs.getInt(1);
                //GET SHOP CATEGORY NAME
                String sname = rs.getString(2).trim();
                //GET MAIN CATEGORY NAME
                String mname = rs.getString(3).trim();
                mc = new MainCategory();    mc.setCategoryName(mname);
                sc = new ShopCategory(shop_id, mc, shop, sname);
                shopCategories.add(sc);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return shopCategories;
    }
    public static void main(String[] args) {
        getShopCategories(23).forEach(System.out::println);
    }
}
