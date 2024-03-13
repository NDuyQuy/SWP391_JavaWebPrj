/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import model.Shop;

/**
 *
 * @author hien
 */
public class ReportDao {
    private static final String NEWREPORT = "Insert into [reportedusers]([user_id],[reporter_id],[date],[reason],[detail]) values (?,?,?,?,?)";
    private static final String UPDATE_REPORTED_COUNT = "Update [shops] set [shop_reported_count] = ? where [shop_id] = ?";
    
    public static void newReport(int reported, int report, Timestamp date, String reason, String detail){
        PreparedStatement ptm = null;
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(NEWREPORT);
            ptm.setInt(1, reported);
            ptm.setInt(2, report);
            ptm.setTimestamp(3, date);
            ptm.setString(4, reason);
            ptm.setString(5, detail);
            ptm.executeUpdate();
            updateReportedCount(reported);
        } catch(Exception ex){
            ex.printStackTrace();
        }
    }
    
    public static void updateReportedCount(int id){
        PreparedStatement ptm = null;
        Shop sh = SellersDao.getShopById(id);
        int count = sh.getReportedAccount() + 1;
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(UPDATE_REPORTED_COUNT);
            ptm.setInt(1, count);
            ptm.setInt(2, id);
            ptm.executeUpdate();
        } catch(Exception ex){
            ex.printStackTrace();
        }
    }
}
