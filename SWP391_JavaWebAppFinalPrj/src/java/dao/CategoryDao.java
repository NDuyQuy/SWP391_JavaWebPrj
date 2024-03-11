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
    private static final String GETSHOPCATEGORYBYID = "Select [maincate_id],[shop_id],[name] FROM [shopcategory] WHERE [id]=?";
    private static final String GETSHOPCATEGORYBYSHOP = "Select [maincate_id],[id],[name] from [shopcategory] where [shop_id]=?";
    private static final String GETMAINCATEGORIES = "Select [id],[name] from [maincategory]";
    
    public static MainCategory getMainCategoryById(int id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        MainCategory mc = new MainCategory();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETMAINCATEGORYBYID);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            if(rs.next()){
                mc = new MainCategory(id, rs.getString("name").trim());
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
                Shop shop = SellersDao.getShopById(rs.getInt("shop_id"));
                String shopName = rs.getString("name").trim();
                sc = new ShopCategory(id, mc, shop, shopName);
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
                mc.setCategoryID(rs.getInt("id"));
                mc.setCategoryName(rs.getString("name"));
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
                sc.setmCate(getMainCategoryById(rs.getInt("maincate_id")));
                sc.setCategoryID(rs.getInt("id"));
                sc.setShop(SellersDao.getShopById(s_id));
                sc.setCategoryName(rs.getString("name"));
                cate_shop.add(sc);
            }
        } catch(Exception ex){
            ex.printStackTrace();
        }
        return cate_shop;
    }
}
