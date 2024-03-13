/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import java.time.LocalDateTime;
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
    private int shop_id;
    ArrayList<Integer> ListApplied = new ArrayList<Integer>();

    public Voucher() {
    }

    public Voucher(int id, String code, int discount, Timestamp start, Timestamp end, int type, int min, String description, int count, int shop_id) {
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
        this.shop_id = shop_id;
    }
    
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

    public Voucher(int id, String code, int discount, int type, int min, String description, int count) {
        this.id = id;
        this.code = code;
        this.discount = discount;
       
        this.type = type;
        this.min = min;
        this.description = description;
        this.count = count;
    }

    public Voucher(int voucherId, String code, int discountAmount, LocalDateTime startDateTime, LocalDateTime expireDateTime, int type, int minRequire, String description, int useCount, int shopId) {
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
        this.shop_id = shop_id;
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

    public String getDiscount_unit() {
        return discount_unit;
    }

    public void setDiscount_unit(String discount_unit) {
        this.discount_unit = discount_unit;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    @Override
    public String toString() {
        return "Voucher{" + "id=" + id + ", code=" + code + ", discount=" + discount + ", discount_type=" + discount_type + ", discount_unit=" + discount_unit + ", start=" + start + ", end=" + end + ", type=" + type + ", min=" + min + ", description=" + description + ", count=" + count + ", shop_id=" + shop_id + '}';
    }
    
    
}