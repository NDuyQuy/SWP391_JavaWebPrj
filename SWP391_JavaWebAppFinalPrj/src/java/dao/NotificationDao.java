/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.Notifications;

/**
 *
 * @author DELL
 */
public class NotificationDao {
    private static final String GET_NOTIFICATION = "SELECT * FROM [dbo].[notification] WHERE [userid] = ?";
    
    private static final String GET_UNSEEN_NOTIFICATION = "SELECT * FROM [dbo].[notification] WHERE [userid] = ? AND [status] = 0 AND [content] LIKE ?";
    
    private static final String SEEN_NOTIFICATION = "UPDATE [dbo].[notification] SET [status] = 1 WHERE [userid] = ?";
    
    private static final String CREATE_NOTIFICATION = "INSERT INTO [dbo].[notification] ([content], [time_stamp], [status], [stack], [userid]) VALUES (?, CURRENT_TIMESTAMP, ?, ?, ?)";
    
    private static final String UPDATE_UNSEEN_NOTIFICATION = "UPDATE [dbo].[notification] SET [content] = ?, [time_stamp] = CURRENT_TIMESTAMP, [stack] = ? WHERE [id] = ?";
    
    //Sample of notifications
    //Notification of user
    private static final String PROMOTE_TO_SELLER_SUCCESS = "Yêu cầu trở thành người bán hàng của bạn đã được xét duyệt thành công. Hãy vào xem và cập nhật thêm thông tin và sản phẩm của cửa hàng.";
    
    private static final String PROMOTE_TO_SELLER_DECLINE = "Yêu cầu trở thành người bán hàng của bạn đã bị từ chối. Vui lòng chỉnh sửa lại thông tin ban đầu của cửa hàng trước khi gửi lại yêu cầu.";
    
    private static final String ORDER_STATUS_UPDATE = "Đơn hàng số <b>[order]</b> đã được cập nhật tiến độ giao hàng. Trạng thái: [status]";
    
    private static final String ORDER_SUCCESS = "Đơn hàng số <b>[order]</b> đã hoàn thành vận chuyển. Vui lòng vào chi tiết đơn hàng để xác nhận hoàn thành đơn hàng và đánh giá.";
    
    private static final String ORDER_CANCELLED_BY_USER = "Đơn hàng số <b>[order]</b> đã bị hủy bởi người mua.";
    
    private static final String CUSTOMER_ORDER_CREATED = "Đơn đặt hàng theo yêu cầu số <b>[order_id]</b> đã được tạo. Vui lòng theo dõi tiến độ và liên lạc với shop thường xuyên để đơn yêu cầu hoàn thành thuận lợi.";
    
    private static final String CUSTOMER_ORDER_FINISH = "Đơn đặt hàng theo yêu cầu số <b>[order_id]</b> đã hoàn thành. Vui lòng bổ sung thông tin nhận hàng để tiến thành vận chuyển đơn hàng.";
    
    private static final String CUSTOMER_ORDER_CANCELLED_BY_SHOP = "Đơn đặt hàng theo yêu cầu số <b>[order_id]</b> đã bị hủy bởi shop. Lý do: [reason]";
    
    private static final String CUSTOMER_ORDER_SUCCESS = "Đơn đặt hàng theo yêu cầu <b>[order_id]</b> đã hoàn thành vận chuyển. Vui lòng vào chi tiết đơn hàng để xác nhận hoàn thành đơn hàng và đánh giá.";
    
    private static final String NEW_MESSAGE_FROM_SHOP = "Bạn có [number] tin nhắn mới từ <b>[shopname]</b>.";
    
    private static final String REFUND_SUCCESS = "Yêu cầu trả hàng/hoàn tiền của bạn cho đơn hàng số <b>[order]</b> đã được chấp thuận.";
    
    private static final String REFUND_DECLINE = "Yêu cầu trả hàng/hoàn tiền của bạn cho đơn hàng số <b>[order]</b> đã bị từ chối. Tình trạng đơn hàng vẫn sẽ không thay đổi.";
    //notification of shop
    //have increment
    private static final String PRODUCT_NEW_RATING = "Sản phẩm [product_name] đã nhận được [amount] đánh giá mới. Vào thông tin chi tiết sản phẩm để xem chi tiết các bài đánh giá mới.";
    //have increment
    private static final String SHOP_NEW_ORDER = "Bạn có [amount] đơn hàng mới. Vào thông tin chi tiết đơn hàng để xem chi tiết và chuẩn bị cho đơn hàng.";
    
    private static final String SHOP_ORDER_SUCCESS = "Đơn hàng số [order] đã vận chuyển thành công và đã được người dùng đánh giá phản hồi. Vào thông tin chi tiết đơn hàng để xem chi tiết phản hồi của người dùng.";
    
    private static final String CUSTOMER_ORDER_CANCELLED_BY_USER = "Đơn đặt hàng theo yêu cầu số [order_id] đã bị hủy bởi người đặt [username]. Lý do: [reason]";
    
    private static final String BAN_APPLY = "Chức năng bán hàng của bạn đã bị hạn chế. Lý do: [reason]";
    
    private static final String BAN_REMOVE = "Trạng thái hạn chế chức năng bán hàng của bạn đã được gỡ bỏ. Vui lòng tuân thủ quy định của nền tảng để tránh bị hạn chế tài khoản.";
    
    private static final String NEW_MESSAGE_FROM_USER = "Bạn có [number] tin nhắn mới từ <b>[username]</b>.";
    
    //general method
    
    public static void SendNotification(String content, int userId) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(CREATE_NOTIFICATION);
            ptm.setString(1, content);
            ptm.setInt(2, 0);
            ptm.setInt(3, 1);
            ptm.setInt(4, userId);
            ptm.executeUpdate();
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static Notifications checkStackNotification(String sample, int userId) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Notifications result = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GET_UNSEEN_NOTIFICATION);
            ptm.setInt(1, userId);
            ptm.setString(2, sample);
            rs = ptm.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String content = rs.getNString("content");
                int stack = rs.getInt("stack");
                Notifications n = new Notifications(id, userId, content, 0, stack, null);
                result = n;
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static void updateStackNotification(Notifications n) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(UPDATE_UNSEEN_NOTIFICATION);
            ptm.setString(1, n.getContent());
            ptm.setInt(2, n.getStack() + 1);
            ptm.setInt(3, n.getId());
            ptm.executeUpdate();
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static ArrayList<Notifications> getNotificationList(int userId) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Notifications> result = new ArrayList<Notifications>();
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GET_NOTIFICATION);
            ptm.setInt(1, userId);
            rs = ptm.executeQuery();
            while(rs.next()) {
                int id = rs.getInt("id");
                String content = rs.getNString("content");
                int stack = rs.getInt("stack");
                Timestamp time = rs.getTimestamp("time_stamp");
                int status = rs.getInt("status");
                Notifications n = new Notifications(id, userId, content, status, stack, time);
                result.add(n);
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static void seenNotification(int userId) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(SEEN_NOTIFICATION);
            ptm.setInt(1, userId);
            ptm.executeUpdate();
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //specify method
    
    public static void AcceptSeller(int userId, boolean accept) {
        if (accept) {
            SendNotification(PROMOTE_TO_SELLER_SUCCESS, userId);
        }
        else {
            SendNotification(PROMOTE_TO_SELLER_DECLINE, userId);
        }
    }
    
    public static void orderUpdate(int userId, int orderId, String status) {
        String content = new String();
        String sample = ORDER_STATUS_UPDATE;
        content = sample.replace("[order]", Integer.toString(orderId));
        content = content.replace("[status]", status);
        SendNotification(content, userId);
    }
    
    public static void orderSuccess(int userId, int orderId) {
        String content = new String();
        String sample = ORDER_SUCCESS;
        content = sample.replace("[order]", Integer.toString(orderId));
        SendNotification(content, userId);
    }
    
    public static void orderCancel(int shopId, int orderId) {
        String content = new String();
        String sample = ORDER_CANCELLED_BY_USER;
        content = sample.replace("[order]", Integer.toString(orderId));
        SendNotification(content, shopId);
    }
    
    public static void customerOrderCreate(int userId, int orderId) {
        String content = new String();
        String sample = CUSTOMER_ORDER_CREATED;
        content = sample.replace("[order_id]", Integer.toString(orderId));
        SendNotification(content, userId);
    }
    
    public static void customerOrderFinish(int userId, int orderId) {
        String content = new String();
        String sample = CUSTOMER_ORDER_FINISH;
        content = sample.replace("[order_id]", Integer.toString(orderId));
        SendNotification(content, userId);
    }
    
    public static void customerOrderCancelledByShop(int userId, int orderId, String reason) {
        String content = new String();
        String sample = CUSTOMER_ORDER_CANCELLED_BY_SHOP;
        content = sample.replace("[order_id]", Integer.toString(orderId));
        content = content.replace("[reason]", reason);
        SendNotification(content, userId);
    }
    
    public static void customerOrderCancelledByUser(int shopId, int orderId, String username, String reason) {
        String content = new String();
        String sample = CUSTOMER_ORDER_CANCELLED_BY_USER;
        content = sample.replace("[order_id]", Integer.toString(orderId));
        content = content.replace("[reason]", reason);
        content = content.replace("[username]", username);
        SendNotification(content, shopId);
    }
    
    public static void customerOrderSuccess(int userId, int orderId) {
        String content = new String();
        String sample = CUSTOMER_ORDER_SUCCESS;
        content = sample.replace("[order_id]", Integer.toString(orderId));
        SendNotification(content, userId);
    }
    
    public static void messageFromShop(int userId, String shopname) {
        String content = new String();
        String sample = NEW_MESSAGE_FROM_SHOP;
        String check = sample.replace("[shopname]", "%");
        check = check.replace("[number]", "%");
        Notifications n = checkStackNotification(check, userId);
        if (n != null && n.getStatus() == 0) {
            content = sample.replace("[shopname]", shopname);
            content = content.replace("[number]", Integer.toString(n.getStack() + 1));
            n.setContent(content);
            updateStackNotification(n);
        }
        else {
            content = sample.replace("[shopname]", shopname);
            content = content.replace("[number]", "1");
            SendNotification(content, userId);
        }
    }
    
    public static void messageFromUser(int shopId, String username) {
        String content = new String();
        String sample = NEW_MESSAGE_FROM_USER;
        String check = sample.replace("[username]", "%");
        check = check.replace("[number]", "%");
        Notifications n = checkStackNotification(check, shopId);
        if (n != null && n.getStatus() == 0) {
            content = sample.replace("[username]", username);
            content = content.replace("[number]", Integer.toString(n.getStack() + 1));
            n.setContent(content);
            updateStackNotification(n);
        }
        else {
            content = sample.replace("[username]", username);
            content = content.replace("[number]", "1");
            SendNotification(content, shopId);
        }
    }
    
    public static void refundSuccess(int userId, int orderId) {
        String content = new String();
        String sample = REFUND_SUCCESS;
        content = sample.replace("[order]", Integer.toString(orderId));
        SendNotification(content, userId);
    }
    
    public static void refundDecline(int userId, int orderId) {
        String content = new String();
        String sample = REFUND_DECLINE;
        content = sample.replace("[order]", Integer.toString(orderId));
        SendNotification(content, userId);
    }
    
    public static void productRating(int shopId, String productName) {
        String content = new String();
        String sample = PRODUCT_NEW_RATING;
        String check = sample.replace("[product_name]", "%");
        check = check.replace("[amount]", "%");
        Notifications n = checkStackNotification(check, shopId);
        if (n != null && n.getStatus() == 0) {
            content = sample.replace("[product_name]", productName);
            content = content.replace("[amount]", Integer.toString(n.getStack() + 1));
            n.setContent(content);
            updateStackNotification(n);
        }
        else {
            content = sample.replace("[product_name]", productName);
            content = content.replace("[amount]", "1");
            SendNotification(content, shopId);
        }
    }
    
    public static void shopNewOrder(int shopId) {
        String content = new String();
        String sample = SHOP_NEW_ORDER;
        String check = sample.replace("[amount]", "%");
        Notifications n = checkStackNotification(check, shopId);
        if (n != null && n.getStatus() == 0) {
            content = sample.replace("[amount]", Integer.toString(n.getStack() + 1));
            n.setContent(content);
            updateStackNotification(n);
        }
        else {
            content = sample.replace("[amount]", "1");
            SendNotification(content, shopId);
        }
    }
    
    public static void OrderRating(int shopId, int orderId) {
        String content = new String();
        String sample = SHOP_ORDER_SUCCESS;
        content = sample.replace("[order]", Integer.toString(orderId));
        SendNotification(content, shopId);
    }
    
    public static void BanApply(int shopId, String reason) {
        String content = new String();
        String sample = BAN_APPLY;
        content = sample.replace("[reason]", reason);
        SendNotification(content, shopId);
    }
    
    public static void BanRemove(int shopId) {
        String content = new String();
        String sample = BAN_REMOVE;
        SendNotification(content, shopId);
    }
    
    
}
