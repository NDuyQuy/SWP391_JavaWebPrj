/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.CartDetail;

/**
 *
 * @author ASUS
 */
public class CartDetailDao {
    private static final String ADD_TO_CART = "INSERT INTO cartdetail (user_id, product_id, quantity) VALUES (?, ?, ?)";
    private static final String UPDATE_CART_ITEM_QUANTITY = "UPDATE cartdetail SET quantity = ? WHERE user_id = ? AND product_id = ?";
    private static final String REMOVE_FROM_CART = "DELETE FROM cartdetail WHERE user_id = ? AND product_id = ?";
    private static final String GET_CART_ITEMS = "SELECT * FROM [cartdetail] WHERE [user_id] = ?";
    private static final String CLEAR_CART = "DELETE FROM cartdetail WHERE user_id = ?";
    private static final String REMOVE_PRODUCT_FROM_CART = "DELETE FROM [cartdetail] WHERE [user_id]=? AND [product_id]=?";
    public static void AddToCart(int user_id, int product_id, int quantity){
        try(Connection con = SQLConnection.getConnection()){
            PreparedStatement statement = con.prepareStatement(ADD_TO_CART);
            statement.setInt(1, user_id);
            statement.setInt(2, product_id);
            statement.setInt(3, quantity);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void UpdateCartProductQuantity(int quantity, int user_id, int product_id){
        try(Connection con = SQLConnection.getConnection()){
            PreparedStatement statement = con.prepareStatement(UPDATE_CART_ITEM_QUANTITY);
            statement.setInt(1, quantity);
            statement.setInt(2, user_id);
            statement.setInt(3, product_id);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void ClearCartOfUser(int user_id){
        try(Connection con = SQLConnection.getConnection()){
            PreparedStatement statement = con.prepareStatement(CLEAR_CART);
            statement.setInt(1, user_id);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void RemoveAProduct(int user_id, int product_id){
        try(Connection con = SQLConnection.getConnection()){
            PreparedStatement statement = con.prepareStatement(REMOVE_PRODUCT_FROM_CART);
            statement.setInt(1, user_id);
            statement.setInt(2, product_id);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static List<CartDetail> GetCartOfUser(int user_id){
        List<CartDetail> cart = new ArrayList<>();
        try(Connection con = SQLConnection.getConnection()){
            PreparedStatement statement = con.prepareStatement(GET_CART_ITEMS);
            statement.setInt(1, user_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {   
                int product_id = resultSet.getInt("product_id");
                int quantity = resultSet.getInt("quantity");
                CartDetail cartDetail = new CartDetail(user_id, product_id, quantity);
                cartDetail.setProduct(SellersDao.getProductById(product_id));
                cart.add(cartDetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cart;
    }
    public static void main(String[] args) {
        GetCartOfUser(6).forEach(System.out::println);
    }
}
