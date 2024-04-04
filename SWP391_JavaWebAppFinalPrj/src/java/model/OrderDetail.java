/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hien
 */
public class OrderDetail {
    private int id;
    private int orderID;
    private int p_detail_id;
    private int quantity;
    private String cancel_reason;
    private double totalPrice;
    private Orders order;
    private ProductDetail productDetail;
    public OrderDetail() {
    }

    public OrderDetail(int id, int orderID, int quantity, String cancel_reason, double totalPrice) {
        this.id = id;
        this.orderID = orderID;
        this.quantity = quantity;
        this.cancel_reason = cancel_reason;
        this.totalPrice = totalPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
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

    public String getCancel_reason() {
        return cancel_reason;
    }

    public void setCancel_reason(String cancel_reason) {
        this.cancel_reason = cancel_reason;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail productDetail) {
        this.productDetail = productDetail;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    @Override
    public String toString() {
        return "OrderDetail{" + "id=" + id + ", orderID=" + orderID + ", productID=" + p_detail_id + ", quantity=" + quantity + ", cancel_reason=" + cancel_reason + '}';
    }
    
}