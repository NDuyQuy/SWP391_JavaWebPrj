/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author ASUS
 */
public class Messages {
    private int message_id;
    private int shop_id;
    private int customer_id;
    private Timestamp time_stamp;
    //0: sent - shop; 1: seen by user - shop; 2: sent - user; 3: seen by shop - user; -1: deleted - shop; -2: deleted - user
    private int message_status;
    private String content;
    private Users customer;
    private Shops shop;

    public Messages() {
    }

    public Messages(int message_id, int shop_id, int customer_id, Timestamp time_stamp, int message_status, String content) {
        this.message_id = message_id;
        this.shop_id = shop_id;
        this.customer_id = customer_id;
        this.time_stamp = time_stamp;
        this.message_status = message_status;
        this.content = content;
    }
    
    

    public int getMessage_id() {
        return message_id;
    }

    public void setMessage_id(int message_id) {
        this.message_id = message_id;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public Timestamp getTime_stamp() {
        return time_stamp;
    }

    public void setTime_stamp(Timestamp time_stamp) {
        this.time_stamp = time_stamp;
    }

    public int getMessage_status() {
        return message_status;
    }

    public void setMessage_status(int message_status) {
        this.message_status = message_status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
    
    @Override
    public String toString() {
        return "Messages{" + "message_id=" + message_id + ", shop_id=" + shop_id + ", customer_id=" + customer_id + ", time_stamp=" + time_stamp + ", message_status=" + message_status + ", content=" + content + '}';
    }
    
}
