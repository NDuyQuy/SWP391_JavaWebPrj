/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.*;
/**
 *
 * @author LENOVO
 */
public class SellersDao {
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
    
    public static void main(String[] args) {
        System.out.println(getShopById(23).getShopName());
    }
}
