/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author ASUS
 */
public class Products {
    private int product_id;
    private int shop_id;
    private int scate_id;
    private String description;
    private Date createdDate;
    private String name;
    private int money;
    private String img;
    private int quantity;
    private Shops shop;
    private ShopCategory shopCategory;

    public Products() {
    }

    public Products(int product_id, int shop_id, int scate_id, String description, Date createdDate, String name, int money, String img, int quantity) {
        this.product_id = product_id;
        this.shop_id = shop_id;
        this.scate_id = scate_id;
        this.description = description;
        this.createdDate = createdDate;
        this.name = name;
        this.money = money;
        this.img = img;
        this.quantity = quantity;
    }

    public Products(int scate_id, String description, String name, int money, int quantity) {
        this.scate_id = scate_id;
        this.description = description;
        this.name = name;
        this.money = money;
        this.quantity = quantity;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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
        return "Products{" + "product_id=" + product_id + ", shop_id=" + shop_id + ", scate_id=" + scate_id + ", description=" + description + ", createdDate=" + createdDate + ", name=" + name + ", money=" + money + ", img=" + img + ", quantity=" + quantity + '}';
    }
    
}
