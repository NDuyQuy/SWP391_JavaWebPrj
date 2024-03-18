/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import model.Ratings;

/**
 *
 * @author hien
 */
public class RatingDao {

    private static final String GETRATINGSBYPRODUCT = "Select r.id,r.orderdetail_id,[time_stamp],[score],[comment] from ratings r\n"
            + "join orderdetail o\n"
            + "on r.orderdetail_id = o.id and o.productID = ?";
    private static final String NEWRATING = "Insert into [ratings]([orderdetail_id],[score],[comment]) values(?,?,?)";

    public static ArrayList<Ratings> getRatingsByProduct(int p_id) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Ratings r = null;
        ArrayList<Ratings> rating_by_product = new ArrayList<>();
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETRATINGSBYPRODUCT);
            ptm.setInt(1, p_id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                r = new Ratings();
                r.setId(rs.getInt(1));
                r.setOrderdetail_id(rs.getInt(2));
                r.setTime_stamp(rs.getDate(3));
                r.setScore(rs.getInt(4));
                r.setComment(rs.getString(5));
                rating_by_product.add(r);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return rating_by_product;
    }
    
    public static void newRating(int ordde_id, int score, String comment){
        PreparedStatement ptm = null;
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(NEWRATING);
            ptm.setInt(1, ordde_id);
            ptm.setInt(2, score);
            ptm.setString(3, comment);
            ptm.executeUpdate();
        } catch(Exception ex){
            ex.printStackTrace();
        }
    }
}
