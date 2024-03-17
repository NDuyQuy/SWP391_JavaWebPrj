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
public class Shops{
    private int shop_id;
    private String CCCD;
    private String description;
    private String shop_img;
    private int shop_reported_count;
    private String shop_name;
    private Date ban_time;
    private int ban_status;
    private Users users;

    public Shops() {
    }

    public Shops(int shop_id) {
        this.shop_id = shop_id;
    }

    public Shops(int shop_id, String CCCD, String description, String shop_img, int shop_reported_count, String shop_name, Date ban_time, int ban_status, Users users) {
        this.shop_id = shop_id;
        this.CCCD = CCCD;
        this.description = description;
        this.shop_img = shop_img;
        this.shop_reported_count = shop_reported_count;
        this.shop_name = shop_name;
        this.ban_time = ban_time;
        this.ban_status = ban_status;
        this.users = users;
    }
    
    

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public String getCCCD() {
        return CCCD;
    }

    public void setCCCD(String CCCD) {
        this.CCCD = CCCD;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getShop_img() {
        return shop_img;
    }

    public void setShop_img(String shop_img) {
        this.shop_img = shop_img;
    }

    public int getShop_reported_count() {
        return shop_reported_count;
    }

    public void setShop_reported_count(int shop_reported_count) {
        this.shop_reported_count = shop_reported_count;
    }

    public String getShop_name() {
        return shop_name;
    }

    public void setShop_name(String shop_name) {
        this.shop_name = shop_name;
    }

    public Date getBan_time() {
        return ban_time;
    }

    public void setBan_time(Date ban_time) {
        this.ban_time = ban_time;
    }

    public int getBan_status() {
        return ban_status;
    }

    public void setBan_status(int ban_status) {
        this.ban_status = ban_status;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
    
    @Override
    public String toString() {
        return "Shops{" + "shop_id=" + shop_id + ", CCCD=" + CCCD + ", description=" + description + ", shop_img=" + shop_img + ", shop_reported_count=" + shop_reported_count + ", shop_name=" + shop_name + ", ban_time=" + ban_time + ", ban_status=" + ban_status + '}';
    }
}
