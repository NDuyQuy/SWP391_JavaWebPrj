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
public class ReportedUser {
    private int ID;
    private int userID;
    private String userName;
    private String status;
    private String email;
    private String shopname;
    private String reportBy;
    private int count;
    private Timestamp date;
    private Timestamp bantime;
    private String reason;
    private String detail;
    private String img;

    public void setImg(String img) {
        this.img = img;
    }

    public String getImg() {
        return img;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public String getReportBy() {
        return reportBy;
    }

    public void setReportBy(String reportBy) {
        this.reportBy = reportBy;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
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

    public Timestamp getBantime() {
        return bantime;
    }

    public void setBantime(Timestamp bantime) {
        this.bantime = bantime;
    }
    
    

    public ReportedUser() {
    }

    public ReportedUser(int userID, String userName, String reportBy, Timestamp date, String reason, String detail) {
        this.userID = userID;
        this.userName = userName;
        this.reportBy = reportBy;
        this.date = date;
        this.reason = reason;
        this.detail = detail;
    }
    
    

    public ReportedUser(int ID, int userID, String userName, String status, String email, String shopname, String reportBy, int count, Timestamp date, Timestamp bantime, String reason, String detail) {
        this.ID = ID;
        this.userID = userID;
        this.userName = userName;
        this.status = status;
        this.email = email;
        this.shopname = shopname;
        this.reportBy = reportBy;
        this.count = count;
        this.date = date;
        this.bantime = bantime;
        this.reason = reason;
        this.detail = detail;
    }

    

    
}