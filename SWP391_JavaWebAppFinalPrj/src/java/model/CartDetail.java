/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ASUS
 */
public class CartDetail {
    private int user_id;
    private int product_id;
    private int quantity;
    public Shops shop;
    public Products product;

    public CartDetail() {
    }

    public CartDetail(int user_id, int product_id, int quantity, Shops shop, Products product) {
        this.user_id = user_id;
        this.product_id = product_id;
        this.quantity = quantity;
        this.shop = shop;
        this.product = product;
    }
    
    
    

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
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

    public Products getProduct() {
        return product;
    }

    public void setProduct(Products product) {
        this.product = product;
    }
    
    

    @Override
    public String toString() {
        return "Cartdetail{" + "user_id=" + user_id + ", product_id=" + product_id + ", quantity=" + quantity + '}';
    }
}
