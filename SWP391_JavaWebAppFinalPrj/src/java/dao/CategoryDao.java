/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.*;

/**
 *
 * @author hien
 */
public class CategoryDao {
    private static final String GETMAINCATEGORYBYID = "Select [name] FROM [maincategory] WHERE [id]=?";
    private static final String GETSHOPCATEGORYBYID = "Select [id],[maincate_id],[shop_id],[name],[description] FROM [shopcategory] WHERE [id]=?";
    private static final String GETSHOPCATEGORYBYSHOP = "Select [id],[maincate_id],[shop_id],[name],[description] from [shopcategory] where [shop_id]=?";
    private static final String GETMAINCATEGORIES = "Select [id],[name],[description] from [maincategory]";
    
    public static MainCategory getMainCategoryById(int id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        MainCategory mc = new MainCategory();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETMAINCATEGORYBYID);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            if(rs.next()){
                String name = rs.getString("name").trim();
                String description = rs.getString("description").trim();
                mc = new MainCategory(id, name, description);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return mc;
    }
    
    public static ShopCategory getShopCategoryById(int id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ShopCategory sc = new ShopCategory();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETSHOPCATEGORYBYID);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            if(rs.next()){
                MainCategory mc = getMainCategoryById(rs.getInt("maincate_id"));
                Shops shop = SellersDao.getShopById(rs.getInt("shop_id"));
                String shopcategory = rs.getString("name").trim();
                String description = rs.getString("description").trim();
                sc = new ShopCategory(id, shop.getShop_id(), shopcategory, description, mc, shop);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return sc;
    }
    
    public static ArrayList<MainCategory> getMainCategories(){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        MainCategory mc = null;
        ArrayList<MainCategory> cate_list = new ArrayList<>();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETMAINCATEGORIES);
            rs = ptm.executeQuery();
            while(rs.next()){
                mc = new MainCategory();
                mc.setId(rs.getInt("id"));
                mc.setName(rs.getString("name"));
                mc.setDescription(rs.getString("description"));
                cate_list.add(mc);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return cate_list;
    }
    
    public static ArrayList<ShopCategory> getShopCategoryByShop(int s_id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ShopCategory sc = null;
        ArrayList<ShopCategory> cate_shop = new ArrayList<>();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETSHOPCATEGORYBYSHOP);
            ptm.setInt(1, s_id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                sc = new ShopCategory();
                sc.setMaincategory(getMainCategoryById(rs.getInt("maincate_id")));
                sc.setId(rs.getInt("id"));
                sc.setShop(SellersDao.getShopById(s_id));
                sc.setName(rs.getString("name"));
                sc.setDescription(rs.getString("description"));
                sc.setShop_id(s_id);
                cate_shop.add(sc);
            }
        } catch(Exception ex){
            ex.printStackTrace();
        }
        return cate_shop;
    }
}
