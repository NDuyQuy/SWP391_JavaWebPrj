/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dao.ProductDao;

/**
 *
 * @author LENOVO
 */
public class CartItem {

    private Product product;
    private int quantity;
    private Shop shop;

    public CartItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public CartItem(int productId, int quantity) {
        this.product = getProductById(productId);
        this.quantity = quantity;
    }

    public CartItem(Product product, int quantity, Shop shop) {
        this.product = product;
        this.quantity = quantity;
        this.shop = shop;
    }

    public CartItem(int productId, int quantity, Shop shop) {
        this.product = getProductById(productId);
        this.quantity = quantity;
        this.shop = shop;
    }

    public Product getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    private Product getProductById(int productId) {
        return ProductDao.getProductById(productId);
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    
}