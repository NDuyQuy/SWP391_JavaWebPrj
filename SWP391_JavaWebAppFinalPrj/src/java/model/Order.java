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
public class Order {
    private int id;
    private User user;
    private ShippingUnit shippingUnit;
    private Voucher voucher;
    private int total;
    private String shippingMethod;
    private String paymentMethod;
    private String status;
    private String receiverName;
    private String receivePhone;
    private String receiveAddress;
    private LocalDate orderDate;

    public Order() {
    }

    public Order(int id, User user, ShippingUnit shippingUnit, Voucher voucher, int total, String shippingMethod, String paymentMethod, String status, String receiverName, String receivePhone, String receiveAddress, LocalDate orderDate) {
        this.id = id;
        this.user = user;
        this.shippingUnit = shippingUnit;
        this.voucher = voucher;
        this.total = total;
        this.shippingMethod = shippingMethod;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.receiverName = receiverName;
        this.receivePhone = receivePhone;
        this.receiveAddress = receiveAddress;
        this.orderDate = orderDate;
    }
}
