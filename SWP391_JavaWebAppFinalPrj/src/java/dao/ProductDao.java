/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import model.Products;

/**
 *
 * @author hien
 */
public class ProductDao {
    private static final String GETALLPRODUCTS = "Select [product_id],[shop_id],[scate_id],[description],[created_date],[name],[price],[img],[quantity] from [products]";
    private static final String GETHIGHESTPRICE = "Select top(1) [product_id],[price] from [products] order by price desc";
    private static final String GETPRODUCTBYPRICE = "Select [product_id],[shop_id],[scate_id],[description],[created_date],[name],[price],[img],[quantity] from [products] where [price] >= ? and [price] <= ?";
    private static final String GETPRODUCTBYMAINCATEID = "SELECT [product_id],p.[shop_id],[scate_id],p.[description],[created_date],p.[name],[price],[img],[quantity] "
            + "FROM [products] p inner join [shopcategory] sc ON sc.id = p.scate_id WHERE sc.[maincate_id] = ?";
    private static final String GETPRODUCTBYID = "Select [shop_id],[scate_id],[description],[created_date],[name],[price],[img],[quantity] from [products] where [product_id]=?";
    private static final String GETPRODUCTSBYSHOP = "Select [product_id],[shop_id],[scate_id],[description],[created_date],[name],[price],[img],[quantity] from [products] where [shop_id] = ?";
    private static final String GETPRODUCTSBYSHOPCATEID = "Select [product_id],[shop_id],[description],[created_date],[name],[price],[img],[quantity] from [products] where [scate_id] = ?";
    private static final String GETNEWESTPRODUCTS = "Select top(8)[product_id],[shop_id],[scate_id],[description],[created_date],[name],[price],[img],[quantity] from [products] order by [created_date] desc";
    private static final String GETTOPSELLERS = "Select [productID], COUNT([productID]) as counting from [orderdetail] group by [productID] order by counting desc";
    private static final String GETTOPSELLERSBYMAINCATEID = "SELECT tb1.productID, tb1.counting\n"
            + "FROM (SELECT [productID],COUNT([productID]) as counting\n"
            + "FROM [orderdetail]\n"
            + "group by [productID]) tb1\n"
            + "join\n"
            + "(SELECT [product_id]\n"
            + "FROM [products] p \n"
            + "inner join [shopcategory] sc \n"
            + "ON sc.id = p.scate_id \n"
            + "WHERE sc.[maincate_id] = ?) tb2\n"
            + "on tb1.productID = tb2.product_id\n"
            + "order by tb1.counting desc";
    
    public static ArrayList<Products> getAllProducts(){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = new Products();
        ArrayList<Products> results = new ArrayList<>();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETALLPRODUCTS);
            rs = ptm.executeQuery();
            while(rs.next()){
                int product_id = rs.getInt("product_id");
                int shop_id = rs.getInt("shop_id");
                int shopcategory_id = rs.getInt("scate_id");
                String description = rs.getString("description");
                //CREATED DATE IN SQL DB IS DATETIME
                Date created_date = new Date(rs.getTimestamp("created_date").getTime());
                String product_name = rs.getString("name");
                int price = rs.getInt("price");
                String product_img = rs.getString("img");
                int quantity = rs.getInt("quantity");
                p = new Products(product_id, shop_id, shopcategory_id, description, created_date, product_name, price, product_img, quantity);
                p.setShopCategory(CategoryDao.getShopCategoryById(shopcategory_id));
                p.setShop(SellersDao.getShopById(shop_id)); 
                results.add(p);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return results;
    }

    public static ArrayList<Products> getNewestProducts() {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = new Products();
        ArrayList<Products> results = new ArrayList<>();
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETNEWESTPRODUCTS);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                int shop_id = rs.getInt("shop_id");
                int shopcategory_id = rs.getInt("scate_id");
                String description = rs.getString("description");
                //CREATED DATE IN SQL DB IS DATETIME
                Date created_date = new Date(rs.getTimestamp("created_date").getTime());
                String product_name = rs.getString("name");
                int price = rs.getInt("price");
                String product_img = rs.getString("img");
                int quantity = rs.getInt("quantity");
                p = new Products(product_id, shop_id, shopcategory_id, description, created_date, product_name, price, product_img, quantity);
                results.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return results;
    }
    
    public static Products getHighestPrice(){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = new Products();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETHIGHESTPRICE);
            rs = ptm.executeQuery();
            if(rs.next()){
                p.setProduct_id(rs.getInt("product_id"));
                p.setMoney(rs.getInt("price"));
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return p;
    }
    
    public static ArrayList<Products> getProductsByPrice(int min, int max){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Products> result = new ArrayList<>();
        Products p = null;
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETPRODUCTBYPRICE);
            ptm.setInt(1, min);
            ptm.setInt(2, max);
            rs = ptm.executeQuery();
            while(rs.next()){
                int product_id = rs.getInt("product_id");
                int shop_id = rs.getInt("shop_id");
                int shopcategory_id = rs.getInt("scate_id");
                String description = rs.getString("description");
                //CREATED DATE IN SQL DB IS DATETIME
                Date created_date = new Date(rs.getTimestamp("created_date").getTime());
                String product_name = rs.getString("name");
                int price = rs.getInt("price");
                String product_img = rs.getString("img");
                int quantity = rs.getInt("quantity");
                p = new Products(product_id, shop_id, shopcategory_id, description, created_date, product_name, price, product_img, quantity);
                p.setShopCategory(CategoryDao.getShopCategoryById(shopcategory_id));
                p.setShop(SellersDao.getShopById(shop_id)); 
                result.add(p);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return result;
    }
    
    public static ArrayList<Products> getProductsByMainCateId(int id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = null;
        ArrayList<Products> product_by_mcate = new ArrayList<>();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETPRODUCTBYMAINCATEID);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            while(rs.next()){
                int product_id = rs.getInt("product_id");
                int shop_id = rs.getInt("shop_id");
                int shopcategory_id = rs.getInt("scate_id");
                String description = rs.getString("description");
                //CREATED DATE IN SQL DB IS DATETIME
                Date created_date = new Date(rs.getTimestamp("created_date").getTime());
                String product_name = rs.getString("name");
                int price = rs.getInt("price");
                String product_img = rs.getString("img");
                int quantity = rs.getInt("quantity");
                p = new Products(product_id, shop_id, shopcategory_id, description, created_date, product_name, price, product_img, quantity);
                p.setShopCategory(CategoryDao.getShopCategoryById(shopcategory_id));
                p.setShop(SellersDao.getShopById(shop_id)); 
                product_by_mcate.add(p);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return product_by_mcate;
    }

    public static ArrayList<Products> getNewestProductsByMainCateId(int id) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = null;
        ArrayList<Products> product_by_mcate = new ArrayList<>();
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETPRODUCTBYMAINCATEID + " order by [created_date] desc");
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                int shop_id = rs.getInt("shop_id");
                int shopcategory_id = rs.getInt("scate_id");
                String description = rs.getString("description");
                //CREATED DATE IN SQL DB IS DATETIME
                Date created_date = new Date(rs.getTimestamp("created_date").getTime());
                String product_name = rs.getString("name");
                int price = rs.getInt("price");
                String product_img = rs.getString("img");
                int quantity = rs.getInt("quantity");
                p = new Products(product_id, shop_id, shopcategory_id, description, created_date, product_name, price, product_img, quantity);
                product_by_mcate.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return product_by_mcate;
    }
    
    public static ArrayList<Products> getProductsByShopCateId(int scate_id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = null;
        ArrayList<Products> product_by_scate = new ArrayList<>();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETPRODUCTSBYSHOPCATEID);
            ptm.setInt(1, scate_id);
            rs = ptm.executeQuery();
            while(rs.next()){
                int product_id = rs.getInt("product_id");
                int shop_id = rs.getInt("shop_id");
                int shopcategory_id = scate_id;
                String description = rs.getString("description");
                //CREATED DATE IN SQL DB IS DATETIME
                Date created_date = new Date(rs.getTimestamp("created_date").getTime());
                String product_name = rs.getString("name");
                int price = rs.getInt("price");
                String product_img = rs.getString("img");
                int quantity = rs.getInt("quantity");
                p = new Products(product_id, shop_id, shopcategory_id, description, created_date, product_name, price, product_img, quantity);
                p.setShopCategory(CategoryDao.getShopCategoryById(shopcategory_id));
                p.setShop(SellersDao.getShopById(shop_id)); 
                product_by_scate.add(p);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return product_by_scate;
    }
    
    public static Products getProductById(int id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = new Products();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETPRODUCTBYID);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            while(rs.next()){
                int product_id = id;
                int shop_id = rs.getInt("shop_id");
                int shopcategory_id = rs.getInt("scate_id");
                String description = rs.getString("description");
                //CREATED DATE IN SQL DB IS DATETIME
                Date created_date = new Date(rs.getTimestamp("created_date").getTime());
                String product_name = rs.getString("name");
                int price = rs.getInt("price");
                String product_img = rs.getString("img");
                int quantity = rs.getInt("quantity");
                p = new Products(product_id, shop_id, shopcategory_id, description, created_date, product_name, price, product_img, quantity);
                p.setShopCategory(CategoryDao.getShopCategoryById(shopcategory_id));
                p.setShop(SellersDao.getShopById(shop_id)); 
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return p;
    }
    
    public static ArrayList<Products> getProductsByShop(int id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = null;
        ArrayList<Products> product_by_shop = new ArrayList<>();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETPRODUCTSBYSHOP);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            while(rs.next()){
                int product_id = rs.getInt("product_id");
                int shop_id = rs.getInt("shop_id");
                int shopcategory_id = rs.getInt("scate_id");
                String description = rs.getString("description");
                //CREATED DATE IN SQL DB IS DATETIME
                Date created_date = new Date(rs.getTimestamp("created_date").getTime());
                String product_name = rs.getString("name");
                int price = rs.getInt("price");
                String product_img = rs.getString("img");
                int quantity = rs.getInt("quantity");
                p = new Products(product_id, shop_id, shopcategory_id, description, created_date, product_name, price, product_img, quantity);
                p.setShopCategory(CategoryDao.getShopCategoryById(shopcategory_id));
                p.setShop(SellersDao.getShopById(shop_id)); 
                product_by_shop.add(p);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return product_by_shop;
    }

    public static ArrayList<Products> getTopSellers() {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = null;
        ArrayList<Products> top_sellers = new ArrayList<>();
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETTOPSELLERS);
            rs = ptm.executeQuery();
            while (rs.next()) {
                p = new Products();
                p = ProductDao.getProductById(rs.getInt("productID"));
                top_sellers.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return top_sellers;
    }

    public static ArrayList<Products> getTopSellersByMainCate(int mcate_id) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = null;
        ArrayList<Products> top_sellers_by_mcate = new ArrayList<>();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETTOPSELLERSBYMAINCATEID);
            ptm.setInt(1, mcate_id);
            rs = ptm.executeQuery();
            while(rs.next()){
                p = new Products();
                p = ProductDao.getProductById(rs.getInt("productID"));
                top_sellers_by_mcate.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return top_sellers_by_mcate;
    }
    
    public static void main(String[] args) {
        ArrayList<Products> pr = getProductsByMainCateId(1);
        pr.forEach(pro->System.out.println(pro.getShopCategory()));
        
    }
}
