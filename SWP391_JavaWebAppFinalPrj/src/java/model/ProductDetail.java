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
public class ProductDetail {
    private int id;
    private int product_id;
    private double price;
    private int quantity;
    private String img;    
    private String name;
    private Products product;
    public ProductDetail() {
    }

    public ProductDetail(int id, int product_id, double price, int quantity, String img, String name) {
        this.id = id;
        this.product_id = product_id;
        this.price = price;
        this.quantity = quantity;
        this.img = img;
        this.name = name;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Products getProduct() {
        return product;
    }

    public void setProduct(Products product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "ProductDetail{" + "id=" + id + ", product_id=" + product_id + ", price=" + price + ", quantity=" + quantity + ", img=" + img + ", name=" + name + '}';
    }
    
}
