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
public class CustomOrder {
    private int id;
    private String productName;
    private Date expected_complete_date;
    private int seller_id;
    private int custom_id;
    private String status;
    private Date created_date;
    private double cost;

    public CustomOrder() {
    }

    public CustomOrder(int id, String productName, Date expected_complete_date, String status, double cost) {
        this.id = id;
        this.productName = productName;
        this.expected_complete_date = expected_complete_date;
        this.status = status;
        this.cost = cost;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Date getExpected_complete_date() {
        return expected_complete_date;
    }

    public void setExpected_complete_date(Date expected_complete_date) {
        this.expected_complete_date = expected_complete_date;
    }

    public int getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(int seller_id) {
        this.seller_id = seller_id;
    }

    public int getCustom_id() {
        return custom_id;
    }

    public void setCustom_id(int custom_id) {
        this.custom_id = custom_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    @Override
    public String toString() {
        return "CustomOrder{" + "id=" + id + ", productName=" + productName + ", expected_complete_date=" + expected_complete_date + ", seller_id=" + seller_id + ", custom_id=" + custom_id + ", status=" + status + ", created_date=" + created_date + ", cost=" + cost + '}';
    }
    
}
