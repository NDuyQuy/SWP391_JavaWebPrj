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
public class CustomOrderDetail {
    private int customorder_id;
    private String process_img;
    private String process_video;
    private String description;
    private Date created_date;
    private CustomOrder customorder;

    public CustomOrderDetail() {
    }

    public CustomOrderDetail(int customorder_id, String process_img, String process_video, String description) {
        this.customorder_id = customorder_id;
        this.process_img = process_img;
        this.process_video = process_video;
        this.description = description;
    }
    
    public int getCustomorder_id() {
        return customorder_id;
    }

    public void setCustomorder_id(int customorder_id) {
        this.customorder_id = customorder_id;
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

    public CustomOrder getCustomorder() {
        return customorder;
    }

    public void setCustomorder(CustomOrder customorder) {
        this.customorder = customorder;
    }
    
    @Override
    public String toString() {
        return "CustomOrderDetail{" + "customorder_id=" + customorder_id + ", process_img=" + process_img + ", process_video=" + process_video + ", description=" + description + ", created_date=" + created_date + '}';
    }
    
}
