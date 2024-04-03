/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class Products {
    private int product_id;
    private int shop_id;
    private int scate_id;
    private Date created_date;
    private String description;
    private String name;
    private Shops shop;
    private ShopCategory shopCategory;
    private ArrayList<ProductDetail> productDetails;
    
    public Products() {
    }

    public Products(int product_id, int shop_id, int scate_id, Date created_date, String description, String name) {
        this.product_id = product_id;
        this.shop_id = shop_id;
        this.scate_id = scate_id;
        this.created_date = created_date;
        this.description = description;
        this.name = name;
    }
    
    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public int getScate_id() {
        return scate_id;
    }

    public void setScate_id(int scate_id) {
        this.scate_id = scate_id;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<ProductDetail> getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(ArrayList<ProductDetail> productDetails) {
        this.productDetails = productDetails;
    }

    public Shops getShop() {
        return shop;
    }

    public void setShop(Shops shop) {
        this.shop = shop;
    }

    public ShopCategory getShopCategory() {
        return shopCategory;
    }

    public void setShopCategory(ShopCategory shopCategory) {
        this.shopCategory = shopCategory;
    }
    
    @Override
    public String toString() {
        return "Products{" + "product_id=" + product_id + ", shop_id=" + shop_id + ", scate_id=" + scate_id + ", name=" + name + '}';
    }

    
    
}
