/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.time.LocalDate;
import java.util.List;
/**
 *
 * @author LENOVO
 */
public class Order {
    private int orderId;
    private User user;
    private int shippingUnitId;
    private String voucherCode;
    private double total;
    private String shippingMethod;
    private String paymentMethod;
    private String status;
    private String receiverName;
    private String receiverPhone;
    private String receiverAddress;
    private LocalDate orderDate;
    private String cancelReason;
    private List<OrderDetail> orderDetails;

    public Order() {
    }

    public Order(int orderId, User user, int shippingUnitId, String voucherCode, double total, String shippingMethod, String paymentMethod, String status, String receiverName, String receiverPhone, String receiverAddress, LocalDate orderDate, String cancelReason, List<OrderDetail> orderDetails) {
        this.orderId = orderId;
        this.user = user;
        this.shippingUnitId = shippingUnitId;
        this.voucherCode = voucherCode;
        this.total = total;
        this.shippingMethod = shippingMethod;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.receiverName = receiverName;
        this.receiverPhone = receiverPhone;
        this.receiverAddress = receiverAddress;
        this.orderDate = orderDate;
        this.cancelReason = cancelReason;
        this.orderDetails = orderDetails;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getShippingUnitId() {
        return shippingUnitId;
    }

    public void setShippingUnitId(int shippingUnitId) {
        this.shippingUnitId = shippingUnitId;
    }

    public String getVoucherCode() {
        return voucherCode;
    }

    public void setVoucherCode(String voucherCode) {
        this.voucherCode = voucherCode;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getShippingMethod() {
        return shippingMethod;
    }

    public void setShippingMethod(String shippingMethod) {
        this.shippingMethod = shippingMethod;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverPhone() {
        return receiverPhone;
    }

    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

    public String getCancelReason() {
        return cancelReason;
    }

    public void setCancelReason(String cancelReason) {
        this.cancelReason = cancelReason;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    
    }
