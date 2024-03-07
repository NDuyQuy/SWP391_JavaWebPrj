/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author DELL
 */
public class Voucher {
    private int id;
    private String code;
    private int discount;
    private int discount_type; //1 for value; 2 for percent; -1 for error
    private String discount_unit;
    private Timestamp start;
    private Timestamp end;
    private int type; //1 for product vouchers; 2 for shop vouchers; 0 for main (category) vouchers; -1 for error
    private int min;
    private String description;
    private int count;
    ArrayList<Integer> ListApplied = new ArrayList<Integer>();

    public Voucher(int id, String code, int discount, Timestamp start, Timestamp end, int type, int min, String description, int count) {
        this.id = id;
        this.code = code;
        this.discount = discount;
        setDiscount_type();
        this.start = start;
        this.end = end;
        this.type = type;
        this.min = min;
        this.description = description;
        this.count = count;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public Timestamp getStart() {
        return start;
    }

    public void setStart(Timestamp start) {
        this.start = start;
    }

    public Timestamp getEnd() {
        return end;
    }

    public void setEnd(Timestamp end) {
        this.end = end;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public ArrayList<Integer> getListApplied() {
        return ListApplied;
    }

    public void setListApplied(ArrayList<Integer> ListApplied) {
        this.ListApplied = ListApplied;
    }

    public int getDiscount_type() {
        return discount_type;
    }

    public void setDiscount_type() {
        String prefix = this.code.substring(0, 2);
        switch(prefix) {
            case "VA":
                this.discount_type = 1; //Value
                this.discount_unit = "VND";
                break;
            case "PC":
                this.discount_type = 2; //Percent
                this.discount_unit = "%";
                break;
            default:
                this.discount_type = -1;
                break;
        }
    }
    
    
}
