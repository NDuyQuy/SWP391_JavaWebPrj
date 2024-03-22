/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import model.Products;

/**
 *
 * @author hien
 */
public class OrderDetailDao {

    private static final String GETORDERDETAILSBYORDERID = "Select [id],[productID],[quantity],[cancel_reason] from [orderdetail] where [orderID] = ?";
    private static final String GETORDERDETAILBYID = "Select [orderID],[productID],[quantity],[cancel_reason] from [orderdetail] where [id] = ?";

    public static OrderDetail getOrderDetailById(int id) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        OrderDetail od = new OrderDetail();
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETORDERDETAILBYID);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            if (rs.next()) {
                od.setId(id);
                od.setOrderID(rs.getInt(1));
                od.setProductID(rs.getInt(2));
                od.setQuantity(rs.getInt(3));
                od.setCancel_reason(rs.getString(4));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return od;
    }

    public static ArrayList<OrderDetail> getOrderDetailsByOrderId(int ord_id) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        OrderDetail od = null;
        ArrayList<OrderDetail> order_details = new ArrayList<>();
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETORDERDETAILSBYORDERID);
            ptm.setInt(1, ord_id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                od = new OrderDetail();
                od.setId(rs.getInt(1));
                od.setOrderID(ord_id);
                od.setProductID(rs.getInt(2));
                od.setQuantity(rs.getInt(3));
                od.setCancel_reason(rs.getString(4));
                order_details.add(od);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return order_details;
    }
}
