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
    private int productID;
    private int quantity;
    private String cancel_reason;
    public Orders order;
    public Products product;

    public OrderDetail() {
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

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
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

    @Override
    public String toString() {
        return "OrderDetail{" + "id=" + id + ", orderID=" + orderID + ", productID=" + productID + ", quantity=" + quantity + ", cancel_reason=" + cancel_reason + '}';
    }
    
}
