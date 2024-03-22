/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class Orders {
    private int order_id;
    private int customer_id;
    private int shop_id;
    private int shipping_cost;
    private int total;
    private String payment_method;
    private String status;
    private String receiver_name;
    private String receiver_phone;
    private String receiver_address;
    private String shipping_method;
    private int shippingunit_id;
    private Date order_date;
    private int type;
    private Users customer;
    private Shops shop;
    private ShippingUnits shippingunit;
private List<OrderDetail> orderDetails;
public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }
    public Orders() {
    }

    public Orders(int order_id, int customer_id, int shop_id, int shipping_cost, int total, String payment_method, String status, String receiver_name, String receiver_phone, String receiver_address, String shipping_method, int shippingunit_id, Date order_date, int type) {
        this.order_id = order_id;
        this.customer_id = customer_id;
        this.shop_id = shop_id;
        this.shipping_cost = shipping_cost;
        this.total = total;
        this.payment_method = payment_method;
        this.status = status;
        this.receiver_name = receiver_name;
        this.receiver_phone = receiver_phone;
        this.receiver_address = receiver_address;
        this.shipping_method = shipping_method;
        this.shippingunit_id = shippingunit_id;
        this.order_date = order_date;
        this.type = type;
    }
    
    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getShipping_cost() {
        return shipping_cost;
    }

    public void setShipping_cost(int shipping_cost) {
        this.shipping_cost = shipping_cost;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReceiver_name() {
        return receiver_name;
    }

    public void setReceiver_name(String receiver_name) {
        this.receiver_name = receiver_name;
    }

    public String getReceiver_phone() {
        return receiver_phone;
    }

    public void setReceiver_phone(String receiver_phone) {
        this.receiver_phone = receiver_phone;
    }

    public String getReceiver_address() {
        return receiver_address;
    }

    public void setReceiver_address(String receiver_address) {
        this.receiver_address = receiver_address;
    }

    public String getShipping_method() {
        return shipping_method;
    }

    public void setShipping_method(String shipping_method) {
        this.shipping_method = shipping_method;
    }

    public int getShippingunit_id() {
        return shippingunit_id;
    }

    public void setShippingunit_id(int shippingunit_id) {
        this.shippingunit_id = shippingunit_id;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public Users getCustomer() {
        return customer;
    }

    public void setCustomer(Users customer) {
        this.customer = customer;
    }

    public Shops getShop() {
        return shop;
    }

    public void setShop(Shops shop) {
        this.shop = shop;
    }

    public ShippingUnits getShippingunit() {
        return shippingunit;
    }

    public void setShippingunit(ShippingUnits shippingunit) {
        this.shippingunit = shippingunit;
    }
    
    @Override
    public String toString() {
        return "Orders{" + "order_id=" + order_id + ", customer_id=" + customer_id + ", shop_id=" + shop_id + ", shipping_cost=" + shipping_cost + ", total=" + total + ", payment_method=" + payment_method + ", status=" + status + ", receiver_name=" + receiver_name + ", receiver_phone=" + receiver_phone + ", receiver_address=" + receiver_address + ", shipping_method=" + shipping_method + ", shippingunit_id=" + shippingunit_id + ", order_date=" + order_date + ", type=" + type + '}';
    }
    
}
