package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;
import model.Product;
import dao.ProductDao;
import static dao.ProductDao.getProductById;
import java.sql.SQLException;
import model.Shop;

public class CartDaoImpl implements CartDao {

    //  private static final String ADD_TO_CART = "INSERT INTO cartdetail (user_id, product_id, quantity) VALUES (?, ?, ?)";
    private static final String CHECK_CART = "SELECT * FROM cartdetail WHERE user_id = ? AND product_id = ?";
    private static final String INSERT_CART = "INSERT INTO cartdetail (user_id, product_id, quantity) VALUES (?, ?, ?)";
    private static final String UPDATE_CART = "UPDATE cartdetail SET quantity = quantity + ? WHERE user_id = ? AND product_id = ?";
  private static final String UPDATE_NEW_CART_QUANTITY = "UPDATE cartdetail SET quantity = ? WHERE user_id = ? AND product_id = ?";
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
                PreparedStatement checkSt = con.prepareStatement(CHECK_CART); PreparedStatement insertSt = con.prepareStatement(INSERT_CART); PreparedStatement updateSt = con.prepareStatement(UPDATE_CART)) {
            checkSt.setInt(1, userId);
            checkSt.setInt(2, productId);
            ResultSet rs = checkSt.executeQuery();
            if (rs.next()) {
                // Sản phẩm đã có trong giỏ hàng, cập nhật số lượng
                updateSt.setInt(1, quantity);
                updateSt.setInt(2, userId);
                updateSt.setInt(3, productId);
                updateSt.executeUpdate();
            } else {
                // Sản phẩm chưa có trong giỏ hàng, thêm mới
                insertSt.setInt(1, userId);
                insertSt.setInt(2, productId);
                insertSt.setInt(3, quantity);
                insertSt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateCartItemQuantity(int userId, int productId, int quantityChange) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ptm = con.prepareStatement(UPDATE_CART)) {
            {
                ptm.setInt(1, quantityChange);
                ptm.setInt(2, userId);
                ptm.setInt(3, productId);
                ptm.executeUpdate();

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void updateNewCartItemQuantity(int userId, int productId, int quantityChange) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ptm = con.prepareStatement(UPDATE_NEW_CART_QUANTITY)) {
            {
                ptm.setInt(1, quantityChange);
                ptm.setInt(2, userId);
                ptm.setInt(3, productId);
                ptm.executeUpdate();

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
     */
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

    public List<CartItem> getCartItemsByProductIds(int userId, List<Integer> productIds) throws ClassNotFoundException {
        List<CartItem> cartItems = new ArrayList<>();

        try (Connection connection = SQLConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT * FROM cartdetail WHERE user_id = ? AND product_id IN (" + getQuestionMarks(productIds.size()) + ")")) {

            preparedStatement.setInt(1, userId);

            // Set productIds as parameters
            int parameterIndex = 2;
            for (int productId : productIds) {
                preparedStatement.setInt(parameterIndex++, productId);
            }

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int productId = resultSet.getInt("productId");
                    int quantity = resultSet.getInt("quantity");

                    // Fetch the product details from the database (you may need to adjust this based on your schema)
                    Product product = ProductDao.getProductById(productId);

                    // Create CartItem object and add it to the list
                    CartItem cartItem = new CartItem(product, quantity);
                    cartItems.add(cartItem);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly in your application
        }

        return cartItems;
    }

    private String getQuestionMarks(int size) {
        StringBuilder questionMarks = new StringBuilder();
        for (int i = 0; i < size; i++) {
            questionMarks.append("?");
            if (i < size - 1) {
                questionMarks.append(",");
            }
        }
        return questionMarks.toString();
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
}
