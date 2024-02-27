/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.User;
import model.CartDetail;
import model.MainCategory;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author LENOVO
 */
public class DAO {

    Connection conn = null;//ket noi voi sqlserver
    PreparedStatement ps = null;//de nem cau lenh query sang sql
    ResultSet rs = null;//nhan ket qua tra ve

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = DBContext.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    //lay san pham moi nhat
    public Product getLast() {
        String query = "select top 1 * from product\n"
                + "order by id desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }
//lay sp theo category id

    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where cateID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(String id) {
        String query = "select * from product\n"
                + "where id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    //search by name
    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where [name] like ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Account login(String user, String pass) {
        String query = "select * from account\n"
                + "where [user] = ?\n"
                + "and pass = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getDouble(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    //check xem user co hay chua
    public Account checkAccountExist(String user) {
        String query = "select * from account\n"
                + "where [user] = ?\n";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getDouble(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void singup(String user, String pass) {
        String query = "insert into account\n"
                + "values(?,?,0,0,0)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Product> getProductBySellID(int id) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where sell_ID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteProduct(String pid) {
        String query = "delete from product\n"
                + "where id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertProduct(String name, String image, String price, String title, String description, String category, int sid, String quantity) {
        String query = "INSERT [dbo].[product] \n"
                + "([name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity])\n"
                + "  VALUES (?,?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setInt(7, sid);
            ps.setString(8, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editProduct(String name, String image, String price,
            String title, String description, String category, String pid, String quantity) {
        String query = "update product\n"
                + "  set  [name]=?, \n"
                + "[image]=?, \n"
                + "[price]=?, \n"
                + "[title]=?, \n"
                + "[description]=?, \n"
                + "[cateID]=?, \n"
                + "[quantity]=?\n"
                + "where id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setString(7, quantity);
            ps.setString(8, pid);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    
// lấy giỏ hàng của một người dùng

    /*
    public Cart getCartByUserId(int userId) {
        Cart cart = new Cart();
        String query = "SELECT * FROM Cart WHERE AccountID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement st = conn.prepareStatement(query)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int productId = rs.getInt("ProductID");
                    int amount = rs.getInt("Amount");
                    // Sử dụng hàm getProductByID để lấy thông tin sản phẩm từ cơ sở dữ liệu
                    Product product = getProductByID(String.valueOf(productId));
                    if (product != null) {
                        // Tạo một đối tượng Item từ thông tin sản phẩm và số lượng từ cơ sở dữ liệu
                        Item item = new Item(product, amount);
                        cart.addItem(item); // Thêm item vào giỏ hàng
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cart;
    }
     */
    public Cart getCartByUserId(int userId) {
        Cart cart = new Cart();
        String query = "SELECT Cart.*, Product.price "
                + "FROM Cart "
                + "INNER JOIN Product ON Cart.ProductID = Product.id "
                + "WHERE Cart.AccountID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement st = conn.prepareStatement(query)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int productId = rs.getInt("ProductID");
                    int amount = rs.getInt("Amount");
                    double price = rs.getDouble("price"); // Lấy giá từ bảng Product

                    // Sử dụng hàm getProductByID để lấy thông tin sản phẩm từ cơ sở dữ liệu
                    Product product = getProductByID(String.valueOf(productId));

                    if (product != null) {
                        // Cập nhật giá của sản phẩm
                        product.setPrice(price);

                        // Tạo một đối tượng Item từ thông tin sản phẩm và số lượng từ cơ sở dữ liệu
                        Item item = new Item(product, amount);
                        cart.addItem(item); // Thêm item vào giỏ hàng
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cart;
    }

    public void addToCart(int userId, int productId, int amount) {
        // Kiểm tra sản phẩm đã tồn tại trong giỏ hàng chưa
        String checkQuery = "SELECT * FROM Cart WHERE AccountID = ? AND ProductID = ?";
        String insertQuery = "INSERT INTO Cart (AccountID, ProductID, Amount) VALUES (?, ?, ?)";
        String updateQuery = "UPDATE Cart SET Amount = Amount + ? WHERE AccountID = ? AND ProductID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement checkSt = conn.prepareStatement(checkQuery); PreparedStatement insertSt = conn.prepareStatement(insertQuery); PreparedStatement updateSt = conn.prepareStatement(updateQuery)) {

            checkSt.setInt(1, userId);
            checkSt.setInt(2, productId);

            ResultSet rs = checkSt.executeQuery();
            if (rs.next()) {
                // Sản phẩm đã có trong giỏ hàng, cập nhật số lượng
                updateSt.setInt(1, amount);
                updateSt.setInt(2, userId);
                updateSt.setInt(3, productId);
                updateSt.executeUpdate();
            } else {
                // Sản phẩm chưa có trong giỏ hàng, thêm mới
                insertSt.setInt(1, userId);
                insertSt.setInt(2, productId);
                insertSt.setInt(3, amount);
                insertSt.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void removeFromCart(int userId, int productId) {
        String deleteQuery = "DELETE FROM Cart WHERE AccountID = ? AND ProductID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement deleteSt = conn.prepareStatement(deleteQuery)) {
            deleteSt.setInt(1, userId);
            deleteSt.setInt(2, productId);
            deleteSt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateQuantity(int userId, int productId, int amountChange) {
        String updateQuery = "UPDATE Cart SET Amount = Amount + ? WHERE AccountID = ? AND ProductID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement updateSt = conn.prepareStatement(updateQuery)) {
            updateSt.setInt(1, amountChange);
            updateSt.setInt(2, userId);
            updateSt.setInt(3, productId);
            updateSt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Tạo đơn hàng mới và trả về ID của đơn hàng đã tạo
    public int createOrder(Order order) {
        String query = "INSERT INTO [dbo].[Order] (cid, date, totalmoney) VALUES (?, GETDATE(), ?)";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement st = conn.prepareStatement(query, new String[]{"id"})) {
            st.setInt(1, order.getCusid());
            st.setDouble(2, order.getTotalmoney());

            st.executeUpdate();

            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Trả về ID của đơn hàng mới tạo
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // Trả về -1 nếu có lỗi
    }

    // Thêm thông tin chi tiết đơn hàng (OrderLine)
    public void createOrderDetail(OrderDetail orderDetail) {
        String query = "INSERT INTO OrderLine (oid, pid, quantity, price) VALUES (?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement st = conn.prepareStatement(query)) {
            st.setInt(1, orderDetail.getOid());
            st.setInt(2, orderDetail.getPid());
            st.setInt(3, orderDetail.getQuantity());
            st.setDouble(4, orderDetail.getPrice());

            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
// Xóa giỏ hàng của người dùng sau khi đã thanh toán
    public void clearCart(int userId) {
        String query = "DELETE FROM Cart WHERE AccountID = ?";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement st = conn.prepareStatement(query)) {
            st.setInt(1, userId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
/*
// lấy thông tin chi tiết đơn hàng (OrderLine)
    public OrderDetail getOrderDetailById(int orderDetailId) {
    OrderDetail orderDetail = null;
    String query = "SELECT * FROM OrderLine WHERE oid = ?";
    
    try (Connection conn = new DBContext().getConnection(); 
         PreparedStatement st = conn.prepareStatement(query)) {
        st.setInt(1, orderDetailId);
        try (ResultSet rs = st.executeQuery()) {
            if (rs.next()) {
                orderDetail = new OrderDetail();
                orderDetail.setId(rs.getInt("id"));
                orderDetail.setOid(rs.getInt("oid"));
                orderDetail.setPid(rs.getInt("pid"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setPrice(rs.getDouble("price"));
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return orderDetail;
}
*/

    /*
    public List<Product> getTop3() {
        List<Product> list = new ArrayList<>();
        String query = "select top 3 * from product";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getNext3Product(int amount) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "  FROM product\n"
                + " ORDER BY id\n"
                + "OFFSET ? ROWS\n"
                + " FETCH NEXT 3 ROWS ONLY";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    

    


     
    public static void main(String[] args) {
        // Tạo một đối tượng DAO để sử dụng các phương thức từ DAO
        DAO dao = new DAO();

        // Giả sử bạn có một orderId cụ thể, thay thế orderId bằng giá trị thực
        int orderId = 7;

        // Gọi phương thức getProductsInOrder
        List<Product> productList = dao.getOrderDetailById(orderId);

        // Hiển thị thông tin sản phẩm trong đơn hàng
        System.out.println("Products in Order with ID " + orderId + ":");
        for (Product product : productList) {
            System.out.println("ID: " + product.getId());
            System.out.println("Name: " + product.getName());
            System.out.println("Price: " + product.getPrice());
            System.out.println("-----------------------------");
        }
    }
    
        DAO dao = new DAO();
        List<Product> list = dao.getAllProduct();
        for (Product o : list) {
            System.out.println(o);
        }
        List<Category> listC = dao.getAllCategory();

        for (Category o : listC) {
            System.out.println(o);
        }
     */
 /*
        int userId = 1;
        DAO dao = new DAO();
        Cart userCart = dao.getCartByUserId(userId);

        System.out.println("Cart Information:");
        System.out.println("User ID: " + userId);
        System.out.println("Items in Cart:");

        for (Item item : userCart.getItems()) {
            System.out.println("Product ID: " + item.getProduct().getId());
            System.out.println("Product Name: " + item.getProduct().getName());
            System.out.println("Quantity: " + item.getQuantity());
            System.out.println("Price: " + item.getProduct().getPrice());

            System.out.println("--------------");
        }
        /*
        int userId = 7;
        int productId =2 ;
        int amount = 11;    

        DAO dao = new DAO();
        dao.addToCart(userId, productId, amount);

        // Hiển thị thông tin giỏ hàng sau khi thêm sản phẩm
        Cart userCart = dao.getCartByUserId(userId);
        System.out.println("User Cart for User ID " + userId + ":");
        for (Item item : userCart.getItems()) {
            System.out.println(item.getProduct().getName() + " - Quantity: " + item.getQuantity());
        }
         
        DAO dao = new DAO();

        // Test removeFromCart
        System.out.println("Removing product from cart...");
        int userId = 1; // Replace with the actual user ID
        int productIdToRemove = 5; // Replace with the actual product ID to remove
        dao.removeFromCart(userId, productIdToRemove);
        System.out.println("Product removed from cart.");

        // Test updateQuantity
        System.out.println("Updating product quantity in cart...");
        int productIdToUpdate = 20; // Replace with the actual product ID to update
        int amountChange = 1; // Replace with the actual amount change
        dao.updateQuantity(userId, productIdToUpdate, amountChange);
        System.out.println("Product quantity updated in cart.");
    }
     */
}
