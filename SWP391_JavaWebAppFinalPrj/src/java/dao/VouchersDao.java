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
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import model.Vouchers;
/**
 *
 * @author ASUS
 */
public class VouchersDao {
    private static final String GET_SYSTEM_VOUCHERS_AND_SHOPVOUCHER_BY_SHOPNAME = "SELECT * FROM vouchers "
            + "WHERE shop_id IN (SELECT shop_id FROM shops WHERE shop_name = ?) "
            + "OR (type = 0) AND [use_count] > 0";
    
    private static final String GET_SYSTEM_VOUCHER = "SELECT * FROM vouchers WHERE type = ?";
    
    
    private static Vouchers extractVoucher(ResultSet rs) throws SQLException{
        int voucherId = rs.getInt("voucher_id");
        String code = rs.getString("code");
        int discountAmount = rs.getInt("discount_amount");
        Date start = rs.getDate("start_date");
        Date end = rs.getDate("expire_date");
        int type = rs.getInt("type");
        int minRequire = rs.getInt("min_require");
        String description = rs.getString("description");
        int useCount = rs.getInt("use_count");
        int shop_id = rs.getInt("shop_id") ;
        int product_id = rs.getInt("product_id") ;
        int use_count = rs.getInt("use_count");
        
        return new Vouchers(voucherId, code, discountAmount, start, end, type, minRequire, description, shop_id, product_id, use_count);
    }
    public static ArrayList<Vouchers> getShopVouchers(int shop_id){
        return SellersDao.getShopVouchers(shop_id);
    }
    public static Vouchers getVoucherByID(int id){
        return SellersDao.getVoucherByID(id);
    }
    
    public static ArrayList<Vouchers> getSystemVouchers() throws ClassNotFoundException {
        ArrayList<Vouchers> vouchers = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement st = con.prepareStatement(GET_SYSTEM_VOUCHER)) {
                    st.setInt(1, 0);
                    ResultSet rs = st.executeQuery();
                    while (rs.next()) {
                        Vouchers voucher = extractVoucher(rs);
                        vouchers.add(voucher);
                    }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vouchers;
    }
    
    public static List<Vouchers> getVouchersByCondition(String shopName) {
        List<Vouchers> vouchers = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(GET_SYSTEM_VOUCHERS_AND_SHOPVOUCHER_BY_SHOPNAME)) {
            ps.setString(1, shopName);
           // ps.setInt(2, productId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Vouchers voucher = extractVoucher(rs);
                    vouchers.add(voucher);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vouchers;
    }
    public static void main(String[] args) {
        getVouchersByCondition("A Shop").forEach(System.out::println);
    }
}
