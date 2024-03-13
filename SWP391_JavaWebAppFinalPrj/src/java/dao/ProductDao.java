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
import model.Product;

/**
 *
 * @author hien
 */
public class ProductDao {
    private static final String GETALLPRODUCTS = "Select [product_id],[shop_id],[mcate_id],[scate_id],[description],[created_date],[name],[price],[img],[quantity] from [products]";
    private static final String GETHIGHESTPRICE = "Select top(1) [product_id],[price] from [products] order by price desc";
    private static final String GETPRODUCTBYPRICE = "Select [product_id],[shop_id],[mcate_id],[scate_id],[description],[created_date],[name],[price],[img],[quantity] from [products] where [price] >= ? and [price] <= ?";
    private static final String GETPRODUCTBYMAINCATEID = "Select [product_id],[shop_id],[scate_id],[description],[created_date],[name],[price],[img],[quantity] from [products] where [mcate_id] = ?";
    private static final String GETPRODUCTBYID = "Select [shop_id],[mcate_id],[scate_id],[description],[created_date],[name],[price],[img],[quantity] from [products] where [product_id]=?";
    private static final String GETPRODUCTSBYSHOP = "Select [product_id],[mcate_id],[scate_id],[description],[created_date],[name],[price],[img],[quantity] from [products] where [shop_id] = ?";
    private static final String GETPRODUCTSBYSHOPCATEID = "Select [product_id],[shop_id],[mcate_id],[description],[created_date],[name],[price],[img],[quantity] from [products] where [scate_id] = ?";
    
    public static ArrayList<Product> getAllProducts(){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Product p = new Product();
        ArrayList<Product> results = new ArrayList<>();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETALLPRODUCTS);
            rs = ptm.executeQuery();
            while(rs.next()){
                p = new Product();
                p.setProductID(rs.getInt("product_id"));
                p.setShop(SellersDao.getShopById(rs.getInt("shop_id")));
                p.setmCate(CategoryDao.getMainCategoryById(rs.getInt("mcate_id")));
                p.setsCate(CategoryDao.getShopCategoryById(rs.getInt("scate_id")));
                p.setDescription(rs.getString("description").trim());
                p.setCreatedDate(LocalDate.parse(rs.getDate("created_date").toString()));
                p.setProductName(rs.getString("name").trim());
                p.setPrice(rs.getFloat("price"));
                p.setProductImg(rs.getString("img").trim());
                p.setQuantity(rs.getInt("quantity"));
                results.add(p);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return results;
    }
    
    public static Product getHighestPrice(){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Product p = new Product();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETHIGHESTPRICE);
            rs = ptm.executeQuery();
            if(rs.next()){
                p.setProductID(rs.getInt("product_id"));
                p.setPrice(rs.getFloat("price"));
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return p;
    }
    
    public static ArrayList<Product> getProductsByPrice(int min, int max){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Product> result = new ArrayList<>();
        Product p = null;
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETPRODUCTBYPRICE);
            ptm.setInt(1, min);
            ptm.setInt(2, max);
            rs = ptm.executeQuery();
            while(rs.next()){
                p = new Product();
                p.setProductID(rs.getInt("product_id"));
                p.setShop(SellersDao.getShopById(rs.getInt("shop_id")));
                p.setmCate(CategoryDao.getMainCategoryById(rs.getInt("mcate_id")));
                p.setsCate(CategoryDao.getShopCategoryById(rs.getInt("scate_id")));
                p.setDescription(rs.getString("description").trim());
                p.setCreatedDate(LocalDate.parse(rs.getDate("created_date").toString()));
                p.setProductName(rs.getString("name").trim());
                p.setPrice(rs.getInt("price"));
                p.setProductImg(rs.getString("img").trim());
                p.setQuantity(rs.getInt("quantity"));
                result.add(p);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return result;
    }
    
    public static ArrayList<Product> getProductsByMainCateId(int id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Product p = null;
        ArrayList<Product> product_by_mcate = new ArrayList<>();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETPRODUCTBYMAINCATEID);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            while(rs.next()){
                p = new Product();
                p.setProductID(rs.getInt("product_id"));
                p.setShop(SellersDao.getShopById(rs.getInt("shop_id")));
                p.setmCate(CategoryDao.getMainCategoryById(id));
                p.setsCate(CategoryDao.getShopCategoryById(rs.getInt("scate_id")));
                p.setDescription(rs.getString("description").trim());
                p.setCreatedDate(LocalDate.parse(rs.getDate("created_date").toString()));
                p.setProductName(rs.getString("name").trim());
                p.setPrice(rs.getInt("price"));
                p.setProductImg(rs.getString("img").trim());
                p.setQuantity(rs.getInt("quantity"));
                product_by_mcate.add(p);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return product_by_mcate;
    }
    
    public static ArrayList<Product> getProductsByShopCateId(int scate_id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Product p = null;
        ArrayList<Product> product_by_scate = new ArrayList<>();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETPRODUCTSBYSHOPCATEID);
            ptm.setInt(1, scate_id);
            rs = ptm.executeQuery();
            while(rs.next()){
                p = new Product();
                p.setProductID(rs.getInt("product_id"));
                p.setShop(SellersDao.getShopById(rs.getInt("shop_id")));
                p.setmCate(CategoryDao.getMainCategoryById(rs.getInt("mcate_id")));
                p.setsCate(CategoryDao.getShopCategoryById(scate_id));
                p.setDescription(rs.getString("description").trim());
                p.setCreatedDate(LocalDate.parse(rs.getDate("created_date").toString()));
                p.setProductName(rs.getString("name").trim());
                p.setPrice(rs.getInt("price"));
                p.setProductImg(rs.getString("img").trim());
                p.setQuantity(rs.getInt("quantity"));
                product_by_scate.add(p);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return product_by_scate;
    }
    
    public static Product getProductById(int id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Product p = new Product();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETPRODUCTBYID);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            while(rs.next()){
                p.setProductID(id);
                p.setShop(SellersDao.getShopById(rs.getInt("shop_id")));
                p.setmCate(CategoryDao.getMainCategoryById(rs.getInt("mcate_id")));
                p.setsCate(CategoryDao.getShopCategoryById(rs.getInt("scate_id")));
                p.setDescription(rs.getString("description").trim());
                p.setCreatedDate(LocalDate.parse(rs.getDate("created_date").toString()));
                p.setProductName(rs.getString("name").trim());
                p.setPrice(rs.getInt("price"));
                p.setProductImg(rs.getString("img").trim());
                p.setQuantity(rs.getInt("quantity"));
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return p;
    }
    
    public static ArrayList<Product> getProductsByShop(int id){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Product p = null;
        ArrayList<Product> product_by_shop = new ArrayList<>();
        try(Connection con = SQLConnection.getConnection()){
            ptm = con.prepareStatement(GETPRODUCTSBYSHOP);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            while(rs.next()){
                p = new Product();
                p.setProductID(rs.getInt("product_id"));
                p.setShop(SellersDao.getShopById(id));
                p.setmCate(CategoryDao.getMainCategoryById(rs.getInt("mcate_id")));
                p.setsCate(CategoryDao.getShopCategoryById(rs.getInt("scate_id")));
                p.setDescription(rs.getString("description").trim());
                p.setCreatedDate(LocalDate.parse(rs.getDate("created_date").toString()));
                p.setProductName(rs.getString("name").trim());
                p.setPrice(rs.getInt("price"));
                p.setProductImg(rs.getString("img").trim());
                p.setQuantity(rs.getInt("quantity"));
                product_by_shop.add(p);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return product_by_shop;
    }
    
    public static void main(String[] args) {
        ArrayList<Product> pr = getAllProducts();
        ArrayList<Product> p = getProductsByShop(23);
        System.out.println(p.get(0).getProductName());
    }
}
