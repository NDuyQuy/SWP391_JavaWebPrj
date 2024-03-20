/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
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
import model.Vouchers;

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
    private static final String GET_SYSTEM_VOUCHER = "SELECT * FROM vouchers WHERE type = ?";
    private static final String GET_VOUCHERS_BY_SHOP_NAME = "SELECT * FROM vouchers WHERE shop_id IN (SELECT shop_id FROM shops WHERE shop_name = ?)";
    private static final String GET_VOUCHERS_BY_CONDITION = "SELECT * FROM vouchers "
            + "WHERE shop_id IN (SELECT shop_id FROM shops WHERE shop_name = ?) "
            + "OR (type = 0)";

    
    
    
    public static List<Vouchers> getVouchersByCondition(String shopName) {
        List<Vouchers> vouchers = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(GET_VOUCHERS_BY_CONDITION)) {

            ps.setString(1, shopName);
           // ps.setInt(2, productId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Vouchers voucher = extractVoucherFromResultSet(rs);
                    vouchers.add(voucher);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vouchers;
    }
    

    public static List<Vouchers> getVouchersByShopName(String shopName) {
        List<Vouchers> vouchers = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement(GET_VOUCHERS_BY_SHOP_NAME)) {
            st.setString(1, shopName);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Vouchers voucher = extractVoucherFromResultSet(rs);
                    vouchers.add(voucher);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vouchers;
    }

    public static void addVoucher(Vouchers voucher) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement(ADD_VOUCHER)) {
            st.setString(1, voucher.getCode());
            st.setInt(2, voucher.getDiscount_amount());
            st.setDate(3, voucher.getStart_date());
            st.setDate(4, voucher.getExpire_date());
            st.setInt(5, voucher.getType());
            st.setInt(6, voucher.getMin_require());
            st.setString(7, voucher.getDescription());
            st.setInt(8, voucher.getShop_id());
            st.setInt(9, voucher.getUse_count());

            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void updateVoucher(Vouchers voucher) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement(UPDATE_VOUCHER)) {
            st.setString(1, voucher.getCode());
            st.setInt(2, voucher.getDiscount_amount());
            st.setDate(3, voucher.getStart_date());
            st.setDate(4, voucher.getExpire_date());
            st.setInt(5, voucher.getType());
            st.setInt(6, voucher.getMin_require());
            st.setString(7, voucher.getDescription());
            st.setInt(8, voucher.getShop_id());
            st.setInt(9, voucher.getUse_count());
            st.setInt(10, voucher.getVoucher_id());

            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteVoucher(int voucherId) throws ClassNotFoundException {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement(DELETE_VOUCHER)) {
            st.setInt(1, voucherId);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Vouchers> getAllVouchers() throws ClassNotFoundException {
        List<Vouchers> vouchers = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement(GET_ALL_VOUCHERS);
                ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Vouchers voucher = extractVoucherFromResultSet(rs);
                vouchers.add(voucher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vouchers;
    }

    public static ArrayList<Vouchers> getSystemVouchers() throws ClassNotFoundException {
        ArrayList<Vouchers> vouchers = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement(GET_SYSTEM_VOUCHER)) {
            st.setInt(1, 0);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Vouchers voucher = extractVoucherFromResultSet(rs);
                vouchers.add(voucher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vouchers;
    }

    public static Vouchers getVoucherById(int voucherId) {
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

    private static Vouchers extractVoucherFromResultSet(ResultSet rs) throws SQLException {
        int voucherId = rs.getInt("voucher_id");
        String code = rs.getString("code");
        int discountAmount = rs.getInt("discount_amount");
        Date start = rs.getDate("start_date");
        Date end = rs.getDate("expire_date");
        int type = rs.getInt("type");
        int minRequire = rs.getInt("min_require");
        String description = rs.getString("description");
        int useCount = rs.getInt("use_count");
        int shopId = rs.getInt("shop_id");
        return new Vouchers(voucherId, code, discountAmount, start, end, type, minRequire, description, shopId, useCount);
    }

    public static List<Vouchers> getVouchersByShopId(int shopId) {
        List<Vouchers> vouchers = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement("SELECT * FROM vouchers WHERE shop_id = ?")) {
            st.setInt(1, shopId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Vouchers voucher = extractVoucherFromResultSet(rs);
                    vouchers.add(voucher);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vouchers;
    }

    public static List<Vouchers> getVouchersByType(int voucherType) {
        List<Vouchers> vouchers = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement("SELECT * FROM vouchers WHERE type = ?")) {
            st.setInt(1, voucherType);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Vouchers voucher = extractVoucherFromResultSet(rs);
                    vouchers.add(voucher);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vouchers;
    }

    public static void main(String[] args) {
        String shopName = "A Shop";
        
        List<Vouchers> vouchers = VoucherDao.getVouchersByCondition(shopName);

        // In ra danh sách các voucher
        System.out.println("Vouchers based on condition:");
        for (Vouchers voucher : vouchers) {
            System.out.println("Voucher ID: " + voucher.getVoucher_id());
            System.out.println("Code: " + voucher.getCode());
            System.out.println("Discount Amount: " + voucher.getDiscount_amount());
            System.out.println("Start Date: " + voucher.getStart_date());
            System.out.println("Expire Date: " + voucher.getExpire_date());
            System.out.println("Type: " + voucher.getType());
            System.out.println("Minimum Requirement: " + voucher.getMin_require());
            System.out.println("Description: " + voucher.getDescription());
            System.out.println("Shop ID: " + voucher.getShop_id());

            System.out.println("-------------------------");
        }
    }
}
