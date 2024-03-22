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
import model.RefundsnReturns;


/**
 *
 * @author LENOVO
 */
public class RefundsAndReturnsDao {
    private static final String ADD_REFUND = "INSERT INTO refundsnreturns (orderdetail_id, reason, status, img) VALUES (?, ?, ?, ?)";
    private static final String GET_REFUNDS = "SELECT * FROM refundsnreturns WHERE orderdetail_id = ?";
    // Thêm các truy vấn SQL khác tùy thuộc vào nhu cầu của bạn

    public boolean addRefund(int orderDetailId, String reason, int status, String img) {
        try (Connection con = SQLConnection.getConnection(); PreparedStatement ps = con.prepareStatement(ADD_REFUND)) {
            ps.setInt(1, orderDetailId);
            ps.setString(2, reason);
            ps.setInt(3, status);
            ps.setString(4, img);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<RefundsnReturns> getRefunds(int orderDetailId) {
        List<RefundsnReturns> refunds = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection(); PreparedStatement ps = con.prepareStatement(GET_REFUNDS)) {
            ps.setInt(1, orderDetailId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RefundsnReturns refund = new RefundsnReturns();
                refund.setId(rs.getInt("id"));
                refund.setOrderdetail_id(rs.getInt("orderdetail_id"));
                refund.setReason(rs.getString("reason"));
                refund.setStatus(rs.getInt("status"));
                refund.setImg(rs.getString("img"));
                refunds.add(refund);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return refunds;
    }
    public static void main(String[] args) {
        testAddRefund();
    }

    private static void testAddRefund() {
        RefundsAndReturnsDao dao = new RefundsAndReturnsDao();

        // Thêm một yêu cầu trả hàng/hoàn tiền mới
        int orderDetailId = 1; // ID của đơn hàng chi tiết
        String reason = "Sản phẩm không đúng mô tả";
        int status = 0; // Trạng thái mặc định
        String img = "path/to/image.jpg";

        boolean success = dao.addRefund(orderDetailId, reason, status, img);
        if (success) {
            System.out.println("Yêu cầu trả hàng/hoàn tiền đã được thêm vào cơ sở dữ liệu.");
        } else {
            System.out.println("Không thể thêm yêu cầu trả hàng/hoàn tiền vào cơ sở dữ liệu.");
        }
    }
}
