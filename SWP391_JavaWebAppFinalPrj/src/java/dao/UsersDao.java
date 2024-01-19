/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;
/**
 *
 * @author ASUS
 */
public class UsersDao {
    private static final String CHECKLOGIN = "SELECT [fullname] FROM [users] WHERE [username]=? and [password]=?";
    private static final String REGISTER = "INSERT INTO [users](username,password,email,role,shop_reported_count) values (?,?,?,1,0)";
    private static final String UPDATEUSERSPROFILE = "UPDATE [users] SET fullname = ?, phone = ?, address = ? WHERE username = ?";
    private static final String RESETPASSWORD = "UPDATE [users] SET password = '123456' WHERE username = ?";
    private static final String GETUSERSINFO = "SELECT [fullname],[role],[address],[phone],[email] FROM [users] WHERE [username] = ?";
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
    public static void resetPassword(String username){
        PreparedStatement ptm = null;
        //reset users password into 123
        //username is for detection
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(RESETPASSWORD);
            ptm.setString(1, username);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static User getUserInfo(String username){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        User user = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETUSERSINFO);
            ptm.setString(1, username);
            rs = ptm.executeQuery();
            if (rs.next()) {
                String fullname = rs.getString("fullname").trim();
                String email = rs.getString("email").trim();
                String phone = rs.getString("phone").trim();
                String adress = rs.getString("address").trim();
                int role = rs.getInt("role");
                user = new User(fullname, email, phone, adress, role);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    public static void main(String[] args) {
        System.out.println(getUserInfo("Q"));
    }
}
