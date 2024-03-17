package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.CartDetail;
import model.Products;
import dao.ProductDao;
import static dao.ProductDao.getProductById;
import java.sql.SQLException;
import model.Shops;
import model.Users;

public class CartDao {

    private static final String ADD_TO_CART = "INSERT INTO cartdetail (user_id, product_id, quantity) VALUES (?, ?, ?)";
    private static final String UPDATE_CART_ITEM_QUANTITY = "UPDATE cartdetail SET quantity = ? WHERE user_id = ? AND product_id = ?";
    private static final String REMOVE_FROM_CART = "DELETE FROM cartdetail WHERE user_id = ? AND product_id = ?";
    // private static final String GET_CART_ITEMS = "SELECT * FROM [cartdetail] WHERE [user_id] = ?";
    private static final String GET_CART_ITEMS = "SELECT product_id, quantity \n"
            + "FROM cartdetail\n"
            + "INNER JOIN users ON users.id = cartdetail.user_id\n"
            + "WHERE cartdetail.user_id = ?";
    private static final String CLEAR_CART = "DELETE FROM cartdetail WHERE user_id = ?";

    
    public void addToCart(int userId, int productId, int quantity) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ptm = con.prepareStatement(ADD_TO_CART)) {
            ptm.setInt(1, userId);
            ptm.setInt(2, productId);
            ptm.setInt(3, quantity);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    public void updateCartItemQuantity(int userId, int productId, int quantityChange) {
        try (Connection con = SQLConnection.getConnection()){
            PreparedStatement ptm = con.prepareStatement(UPDATE_CART_ITEM_QUANTITY);
            ptm.setInt(1, quantityChange);
            ptm.setInt(2, userId);
            ptm.setInt(3, productId);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getCartItemQuantity(int userId, int productId) {
        int quantity = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ptm = con.prepareStatement("SELECT quantity FROM cartdetail WHERE user_id = ? AND product_id = ?")) {
            ptm.setInt(1, userId);
            ptm.setInt(2, productId);

            try (ResultSet rs = ptm.executeQuery()) {
                if (rs.next()) {
                    quantity = rs.getInt("quantity");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return quantity;
    }

    
    public void removeFromCart(int userId, int productId) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ptm = con.prepareStatement(REMOVE_FROM_CART)) {
            ptm.setInt(1, userId);
            ptm.setInt(2, productId);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
    public static List<CartItem> getCartItems(int userId) {
        List<CartItem> cartItems = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ptm = con.prepareStatement(GET_CART_ITEMS)) {
            ptm.setInt(1, userId);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                Product product = getProductById(productId);
                cartItems.add(new CartItem(product, quantity));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartItems;
    }
     */
    public static List<CartDetail> getCartItems(int userId) {
        List<CartDetail> cartItems = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ptm = con.prepareStatement(GET_CART_ITEMS)) {
            ptm.setInt(1, userId);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                String shop_name = rs.getString("shop_name");
                Users user = new Users ();
                user.setId(userId);
                // Lấy thông tin sản phẩm từ ResultSet
                Products product = new Products();
                product = ProductDao.getProductById(productId);
                // Tạo đối tượng CartItem và thêm vào danh sách
                cartItems.add(new CartDetail(userId, productId, quantity, user, product));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    
    public void clearCart(int userId) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ptm = con.prepareStatement(CLEAR_CART)) {
            ptm.setInt(1, userId);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        int userId = 27;

        CartDao cartDao = new CartDao();
        List<CartDetail> cartItems = cartDao.getCartItems(userId);

        if (cartItems.isEmpty()) {
            System.out.println("No items found in the cart for user ID: " + userId);
        } else {
            System.out.println("Cart items for user ID " + userId + ":");
            for (CartDetail cartItem : cartItems) {
                System.out.println("Product ID: " + cartItem.getProduct().getProduct_id());
                System.out.println("Product Name: " + cartItem.getProduct().getName());
                System.out.println("Quantity: " + cartItem.getQuantity());
                System.out.println("Shop Name: " + cartItem.getProduct().getShop().getShop_name());
                System.out.println("Total Price: " + (cartItem.getProduct().getMoney() * cartItem.getQuantity()));
                System.out.println("-------------");
            }
        }
    }
}
