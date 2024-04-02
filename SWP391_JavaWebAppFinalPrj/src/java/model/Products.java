/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;
import java.util.List;

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
    private List<ProductDetail> productdetails;

    public Products() {
    }

    public void setProductdetails(List<ProductDetail> productdetails) {
        this.productdetails = productdetails;
    }

    public List<ProductDetail> getProductdetails() {
        return productdetails;
    }

    public void setShop(Shops shop) {
        this.shop = shop;
    }

    public void setShopCategory(ShopCategory shopcategory) {
        this.shopCategory = shopcategory;
    }

    public Shops getShop() {
        return shop;
    }

    public ShopCategory getShopCategory() {
        return shopCategory;
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

    public Products(int product_id, int shop_id, int scate_id, Date created_date, String description, String name) {
        this.product_id = product_id;
        this.shop_id = shop_id;
        this.scate_id = scate_id;
        this.created_date = created_date;
        this.description = description;
        this.name = name;
    }
    
}
