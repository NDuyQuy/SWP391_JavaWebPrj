/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Voucher;

/**
 *
 * @author LENOVO
 */
public class VoucherDao {

    private static final String ADD_VOUCHER = "INSERT INTO vouchers (code, discount_amount, start_date, expire_date, type, min_require, description, shop_id, use_count) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_VOUCHER = "UPDATE vouchers SET code = ?, discount_amount = ?, start_date = ?, expire_date = ?, type = ?, min_require = ?, description = ?, shop_id = ?, use_count = ? WHERE voucher_id = ?";
    private static final String DELETE_VOUCHER = "DELETE FROM vouchers WHERE voucher_id = ?";
    private static final String GET_ALL_VOUCHERS = "SELECT * FROM vouchers";
    private static final String GET_VOUCHER_BY_ID = "SELECT * FROM vouchers WHERE voucher_id = ?";

    public void addVoucher(Voucher voucher) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement(ADD_VOUCHER)) {
            st.setString(1, voucher.getCode());
            st.setInt(2, voucher.getDiscount());
            st.setTimestamp(3, voucher.getStart());
            st.setTimestamp(4, voucher.getEnd());
            st.setInt(5, voucher.getType());
            st.setInt(6, voucher.getMin());
            st.setString(7, voucher.getDescription());
            st.setInt(8, voucher.getShop_id());
            st.setInt(9, voucher.getCount());

            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateVoucher(Voucher voucher) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement(UPDATE_VOUCHER)) {
            st.setString(1, voucher.getCode());
            st.setInt(2, voucher.getDiscount());
            st.setTimestamp(3, voucher.getStart());
            st.setTimestamp(4, voucher.getEnd());
            st.setInt(5, voucher.getType());
            st.setInt(6, voucher.getMin());
            st.setString(7, voucher.getDescription());
            st.setInt(8, voucher.getShop_id());
            st.setInt(9, voucher.getCount());
            st.setInt(10, voucher.getId());

            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteVoucher(int voucherId) throws ClassNotFoundException {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement(DELETE_VOUCHER)) {
            st.setInt(1, voucherId);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Voucher> getAllVouchers() throws ClassNotFoundException {
        List<Voucher> vouchers = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement(GET_ALL_VOUCHERS);
                ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Voucher voucher = extractVoucherFromResultSet(rs);
                vouchers.add(voucher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vouchers;
    }

    public Voucher getVoucherById(int voucherId) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement(GET_VOUCHER_BY_ID)) {
            st.setInt(1, voucherId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return extractVoucherFromResultSet(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private Voucher extractVoucherFromResultSet(ResultSet rs) throws SQLException {
        int voucherId = rs.getInt("voucher_id");
        String code = rs.getString("code");
        int discountAmount = rs.getInt("discount_amount");
        String startDateTimeString = rs.getString("start_date");
        String expireDateTimeString = rs.getString("expire_date");
        // Define a custom format pattern for parsing
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    // Parse the date-time strings using the formatter
    LocalDateTime startDateTime = LocalDate.parse(startDateTimeString, formatter).atStartOfDay();
    LocalDateTime expireDateTime = LocalDate.parse(expireDateTimeString, formatter).atStartOfDay();
        int type = rs.getInt("type");
        int minRequire = rs.getInt("min_require");
        String description = rs.getString("description");
        int useCount = rs.getInt("use_count");
        int shopId = rs.getInt("shop_id");
        return new Voucher(voucherId, code, discountAmount, startDateTime, expireDateTime, type, minRequire, description, useCount, shopId);
    }

    public List<Voucher> getVouchersByShopId(int shopId) {
        List<Voucher> vouchers = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement("SELECT * FROM vouchers WHERE shop_id = ?")) {
            st.setInt(1, shopId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Voucher voucher = extractVoucherFromResultSet(rs);
                    vouchers.add(voucher);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vouchers;
    }

    public List<Voucher> getVouchersByType(int voucherType) {
        List<Voucher> vouchers = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement("SELECT * FROM vouchers WHERE type = ?")) {
            st.setInt(1, voucherType);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Voucher voucher = extractVoucherFromResultSet(rs);
                    vouchers.add(voucher);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vouchers;
    }

    public static void main(String[] args) throws ClassNotFoundException {
        // Assuming you have an initialized VoucherDao object
        VoucherDao voucherDao = new VoucherDao();

        // Example: Retrieving vouchers of type 1
        int voucherType = 1;
        List<Voucher> vouchersByType = voucherDao.getVouchersByType(voucherType);

        // Displaying the retrieved vouchers
        System.out.println("Vouchers of Type " + voucherType + ":");
        for (Voucher voucher : vouchersByType) {
            System.out.println(voucher.toString());
        }
    }
}
