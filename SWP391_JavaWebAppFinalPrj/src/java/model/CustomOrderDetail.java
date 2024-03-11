/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class CustomOrderDetail {
    private int order_id;
    private String process_img;
    private String process_video;
    private String description;
    private Date created_date;
    public Order order;

    public CustomOrderDetail() {
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getProcess_img() {
        return process_img;
    }

    public void setProcess_img(String process_img) {
        this.process_img = process_img;
    }

    public String getProcess_video() {
        return process_video;
    }

    public void setProcess_video(String process_video) {
        this.process_video = process_video;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }
    
    
}
