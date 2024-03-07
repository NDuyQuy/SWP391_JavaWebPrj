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
public class SellerRequest {
    private int userId;
    private String userName;
    private String Fullname;
    private String shopName;
    private Timestamp createDate; //Create Account Date
    private Timestamp requestDate;

    public SellerRequest(int userId, String userName, String Fullname, String shopName, Timestamp createDate, Timestamp requestDate) {
        this.userId = userId;
        this.userName = userName;
        this.Fullname = Fullname;
        this.shopName = shopName;
        this.createDate = createDate;
        this.requestDate = requestDate;
    }

    public SellerRequest() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullname() {
        return Fullname;
    }

    public void setFullname(String Fullname) {
        this.Fullname = Fullname;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    public Timestamp getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Timestamp requestDate) {
        this.requestDate = requestDate;
    }
    
    
}
