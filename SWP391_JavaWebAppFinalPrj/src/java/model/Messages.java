/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author ASUS
 */
public class Messages {
    private int message_id;
    private int shop_id;
    private int customer_id;
    private Date time_stamp;
    private int message_status;
    private String content;
    public Users customer;
    public Shops shop;

    public Messages() {
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

    public Date getTime_stamp() {
        return time_stamp;
    }

    public void setTime_stamp(Date time_stamp) {
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

    @Override
    public String toString() {
        return "Messages{" + "message_id=" + message_id + ", shop_id=" + shop_id + ", customer_id=" + customer_id + ", time_stamp=" + time_stamp + ", message_status=" + message_status + ", content=" + content + '}';
    }
    
}
