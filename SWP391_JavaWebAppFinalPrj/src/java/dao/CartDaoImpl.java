package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDaoImpl implements CartDao {

    private static final String ADD_TO_CART = "INSERT INTO cartdetail (user_id, product_id, quantity) VALUES (?, ?, ?)";
    private static final String UPDATE_CART_ITEM_QUANTITY = "UPDATE cartdetail SET quantity = ? WHERE user_id = ? AND product_id = ?";
    private static final String REMOVE_FROM_CART = "DELETE FROM cartdetail WHERE user_id = ? AND product_id = ?";
    // private static final String GET_CART_ITEMS = "SELECT * FROM [cartdetail] WHERE [user_id] = ?";
    private static final String GET_CART_ITEMS = "SELECT cd.*, p.*, s.shop_name\n"
            + "FROM cartdetail cd\n"
            + "INNER JOIN products p ON cd.product_id = p.product_id\n"
            + "INNER JOIN shops s ON p.shop_id = s.shop_id\n"
            + "WHERE cd.user_id = ?";
    private static final String CLEAR_CART = "DELETE FROM cartdetail WHERE user_id = ?";

    @Override
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

    @Override
    public void updateCartItemQuantity(int userId, int productId, int quantityChange) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ptm = con.prepareStatement(UPDATE_CART_ITEM_QUANTITY)) {
            int currentQuantity = getCartItemQuantity(userId, productId);
            int newQuantity = currentQuantity + quantityChange;
            if (newQuantity > 0) {
                ptm.setInt(1, newQuantity);
                ptm.setInt(2, userId);
                ptm.setInt(3, productId);
                ptm.executeUpdate();
            } else if (newQuantity == 0) {
                removeFromCart(userId, productId);
            }
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

    @Override
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
     
    public static List<CartItem> getCartItems(int userId) {
        List<CartItem> cartItems = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ptm = con.prepareStatement(GET_CART_ITEMS)) {
            ptm.setInt(1, userId);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                String shop_name = rs.getString("shop_name");
                Shop shop = new Shop();
                shop.setShopName(shop_name);
                // Lấy thông tin sản phẩm từ ResultSet
                Product product = new Product();
                product.setProductID(productId);
                product.setProductName(rs.getString("name"));
                product.setPrice(rs.getFloat("price"));
                product.setProductImg(rs.getString("img"));
                product.setQuantity(rs.getInt("quantity"));
                // Tạo đối tượng CartItem và thêm vào danh sách
                cartItems.add(new CartItem(product, quantity, shop));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    @Override
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

        CartDaoImpl cartDao = new CartDaoImpl();
        List<CartItem> cartItems = cartDao.getCartItems(userId);

        if (cartItems.isEmpty()) {
            System.out.println("No items found in the cart for user ID: " + userId);
        } else {
            System.out.println("Cart items for user ID " + userId + ":");
            for (CartItem cartItem : cartItems) {
                System.out.println("Product ID: " + cartItem.getProduct().getProductID());
                System.out.println("Product Name: " + cartItem.getProduct().getProductName());
                System.out.println("Quantity: " + cartItem.getQuantity());
                System.out.println("Shop Name: " + cartItem.getShop().getShopName());
                System.out.println("Total Price: " + (cartItem.getProduct().getPrice() * cartItem.getQuantity()));
                System.out.println("-------------");
            }
        }
    }
    */

    @Override
    public void clearCart(int userId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
