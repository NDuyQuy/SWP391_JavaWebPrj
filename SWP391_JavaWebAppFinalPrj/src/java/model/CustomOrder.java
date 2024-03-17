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
public class CustomOrder {
    private int id;
    private String product_name;
    private Date expected_complete_date;
    private Orders order;

    public CustomOrder() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public Date getExpected_complete_date() {
        return expected_complete_date;
    }

    public void setExpected_complete_date(Date expected_complete_date) {
        this.expected_complete_date = expected_complete_date;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }
    
    @Override
    public String toString() {
        return "CustomOrder{" + "id=" + id + ", product_name=" + product_name + ", expected_complete_date=" + expected_complete_date + '}';
    }    
}
