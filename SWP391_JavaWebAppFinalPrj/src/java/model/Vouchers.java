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
public class Vouchers {
    private int voucher_id;
    private String code;
    private int discount_amount;
    private Date start_date;
    private Date expire_date;
    private int type;
    private int min_require;
    private String description;
    private int shop_id;
    private String discount_unit;
    private int use_count;
    private Shops shop;

    public Vouchers() {
    }

    public Vouchers(int voucher_id, String code, int discount_amount, Date start_date, Date expire_date, int type, int min_require, String description, int use_count) {
        this.voucher_id = voucher_id;
        this.code = code;
        this.discount_amount = discount_amount;
        this.start_date = start_date;
        this.expire_date = expire_date;
        this.type = type;
        this.min_require = min_require;
        this.description = description;
        this.use_count = use_count;
        setDiscount_unit();
    }

    public Vouchers(int voucher_id, String code, int discount_amount, Date start_date, Date expire_date, int type, int min_require, String description, int shop_id, int use_count) {
        this.voucher_id = voucher_id;
        this.code = code;
        this.discount_amount = discount_amount;
        this.start_date = start_date;
        this.expire_date = expire_date;
        this.type = type;
        this.min_require = min_require;
        this.description = description;
        this.shop_id = shop_id;
        this.use_count = use_count;
        setDiscount_unit();
    }
    
    public int getVoucher_id() {
        return voucher_id;
    }

    public void setVoucher_id(int voucher_id) {
        this.voucher_id = voucher_id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getDiscount_amount() {
        return discount_amount;
    }

    public void setDiscount_amount(int discount_amount) {
        this.discount_amount = discount_amount;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getExpire_date() {
        return expire_date;
    }

    public void setExpire_date(Date expire_date) {
        this.expire_date = expire_date;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getMin_require() {
        return min_require;
    }

    public void setMin_require(int min_require) {
        this.min_require = min_require;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    
    public int getUse_count() {
        return use_count;
    }

    public void setUse_count(int use_count) {
        this.use_count = use_count;
    }

    public Shops getShop() {
        return shop;
    }

    public void setShop(Shops shop) {
        this.shop = shop;
    }

    public String getDiscount_unit() {
        return discount_unit;
    }

    public void setDiscount_unit() {
        String unit = this.code.substring(0, 2);
        if (unit.equals("Mv")) this.discount_unit = "VND";
        else this.discount_unit = "%";
    }

    
    
}
