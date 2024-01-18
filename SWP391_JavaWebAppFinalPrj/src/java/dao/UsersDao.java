/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ASUS
 */
public class UsersDao {
    private static final String CHECKLOGIN = "SELECT [fullname] FROM [users] WHERE [username]=? and [password]=?";
    private static final String REGISTER = "INSERT INTO [users](username,password,email,role,shop_reported_count) values (?,?,?,1,0)";
    private static final String UPDATEUSERSPROFILE = "UPDATE [users] SET fullname = ?, phone = ?, address = ? WHERE username = ?";
    
    public static boolean checkLogin(String username, String password) {
        //Login via usersname and password
        boolean checked = false;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(CHECKLOGIN);
            ptm.setString(1, username);
            ptm.setString(2, password);
            rs = ptm.executeQuery();
            if (rs.next()) {
                checked = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return checked;
    }
    public static void register(String username, String password,String email){
        // Register new account with usersname, password and email
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(REGISTER);
            ptm.setString(1, username);
            ptm.setString(2, password);
            ptm.setString(3, email);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void updateProfile(String fullname, String phone, String address,String username){
        PreparedStatement ptm = null;
        //edit users profile which include fullname, phone, address
        //username is for detection
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(UPDATEUSERSPROFILE);
            ptm.setString(1, fullname);
            ptm.setString(2, phone);
            ptm.setString(3, address);
            ptm.setString(4, username);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        //System.out.println(UsersDao.checkLogin("Q", "0"));
        //UsersDao.updateProfile("Q", "0123456789", "ABC Street", "Q");
    }
}
