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
public class ReportDetail {
    private int id;
    private int shop_id;
    private int reporter_id;
    private Date created_date;
    private String text;
    private Shops reported_shop;
    private Users reporter;

    public ReportDetail() {
    }

    public ReportDetail(int id, int shop_id, int reporter_id, Date created_date, String text) {
        this.id = id;
        this.shop_id = shop_id;
        this.reporter_id = reporter_id;
        this.created_date = created_date;
        this.text = text;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public int getReporter_id() {
        return reporter_id;
    }

    public void setReporter_id(int reporter_id) {
        this.reporter_id = reporter_id;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Shops getReported_shop() {
        return reported_shop;
    }

    public void setReported_shop(Shops reported_shop) {
        this.reported_shop = reported_shop;
    }

    public Users getReporter() {
        return reporter;
    }

    public void setReporter(Users reporter) {
        this.reporter = reporter;
    }
    
    @Override
    public String toString() {
        return "ReportDetail{" + "id=" + id + ", shop_id=" + shop_id + ", reporter_id=" + reporter_id + ", created_date=" + created_date + ", text=" + text + '}';
    }
    
}
