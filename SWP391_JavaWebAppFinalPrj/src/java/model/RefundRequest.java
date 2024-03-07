/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author DELL
 */
public class RefundRequest {
    private int requestId;
    private int orderId;
    private int productId;
    private String productName;
    private Timestamp requestDate;
    private String status;
    private String reason;
    private String detail;
    private String img;

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Timestamp getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Timestamp requestDate) {
        this.requestDate = requestDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public RefundRequest(int requestId, int orderId, int productId, String productName, Timestamp requestDate, String status, String reason, String detail, String img) {
        this.requestId = requestId;
        this.orderId = orderId;
        this.productId = productId;
        this.productName = productName;
        this.requestDate = requestDate;
        this.status = status;
        this.reason = reason;
        this.detail = detail;
        this.img = img;
    }

    

    public RefundRequest() {
    }
    
    
    
}
