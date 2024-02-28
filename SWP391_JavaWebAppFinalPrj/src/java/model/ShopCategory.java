/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hien
 */
public class ShopCategory {
    private int categoryID;
    private String categoryName;
    private MainCategory mCate;
    private Shop shop;

    public ShopCategory() {
    }

    public ShopCategory(int categoryID, MainCategory mCate, Shop shop, String categoryName) {
        this.categoryID = categoryID;
        this.mCate = mCate;
        this.shop = shop;
        this.categoryName = categoryName;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public MainCategory getmCate() {
        return mCate;
    }

    public Shop getShop() {
        return shop;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public void setmCate(MainCategory mCate) {
        this.mCate = mCate;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
