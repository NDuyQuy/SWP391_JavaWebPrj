/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import model.OrderDetail;
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
    private static final String GETRATINGBYORDERDETAIL = "Select id,time_stamp,score,comment from ratings where orderdetail_id = ?";
    
    public static Ratings getRatingByOrderDetail(int orderdetail_id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Ratings rating = null;
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETRATINGBYORDERDETAIL);
            ptm.setInt(1, orderdetail_id);
            rs = ptm.executeQuery();
            if(rs.next()){
                rating = new Ratings();
                rating.setId(rs.getInt(1));
                OrderDetail orderdetail = OrdersDao.getOrderDetailById(orderdetail_id);
                rating.setOrderdetail(orderdetail);
                rating.setTime_stamp(rs.getDate(2));
                rating.setScore(rs.getInt(3));
                rating.setComment(rs.getNString(4));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return rating;
    }

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
                r.setOrderdetail(OrdersDao.getOrderDetailById(rs.getInt(2)));
                r.setTime_stamp(Date.valueOf(rs.getDate(3).toString()));
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
    
    public static void main(String[] args) {
        System.out.println(getRatingByOrderDetail(3).getComment());
    }
}
