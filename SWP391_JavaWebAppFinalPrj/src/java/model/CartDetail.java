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
    //PRODUCT DETAIL ID 
    private int p_detail_id;
    private int quantity;
    private Users user;
    private ProductDetail productDetail;

    public CartDetail() {
    }

    public CartDetail(int user_id, int p_detail_id, int quantity) {
        this.user_id = user_id;
        this.p_detail_id = p_detail_id;
        this.quantity = quantity;
    }
    public CartDetail(int user_id, int p_detail_id, int quantity, Users user, ProductDetail productDetail) {
        this.user_id = user_id;
        this.p_detail_id = p_detail_id;
        this.quantity = quantity;
        this.user = user;
        this.productDetail = productDetail;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getP_detail_id() {
        return p_detail_id;
    }

    public void setP_detail_id(int p_detail_id) {
        this.p_detail_id = p_detail_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail productDetail) {
        this.productDetail = productDetail;
    }

   

   
    
    
   
    
    @Override
    public String toString() {
        return "Cartdetail{" + "user_id=" + user_id + ", product_id=" + p_detail_id + ", quantity=" + quantity + '}';
    }

}
