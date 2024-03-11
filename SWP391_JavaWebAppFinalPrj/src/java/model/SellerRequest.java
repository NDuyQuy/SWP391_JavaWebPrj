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
    private int id;
    private int userId;
    private String userName;
    private String fullname;
    private String shopName;
    private String CCCD;
    private Timestamp createDate; //Create Account Date
    private Timestamp requestDate;

    public SellerRequest() {
    }

    public SellerRequest(int id, int userId, String userName, String Fullname, String shopName, String CCCD, Timestamp createDate, Timestamp requestDate) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        this.fullname = Fullname;
        this.shopName = shopName;
        this.CCCD = CCCD;
        this.createDate = createDate;
        this.requestDate = requestDate;
    }

    public String getCCCD() {
        return CCCD;
    }

    public void setCCCD(String CCCD) {
        this.CCCD = CCCD;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
        return fullname;
    }

    public void setFullname(String Fullname) {
        this.fullname = Fullname;
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
