/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;
/**
 *
 * @author DELL
 */
public class AdminDAO {
    private static final String GETCATEGORYLIST = "SELECT [id], [name] FROM [dbo].[maincategory]";
    private static final String ADDCATEGORYLIST = "INSERT INTO [dbo].[maincategory](name) values (?)";
    
    public static ArrayList<Category> Get_Category_List() {
        ArrayList<Category> result = new ArrayList<Category>();
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETCATEGORYLIST);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String Name = rs.getString("name");
                Category c = new Category(id, Name);
                result.add(c);                
            }
            SQLConnection.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static void Add_Main_Category(String Name) {
        PreparedStatement ptm = null;
        try (Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETCATEGORYLIST);
            ptm.setString(1, Name);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
}
