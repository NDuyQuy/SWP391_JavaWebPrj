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

public class CartDao {

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

    public static void removeFromCart(int userId, int productId) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ptm = con.prepareStatement(REMOVE_FROM_CART)) {
            ptm.setInt(1, userId);
            ptm.setInt(2, productId);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

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
                Shops shop = new Shops();
                shop.setShop_name(shop_name);
                // Lấy thông tin sản phẩm từ ResultSet
                Products product = new Products();
                product.setProduct_id(productId);
                product.setName(rs.getString("name"));
                product.setMoney(rs.getInt("price"));
                product.setImg(rs.getString("img"));

                CartDetail cartDetail = new CartDetail(userId, productId, quantity, product);
                cartDetail.setShop(shop);
                cartItems.add(cartDetail);
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
        CartDao test = new CartDao();

        // Thay đổi userId và productId theo nhu cầu của bạn
        int userId = 4; // Thay đổi userId thành userId thích hợp
        int productId = 4; // Thay đổi productId thành productId thích hợp

        // Gọi phương thức removeFromCart để xóa sản phẩm khỏi giỏ hàng của người dùng
        test.removeFromCart(userId, productId);

        // Thông báo khi xóa sản phẩm thành công
        System.out.println("Sản phẩm với productId = " + productId + " đã được xóa khỏi giỏ hàng của người dùng có userId = " + userId);
    }
}
