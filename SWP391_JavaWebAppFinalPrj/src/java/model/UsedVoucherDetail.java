/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ASUS
 */
public class UsedVoucherDetail {
    private int voucher_id;
    private int order_id;
    private Vouchers voucher;
    private Orders order;

    public UsedVoucherDetail() {
    }

    public int getVoucher_id() {
        return voucher_id;
    }

    public void setVoucher_id(int voucher_id) {
        this.voucher_id = voucher_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public Vouchers getVoucher() {
        return voucher;
    }

    public void setVoucher(Vouchers voucher) {
        this.voucher = voucher;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }
    
    
    
    @Override
    public String toString() {
        return "UsedVoucherDetail{" + "voucher_id=" + voucher_id + ", order_id=" + order_id + '}';
    }
    
}
