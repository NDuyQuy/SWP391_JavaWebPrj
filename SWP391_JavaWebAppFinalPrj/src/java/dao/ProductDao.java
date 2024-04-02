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
import java.util.List;
import model.ProductDetail;
import model.Products;
import model.ShopCategory;
import model.Shops;

/**
 *
 * @author hien
 */
public class ProductDao {

    private static final String GETALLPRODUCTS = "Select [product_id],tb1.[shop_id],[scate_id],[description],[created_date],[name] "
            + "from [products] tb1 "
            + "inner join [shops] tb2 on tb1.[shop_id] = tb2.[shop_id] "
            + "where tb2.[ban_status] = 0";
    private static final String GETPRODUCTDETAILBYPRODUCT = "Select [id],[product_id],[price],[quantity],[img],[name] from [product_detail] where [product_id] = ? order by [price] asc";
    private static final String GETHIGHESTPRICE = "Select top(1) tb1.price from product_detail tb1 "
            + "join products tb2 on tb2.product_id = tb1.product_id "
            + "join shops tb3 on tb2.shop_id = tb3.shop_id "
            + "where ban_status = 0 "
            + "order by tb1.price desc";
    private static final String GETPRODUCTBYPRICE = "Select tb1.[product_id] from [products] tb1 "
            + "inner join [product_detail] tb2 on tb1.[product_id] = tb2.[product_id] "
            + "inner join [shops] tb3 on tb3.[shop_id] = tb1.[shop_id] "
            + "where tb2.[price] >= ? and tb2.[price] <= ? and tb3.[ban_status] = 0 "
            + "group by tb1.[product_id]";
    private static final String GETPRODUCTBYMAINCATEID = "SELECT [product_id],[scate_id],p.[description],p.[name] FROM [products] p "
            + "INNER JOIN [shopcategory] sc ON sc.id = p.scate_id "
            + "INNER JOIN [shops] sh ON sh.shop_id = p.shop_id "
            + "WHERE sc.[maincate_id] = ? AND sh.ban_status = 0";
    private static final String GETPRODUCTBYID = "Select [shop_id],[scate_id],[description],[created_date],[name] from [products] where [product_id]=?";
    private static final String GETPRODUCTSBYSHOP = "Select [product_id],[shop_id],[scate_id],[description],[created_date],[name] from [products] where [shop_id] = ?";
    private static final String GETPRODUCTSBYSHOPCATEID = "Select [product_id],[shop_id],[description],[created_date],[name] from [products] where [scate_id] = ?";
    private static final String GETNEWESTPRODUCTS = "Select top(8)[product_id],tb1.[shop_id],[scate_id],[description],[created_date],[name] "
            + "from [products] tb1 "
            + "inner join [shops] tb2 on tb1.[shop_id] = tb2.[shop_id] "
            + "where tb2.[ban_status] = 0 "
            + "order by [created_date] desc";
    private static final String GETTOPSELLERS = "Select t1.product_id, t1.shop_id, t1.total\n"
            + "from\n"
            + "	(Select tb1.product_id, tb1.shop_id, sum(tb2.sales) as total\n"
            + "	from\n"
            + "		(select pr.product_id, pr.shop_id, id\n"
            + "		from products pr\n"
            + "		join product_detail pd\n"
            + "		on pr.product_id = pd.product_id) tb1\n"
            + "	join\n"
            + "		(SELECT [p_detail_id], sum([quantity]) as sales\n"
            + "		FROM [orderdetail]\n"
            + "		group by [p_detail_id]) tb2\n"
            + "	on tb1.id = tb2.p_detail_id\n"
            + "	group by tb1.product_id, tb1.shop_id) t1\n"
            + "join shops t2\n"
            + "on t1.shop_id = t2.shop_id\n"
            + "where t2.ban_status = 0\n"
            + "order by total desc";
    private static final String GETTOPSELLERSBYMAINCATEID = "Select t1.product_id, t1.shop_id, t1.total\n"
            + "from\n"
            + "	(Select tb1.product_id, tb1.shop_id, sum(tb2.sales) as total\n"
            + "	from\n"
            + "		(select pr.product_id, pr.shop_id, pd.id\n"
            + "		from products pr\n"
            + "		join product_detail pd\n"
            + "		on pr.product_id = pd.product_id\n"
            + "		join shopcategory sc\n"
            + "		on pr.scate_id = sc.id\n"
            + "		where sc.maincate_id = ?) tb1\n"
            + "	join\n"
            + "		(SELECT [p_detail_id], sum([quantity]) as sales\n"
            + "		FROM [orderdetail]\n"
            + "		group by [p_detail_id]) tb2\n"
            + "	on tb1.id = tb2.p_detail_id\n"
            + "	group by tb1.product_id, tb1.shop_id) t1\n"
            + "join shops t2\n"
            + "on t1.shop_id = t2.shop_id\n"
            + "where t2.ban_status = 0\n"
            + "order by total desc";
    private static final String MAXPRODUCTDETAIL = "Select max(id) from product_detail";
    
    public static int getMaxProductDetail(){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int max = 0;
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(MAXPRODUCTDETAIL);
            rs = ptm.executeQuery();
            if(rs.next()){
                max = rs.getInt(1);
            }
        }catch (Exception ex) {
            ex.printStackTrace();
        }
        return max;
    }

    public static ArrayList<ProductDetail> getProductDetailsByProduct(int id) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ProductDetail pd = new ProductDetail();
        ArrayList<ProductDetail> details = new ArrayList<>();
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETPRODUCTDETAILBYPRODUCT);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                pd = new ProductDetail();
                pd.setId(rs.getInt("id"));
                pd.setProduct_id(id);
                pd.setPrice(rs.getDouble("price"));
                pd.setQuantity(rs.getInt("quantity"));
                pd.setName(rs.getString("name").trim());
                pd.setImg(rs.getString("img") == null ? null : rs.getString("img").trim());
                details.add(pd);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return details;
    }

    public static ArrayList<Products> getAllProducts() {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = new Products();
        ArrayList<Products> results = new ArrayList<>();
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETALLPRODUCTS);
            rs = ptm.executeQuery();
            while (rs.next()) {
                List<ProductDetail> productDetails = new ArrayList<>();
                int product_id = rs.getInt("product_id");
                int shop_id = rs.getInt("shop_id");
                int shopcategory_id = rs.getInt("scate_id");
                String description = rs.getString("description");
                //CREATED DATE IN SQL DB IS DATETIME
                Date created_date = new Date(rs.getTimestamp("created_date").getTime());
                String product_name = rs.getString("name");
                Shops shop = SellersDao.getShopById(shop_id);
                ShopCategory shopcategory = CategoryDao.getShopCategoryById(shopcategory_id);
                productDetails = getProductDetailsByProduct(product_id);
                p = new Products(product_id, shop_id, shopcategory_id, created_date, description, product_name);
                p.setShop(shop);
                p.setShopCategory(shopcategory);
                p.setProductdetails(productDetails);
                results.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return results;
    }

    public static ArrayList<Products> getNewestProducts() {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = new Products();
        ArrayList<Products> results = new ArrayList<>();
        List<ProductDetail> pdetails = null;
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETNEWESTPRODUCTS);
            rs = ptm.executeQuery();
            while (rs.next()) {
                pdetails = new ArrayList<>();
                int product_id = rs.getInt("product_id");
                int shop_id = rs.getInt("shop_id");
                int shopcategory_id = rs.getInt("scate_id");
                String description = rs.getString("description");
                //CREATED DATE IN SQL DB IS DATETIME
                Date created_date = new Date(rs.getTimestamp("created_date").getTime());
                String product_name = rs.getString("name");
                Shops shop = SellersDao.getShopById(shop_id);
                ShopCategory shopCategory = CategoryDao.getShopCategoryById(shopcategory_id);
                pdetails = getProductDetailsByProduct(product_id);
                p = new Products(product_id, shop_id, shopcategory_id, created_date, description, product_name);
                p.setShop(shop);
                p.setShopCategory(shopCategory);
                p.setProductdetails(pdetails);
                results.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return results;
    }

    public static double getHighestPrice() {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        double highest = 0;
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETHIGHESTPRICE);
            rs = ptm.executeQuery();
            if (rs.next()) {
                highest = rs.getDouble("price");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return highest;
    }

    public static ArrayList<Products> getProductsByPrice(int min, int max) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Products> result = new ArrayList<>();
        Products p = null;
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETPRODUCTBYPRICE);
            ptm.setInt(1, min);
            ptm.setInt(2, max);
            rs = ptm.executeQuery();
            while (rs.next()) {
                p = new Products();
                int product_id = rs.getInt("product_id");
                p = getProductById(product_id);
                result.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public static ArrayList<Products> getProductsByMainCateId(int id) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = null;
        ArrayList<Products> product_by_mcate = new ArrayList<>();
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETPRODUCTBYMAINCATEID);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                int shopcategory_id = rs.getInt("scate_id");
                String description = rs.getString("description");
                String product_name = rs.getString("name");
                p = new Products();
                p.setProduct_id(product_id);
                p.setScate_id(shopcategory_id);
                p.setDescription(description);
                p.setName(product_name);
                p.setShopCategory(CategoryDao.getShopCategoryById(shopcategory_id));
                p.setProductdetails(getProductDetailsByProduct(product_id));
                product_by_mcate.add(p);
            }
        } catch (Exception ex) {
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
                int shopcategory_id = rs.getInt("scate_id");
                String description = rs.getString("description");
                String product_name = rs.getString("name");
                p = new Products();
                p.setProduct_id(product_id);
                p.setScate_id(shopcategory_id);
                p.setDescription(description);
                p.setName(product_name);
                p.setShopCategory(CategoryDao.getShopCategoryById(shopcategory_id));
                p.setProductdetails(getProductDetailsByProduct(product_id));
                product_by_mcate.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return product_by_mcate;
    }

    public static ArrayList<Products> getProductsByShopCateId(int scate_id) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = null;
        ArrayList<Products> product_by_scate = new ArrayList<>();
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETPRODUCTSBYSHOPCATEID);
            ptm.setInt(1, scate_id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                int shop_id = rs.getInt("shop_id");
                int shopcategory_id = scate_id;
                String description = rs.getString("description");
                //CREATED DATE IN SQL DB IS DATETIME
                Date created_date = new Date(rs.getTimestamp("created_date").getTime());
                String product_name = rs.getString("name");
                p = new Products(product_id, shop_id, shopcategory_id, created_date, description, product_name);
                p.setShopCategory(CategoryDao.getShopCategoryById(shopcategory_id));
                p.setShop(SellersDao.getShopById(shop_id));
                p.setProductdetails(getProductDetailsByProduct(product_id));
                product_by_scate.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return product_by_scate;
    }

    public static Products getProductById(int id) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = new Products();
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETPRODUCTBYID);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int product_id = id;
                int shop_id = rs.getInt("shop_id");
                int shopcategory_id = rs.getInt("scate_id");
                String description = rs.getString("description");
                //CREATED DATE IN SQL DB IS DATETIME
                Date created_date = new Date(rs.getTimestamp("created_date").getTime());
                String product_name = rs.getString("name");

                p = new Products(product_id, shop_id, shopcategory_id, created_date, description, product_name);
                p.setShopCategory(CategoryDao.getShopCategoryById(shopcategory_id));
                p.setShop(SellersDao.getShopById(shop_id));
                p.setProductdetails(getProductDetailsByProduct(id));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return p;
    }

    public static ArrayList<Products> getProductsByShop(int id) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Products p = null;
        ArrayList<Products> product_by_shop = new ArrayList<>();
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETPRODUCTSBYSHOP);
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
                p = new Products(product_id, shop_id, shopcategory_id, created_date, description, product_name);
                p.setShopCategory(CategoryDao.getShopCategoryById(shopcategory_id));
                p.setShop(SellersDao.getShopById(shop_id));
                p.setProductdetails(getProductDetailsByProduct(product_id));
                product_by_shop.add(p);
            }
        } catch (Exception ex) {
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
                p = ProductDao.getProductById(rs.getInt("product_id"));
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
        try ( Connection con = SQLConnection.getConnection()) {
            ptm = con.prepareStatement(GETTOPSELLERSBYMAINCATEID);
            ptm.setInt(1, mcate_id);
            rs = ptm.executeQuery();
            while (rs.next()) {
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
//        pr.forEach(pro -> System.out.println(pro.getShopCategory()));
//        Products p = getProductById(7);
//        System.out.println(p.getName());
        System.out.println(getTopSellers().get(0).getName());
//        ArrayList<Products> pp = getTopSellersByMainCate(9);
//        pp.forEach(pro->System.out.println(pro.getShopCategory()));
    }
}
