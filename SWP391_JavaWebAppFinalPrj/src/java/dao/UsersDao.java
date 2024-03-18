/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Shops;
import model.Users;
/**
 *
 * @author ASUS
 */
public class UsersDao {
    private static final String CHECKLOGIN = "SELECT [fullname] FROM [users] WHERE [username]=? and [password]=?";
    private static final String CHECKLOGINBYEMAIL = "SELECT [fullname] FROM [users] WHERE [email]=? and [password]=?";
    private static final String REGISTER = "INSERT INTO [users](username,password,email) values (?,?,?)";
    private static final String UPDATEUSERSPROFILE = "UPDATE [users] SET fullname = ?, phone = ?, address = ? WHERE username = ?";
    private static final String RESETPASSWORD = "UPDATE [users] SET password = ? WHERE email = ?";
    private static final String GETUSERSINFOBYUSERNAME = "SELECT [id], [fullname],[role],[address],[phone],[email],[img] FROM [users] WHERE [username] = ?";
    private static final String GETUSERSINFOBYEMAIL = "SELECT [id], [username],[fullname],[role],[address],[phone],[email],[img] FROM [users] WHERE [email] = ?";
    private static final String CHANGEPASSWORD = "UPDATE [users] SET password = ? WHERE username = ?";
    private static final String GETUSERBYID = "SELECT [username],[address] FROM [users] WHERE [id]=?";
    private static final String NEWREPORT = "Insert into [report_detail]([shop_id],[reporter_id],[reason]) values (?,?,?)";
    private static final String UPDATE_REPORTED_COUNT = "Update [shops] set [shop_reported_count] = ? where [shop_id] = ?";
    
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
    public static boolean checkLoginByEmail(String email, String password){
        //Login via email and password
        boolean checked = false;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(CHECKLOGINBYEMAIL);
            ptm.setString(1, email);
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
            if(getUserInfoByEmail(email)!=null) throw new Exception("This email have already register!");
            if(getUserInfoByUsername(username)!=null) throw  new Exception("This username have already exist!");
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
    public static void resetPassword(String email, String password){
        PreparedStatement ptm = null;
        //reset users password into 123
        //username is for detection
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(RESETPASSWORD);
            ptm.setString(1, password);
            ptm.setString(2, email);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static Users getUserInfoByUsername(String username){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Users user = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETUSERSINFOBYUSERNAME);
            ptm.setString(1, username);
            rs = ptm.executeQuery();
            if (rs.next()) {
                //NOTE 
                /*
                FOR SOME FUCKING REASON, THE STRING WE GET WHEN RETURN WHAT EVER IT IS IT ALWAY HAVE 
                A LONG SPACE LINE IN THE END OF STRING, SO I DECIDE TO USE TRIM TO REMOVE IT.
                HOWEVER, IF THE STRING RETURN IS NULL THEN THE TRIM METHOD WILL CAUSE EXCEPTION SO I DO AS BELOW
                */
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname")==null?null:rs.getString("fullname").trim();
                String email = rs.getString("email");
                String phone = rs.getString("phone")==null?null:rs.getString("phone").trim();
                String adress = rs.getString("address")==null?null:rs.getString("address").trim();
                int role = rs.getInt("role");
                String img = rs.getString("img");
                user = new Users(id,username,fullname, email, phone, adress, role,img);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    public static Users getUserInfoByEmail(String email){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Users user = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETUSERSINFOBYEMAIL);
            ptm.setString(1, email);
            rs = ptm.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                String fullname = rs.getString("fullname")==null?null:rs.getString("fullname").trim();
                String username = rs.getString("username");
                String phone = rs.getString("phone")==null?null:rs.getString("phone").trim();
                String adress = rs.getString("address")==null?null:rs.getString("address").trim();
                int role = rs.getInt("role");
                String img = rs.getString("img");
                user = new Users(id,username,fullname, email, phone, adress, role,img);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    public static void changePassword(String username, String newpass){
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
    
    public static Users getUserById(int id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Users user = new Users();
        try(Connection con=SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETUSERBYID);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            if(rs.next()){
                user.setId(id);
                user.setUsername(rs.getString("username").trim());
                user.setAddress(rs.getString("address")==null?null:rs.getString("address").trim());
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public static void newReport(int reported, int report, String reason){
        PreparedStatement ptm = null;
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(NEWREPORT);
            ptm.setInt(1, reported);
            ptm.setInt(2, report);
            ptm.setString(3, reason);
            ptm.executeUpdate();
            updateReportedCount(reported);
        } catch(Exception ex){
            ex.printStackTrace();
        }
    }
    
    public static void updateReportedCount(int id){
        PreparedStatement ptm = null;
        Shops sh = SellersDao.getShopById(id);
        int count = sh.getShop_reported_count() + 1;
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(UPDATE_REPORTED_COUNT);
            ptm.setInt(1, count);
            ptm.setInt(2, id);
            ptm.executeUpdate();
        } catch(Exception ex){
            ex.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        //register("a", "1", "A@gmail.com");
        //System.out.println(checkLoginByEmail("A@gmail.com", "1"));
        System.out.println(getUserInfoByUsername("A"));
        newReport(1, 2, "adi");
    }
}
