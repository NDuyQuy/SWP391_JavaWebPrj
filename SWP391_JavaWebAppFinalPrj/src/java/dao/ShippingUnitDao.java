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
import model.ShippingUnits;

/**
 *
 * @author LENOVO
 */
public class ShippingUnitDao {

    private static final String GET_SHIPPING_UNITS_BY_SUPPORT_METHOD = "SELECT * FROM shippingunits WHERE support_shippingmethod = ?";

    public List<ShippingUnits> getShippingUnitsBySupportMethod(String supportMethod) {
        List<ShippingUnits> shippingUnits = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(GET_SHIPPING_UNITS_BY_SUPPORT_METHOD)) {
            ps.setString(1, supportMethod);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ShippingUnits shippingUnit = new ShippingUnits();
                    shippingUnit.setId(rs.getInt("id"));
                    shippingUnit.setName(rs.getString("name"));
                    shippingUnit.setCost(rs.getInt("cost"));
                    shippingUnit.setSupport_shippingmethod(rs.getInt("support_shippingmethod"));
                    shippingUnits.add(shippingUnit);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return shippingUnits;
    }

    public static void main(String[] args) {
        // Tạo một đối tượng ShippingUnitDaoImpl
        ShippingUnitDao shippingUnitDao = new ShippingUnitDao();

        // Gọi phương thức getShippingUnitsBySupportMethod để lấy danh sách các đơn vị vận chuyển hỗ trợ phương thức "express"
        String supportMethod = "1";
        List<ShippingUnits> shippingUnits = shippingUnitDao.getShippingUnitsBySupportMethod(supportMethod);

        // In ra danh sách các đơn vị vận chuyển
        System.out.println("Các đơn vị vận chuyển hỗ trợ phương thức '" + supportMethod + "':");
        for (ShippingUnits shippingUnit : shippingUnits) {
            System.out.println("ID: " + shippingUnit.getId());
            System.out.println("Tên: " + shippingUnit.getName());
            System.out.println("Chi phí: " + shippingUnit.getCost());
            System.out.println("Phương thức vận chuyển được hỗ trợ: " + shippingUnit.getSupport_shippingmethod());
            System.out.println("------------------------");
        }
    }
}
