/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;
/**
 *
 * @author ASUS
 */
public class SellersDao {
    //SHOP CATEGORY RELATED SQL STATEMENT 
    private static final String CREATESHOPCATEGORY ="INSERT INTO [shopcategory](maincate_id,shop_id,name)VALUES(?,?,?)";
    
    private static final String EDITSHOPCATEGORY = "UPDATE [shopcategory] SET [name] = ?, [maincate_id]=? WHERE [id] = ?";
    
    private static final String DELETESHOPCATEGORY = "DELETE [shopcategory] WHERE [id]=?";
    
    //PRODUCTS RELATED SQL STATEMENT
    private static final String CREATEPRODUCT = "INSERT [products](mcate_id,description,created_date,name,price,"
            + "img,quantity) VALUES (?,?,GETDATE(),?,?,?,?)";   
    
    private static final String EDITPRODUCT = "UPDATE [products] SET  [mcate_id]=?, [description]=?, [name]=?, [price]=?, "
            + "[img]=?,quantity=? WHERE [product_id]=?";
    
    private static final String DELETEPRODUCT = "DELETE [products] WHERE [product_id] = ?";
    
    // VOUCHERS RELATED SQL STATEMENT
    private static final String CREATEVOUCHER = "INSERT INTO [vouchers]([code],[discount_amount],"
            + "[start_date],[expire_date],[type],[description],[shop_id],[use_count]) VALUES(?,?,?,?,?,?,?,?,?)";
    
    private static final String EDITVOUCHER = "UPDATE [vouchers] SET [code]=?, [discount_amount]=?, [start_date]=?, [expire_date]=?, "
            + "[type]=?, [description]=?,[shop_id]=?,[use_count]=? WHERE [voucher_id]=?";
    
    private static final String DELETEVOUCHER = "DELETE [voucher] WHERE [voucher_id]=?";
    
    
}
