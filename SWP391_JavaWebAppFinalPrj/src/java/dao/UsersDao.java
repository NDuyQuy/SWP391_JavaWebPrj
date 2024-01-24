/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.google.gson.JsonObject;
import controller.Authenciation.GoogleLogin.GoogleSupport;
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
    private static final String GETUSERSINFOBYEMAIL = "SELECT [fullname],[role],[address],[phone],[email] FROM [users] WHERE [email] = ?";
    private static final String CHANGEPASSWORD = "UPDATE [users] SET password = ? WHERE username = ?";

    public static boolean isGoogleUser(String email) {
        boolean exists = false;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try (Connection con = SQLConnection.getConnection()) {
            String query = "SELECT COUNT(*) AS count FROM users WHERE email = ?";
            ptm = con.prepareStatement(query);
            ptm.setString(1, email);

            rs = ptm.executeQuery();

            if (rs.next()) {
                int count = rs.getInt("count");
                exists = (count > 0);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return exists;
    }

    public static void insertGoogleUser(String email, String fullname) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            
            String INSERT_GOOGLE_USER_SQL = "INSERT INTO users (username, password, email, phone, fullname, address, role, shop_description, shop_reported_count, shop_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ptm = con.prepareStatement(INSERT_GOOGLE_USER_SQL);

            
            ptm.setString(1, email); 
            ptm.setString(2, "");
            ptm.setString(3, email);
            ptm.setString(4, ""); 
            ptm.setString(5, fullname); 
            ptm.setString(6, ""); 
            ptm.setInt(7, 1); // role
            ptm.setString(8, ""); // shop_description
            ptm.setInt(9, 0); // shop_reported_count
            ptm.setString(10, ""); // shop_name 

            int affectedRows = ptm.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Inserting user failed, no rows affected.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

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

    public static void register(String username, String password, String email) {
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

    public static void updateProfile(String fullname, String phone, String address, String username) {
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

    public static void resetPassword(String username) {
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

    public static User getUserInfoByUsername(String username) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        User user = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETUSERSINFO);
            ptm.setString(1, username);
            rs = ptm.executeQuery();
            if (rs.next()) {
                //NOTE 
                /*
                FOR SOME FUCKING REASON, THE STRING WE GET WHEN RETURN WHAT EVER IT IS IT ALWAY HAVE 
                A LONG SPACE LINE IN THE END OF STRING, SO I DECIDE TO USE TRIM TO REMOVE IT.
                HOWEVER, IF THE STRING RETURN IS NULL THEN THE TRIM METHOD WILL CAUSE EXCEPTION SO I DO AS BELOW
                 */
                String fullname = rs.getString("fullname") == null ? null : rs.getString("fullname").trim();
                String email = rs.getString("email") == null ? null : rs.getString("email").trim();
                String phone = rs.getString("phone") == null ? null : rs.getString("phone").trim();
                String adress = rs.getString("address") == null ? null : rs.getString("address").trim();
                int role = rs.getInt("role");
                user = new User(fullname, email, phone, adress, role);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static User getUserInfoByEmail(String email) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        User user = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETUSERSINFOBYEMAIL);
            ptm.setString(1, email);
            rs = ptm.executeQuery();
            if (rs.next()) {
                String fullname = rs.getString("fullname") == null ? null : rs.getString("fullname").trim();
                String mail = rs.getString("email") == null ? null : rs.getString("email").trim();
                String phone = rs.getString("phone") == null ? null : rs.getString("phone").trim();
                String adress = rs.getString("address") == null ? null : rs.getString("address").trim();
                int role = rs.getInt("role");
                user = new User(fullname, mail, phone, adress, role);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static void changePassword(String username, String newpass) {
        PreparedStatement ptm = null;
        //change user's password into newpass
        //username is for detection
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(CHANGEPASSWORD);
            ptm.setString(1, newpass);
            ptm.setString(2, username);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        System.out.print(getUserInfoByEmail("tutien29042003@gmail.com"));
    }

}
