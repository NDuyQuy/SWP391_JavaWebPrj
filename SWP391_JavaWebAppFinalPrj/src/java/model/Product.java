/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author hien
 */
public class Product {
    private int productID;
    private Shop shop;
    private MainCategory mCate;
    private ShopCategory sCate;
    private String description;
    private LocalDate createdDate;
    private String productName;
    private float price;
    private String productImg;
    private int quantity;

    public Product() {
    }

    public Product(int productID, Shop shop, MainCategory mCate, ShopCategory sCate, String description, LocalDate createdDate, String productName, float price, String productImg, int quantity) {
        this.productID = productID;
        this.shop = shop;
        this.mCate = mCate;
        this.sCate = sCate;
        this.description = description;
        this.createdDate = createdDate;
        this.productName = productName;
        this.price = price;
        this.productImg = productImg;
        this.quantity = quantity;
    }

    public int getProductID() {
        return productID;
    }

    public Shop getShop() {
        return shop;
    }

    public MainCategory getmCate() {
        return mCate;
    }

    public ShopCategory getsCate() {
        return sCate;
    }

    public String getDescription() {
        return description;
    }

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public String getProductName() {
        return productName;
    }

    public float getPrice() {
        return price;
    }

    public String getProductImg() {
        return productImg;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public void setmCate(MainCategory mCate) {
        this.mCate = mCate;
    }

    public void setsCate(ShopCategory sCate) {
        this.sCate = sCate;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
