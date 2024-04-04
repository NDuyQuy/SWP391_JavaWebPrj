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
import java.util.Map;
import java.util.stream.Collectors;
import model.CartDetail;
import model.ProductDetail;

/**
 *
 * @author ASUS
 */
public class CartDetailDao {

    private static final String CHECK_CART = "SELECT * FROM cartdetail WHERE user_id = ? AND p_detail_id = ?";
    private static final String INSERT_CART = "INSERT INTO cartdetail (user_id,  quantity, p_detail_id) VALUES (?, ?, ?)";
    private static final String UPDATE_CART = "UPDATE cartdetail SET quantity = quantity + ? WHERE user_id = ? AND p_detail_id = ?";

    private static final String UPDATE_CART_ITEM_QUANTITY = "UPDATE cartdetail SET quantity = ? WHERE user_id = ? AND p_detail_id = ?";

    private static final String GET_CART_ITEMS = "SELECT * FROM [cartdetail] WHERE [user_id] = ?";
    private static final String CLEAR_CART = "DELETE FROM cartdetail WHERE user_id = ?";
    private static final String REMOVE_PRODUCT_FROM_CART = "DELETE FROM [cartdetail] WHERE [user_id]=? AND [p_detail_id]=?";

    //done
    public static void addToCart(int userId, int p_detail_id, int quantity) {
        try ( Connection con = SQLConnection.getConnection();  PreparedStatement checkSt = con.prepareStatement(CHECK_CART);  PreparedStatement insertSt = con.prepareStatement(INSERT_CART);  PreparedStatement updateSt = con.prepareStatement(UPDATE_CART)) {
            checkSt.setInt(1, userId);
            checkSt.setInt(2, p_detail_id);
            ResultSet rs = checkSt.executeQuery();
            if (rs.next()) {
                // Sản phẩm đã có trong giỏ hàng, cập nhật số lượng
                updateSt.setInt(1, quantity);
                updateSt.setInt(2, userId);
                updateSt.setInt(3, p_detail_id);
                updateSt.executeUpdate();
            } else {
                // Sản phẩm chưa có trong giỏ hàng, thêm mới
                insertSt.setInt(1, userId);
                insertSt.setInt(2, quantity);
                insertSt.setInt(3, p_detail_id);

                insertSt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//done

    public static void UpdateCartProductQuantity(int quantity, int user_id, int p_detail_id) {
        try ( Connection con = SQLConnection.getConnection()) {
            PreparedStatement statement = con.prepareStatement(UPDATE_CART_ITEM_QUANTITY);
            statement.setInt(1, quantity);
            statement.setInt(2, user_id);
            statement.setInt(3, p_detail_id);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void ClearCartOfUser(int user_id) {
        try ( Connection con = SQLConnection.getConnection()) {
            PreparedStatement statement = con.prepareStatement(CLEAR_CART);
            statement.setInt(1, user_id);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//done

    public static void RemoveAProduct(int user_id, int p_detail_id) {
        try ( Connection con = SQLConnection.getConnection()) {
            PreparedStatement statement = con.prepareStatement(REMOVE_PRODUCT_FROM_CART);
            statement.setInt(1, user_id);
            statement.setInt(2, p_detail_id);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<CartDetail> GetCartOfUser(int user_id) {
        List<CartDetail> cart = new ArrayList<>();
        try ( Connection con = SQLConnection.getConnection()) {
            PreparedStatement statement = con.prepareStatement(GET_CART_ITEMS);
            statement.setInt(1, user_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int p_detail_id = resultSet.getInt("p_detail_id");
                int quantity = resultSet.getInt("quantity");
                CartDetail cartDetail = new CartDetail(user_id, p_detail_id, quantity);
                ProductDetail productDetail = SellersDao.getProductDetailById(p_detail_id);
                cartDetail.setProductDetail(productDetail);
                cart.add(cartDetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cart;
    }

    public static void main(String[] args) {
//        int user_id = 6;
//        List<CartDetail> cart = CartDetailDao.GetCartOfUser(user_id);
//
//        // GROUP BY NAME
//        Map<String, List<CartDetail>> cartGroup = cart.stream().collect(
//                Collectors.groupingBy(c -> SellersDao.getShopNameByShopId(c.getProductDetail().getProduct().getShop_id()))
//        );
//        // Duyệt qua từng cửa hàng và hiển thị thông tin sản phẩm
//        for (Map.Entry<String, List<CartDetail>> entry : cartGroup.entrySet()) {
//            String shopName = entry.getKey();
//            System.out.println("Tên cửa hàng: " + shopName);
//
//            // Hiển thị thông tin sản phẩm trong cửa hàng
//            List<CartDetail> cartItems = entry.getValue();
//            for (CartDetail cartItem : cartItems) {
//                System.out.println("Tên sản phẩm: " + cartItem.getProductDetail().getProduct().getName());
//                System.out.println("Tên chi tiết sản phẩm: " + cartItem.getProductDetail().getName());
//                System.out.println("Số lượng: " + cartItem.getQuantity());
//                System.out.println("Giá: " + cartItem.getProductDetail().getPrice());
//                System.out.println("----------------------------------");
//            }
//        }
        int user_id = 6;
        int p_detail_id = 3;
        int newQuantity = 5;
        UpdateCartProductQuantity(newQuantity, user_id, p_detail_id);

        // Kiểm tra sau khi cập nhật
        System.out.println("Đã cập nhật số lượng sản phẩm trong giỏ hàng của người dùng " + user_id);
    }
}
