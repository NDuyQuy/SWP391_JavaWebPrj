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
import model.ShippingUnit;

/**
 *
 * @author LENOVO
 */
public class ShippingUnitDao {

    private static final String GET_SHIPPING_UNITS_BY_SUPPORT_METHOD = "SELECT * FROM shippingunits WHERE support_shippingmethod = ?";
    private static final String GET_ALL_SHIPPING_UNITS = "SELECT * FROM shippingunits";
    private static final String GET_SHIPPING_UNIT_BY_ID = "SELECT * FROM shippingunits WHERE id = ?";
    private static final String ADD_SHIPPING_UNIT = "INSERT INTO shippingunits (name, cost, support_shippingmethod) VALUES (?, ?, ?)";
    private static final String UPDATE_SHIPPING_UNIT = "UPDATE shippingunits SET name = ?, cost = ?, support_shippingmethod = ? WHERE id = ?";
    private static final String DELETE_SHIPPING_UNIT = "DELETE FROM shippingunits WHERE id = ?";

    public List<ShippingUnit> getShippingUnitsBySupportMethod(String supportMethod) {
        List<ShippingUnit> shippingUnits = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(GET_SHIPPING_UNITS_BY_SUPPORT_METHOD)) {
            ps.setString(1, supportMethod);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ShippingUnit shippingUnit = new ShippingUnit();
                    shippingUnit.setId(rs.getInt("id"));
                    shippingUnit.setName(rs.getString("name"));
                    shippingUnit.setCost(rs.getDouble("cost"));
                    shippingUnit.setSupportShippingMethod(rs.getString("support_shippingmethod"));
                    shippingUnits.add(shippingUnit);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return shippingUnits;
    }

    public List<ShippingUnit> getAllShippingUnits() {
        List<ShippingUnit> shippingUnits = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(GET_ALL_SHIPPING_UNITS);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ShippingUnit shippingUnit = new ShippingUnit();
                shippingUnit.setId(rs.getInt("id"));
                shippingUnit.setName(rs.getString("name"));
                shippingUnit.setCost(rs.getDouble("cost"));
                shippingUnit.setSupportShippingMethod(rs.getString("support_shippingmethod"));
                shippingUnits.add(shippingUnit);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return shippingUnits;
    }

    public ShippingUnit getShippingUnitById(int id) {
        ShippingUnit shippingUnit = null;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(GET_SHIPPING_UNIT_BY_ID)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    shippingUnit = new ShippingUnit();
                    shippingUnit.setId(rs.getInt("id"));
                    shippingUnit.setName(rs.getString("name"));
                    shippingUnit.setCost(rs.getDouble("cost"));
                    shippingUnit.setSupportShippingMethod(rs.getString("support_shippingmethod"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return shippingUnit;
    }

    public boolean addShippingUnit(ShippingUnit shippingUnit) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(ADD_SHIPPING_UNIT)) {
            ps.setString(1, shippingUnit.getName());
            ps.setDouble(2, shippingUnit.getCost());
            ps.setString(3, shippingUnit.getSupportShippingMethod());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateShippingUnit(ShippingUnit shippingUnit) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(UPDATE_SHIPPING_UNIT)) {
            ps.setString(1, shippingUnit.getName());
            ps.setDouble(2, shippingUnit.getCost());
            ps.setString(3, shippingUnit.getSupportShippingMethod());
            ps.setInt(4, shippingUnit.getId());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteShippingUnit(int id) {
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(DELETE_SHIPPING_UNIT)) {
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
   
    public static void main(String[] args) {
        // Tạo một đối tượng ShippingUnitDaoImpl
        ShippingUnitDao shippingUnitDao = new ShippingUnitDao();

        // Gọi phương thức getShippingUnitsBySupportMethod để lấy danh sách các đơn vị vận chuyển hỗ trợ phương thức "express"
        String supportMethod = "1";
        List<ShippingUnit> shippingUnits = shippingUnitDao.getShippingUnitsBySupportMethod(supportMethod);

        // In ra danh sách các đơn vị vận chuyển
        System.out.println("Các đơn vị vận chuyển hỗ trợ phương thức '" + supportMethod + "':");
        for (ShippingUnit shippingUnit : shippingUnits) {
            System.out.println("ID: " + shippingUnit.getId());
            System.out.println("Tên: " + shippingUnit.getName());
            System.out.println("Chi phí: " + shippingUnit.getCost());
            System.out.println("Phương thức vận chuyển được hỗ trợ: " + shippingUnit.getSupportShippingMethod());
            System.out.println("------------------------");
        }
    }
}


