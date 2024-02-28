/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hien
 */
public class Shop {
    private User user;
    private String identityCard;
    private String shopName;
    private String description;
    private String shopImg;
    private int reportedAccount;

    public Shop() {
    }

    public Shop(User user, String identityCard, String shopName) {
        this.user = user;
        this.identityCard = identityCard;
        this.shopName = shopName;
    }

    public User getUser() {
        return user;
    }

    public String getIdentityCard() {
        return identityCard;
    }

    public String getShopName() {
        return shopName;
    }

    public String getDescription() {
        return description;
    }

    public String getShopImg() {
        return shopImg;
    }

    public int getReportedAccount() {
        return reportedAccount;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setIdentityCard(String identityCard) {
        this.identityCard = identityCard;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setShopImg(String shopImg) {
        this.shopImg = shopImg;
    }

    public void setReportedAccount(int reportedAccount) {
        this.reportedAccount = reportedAccount;
    }

    @Override
    public String toString() {
        return "Shop{" + "user=" + user + ", identityCard=" + identityCard + ", shopName=" + shopName + ", description=" + description + ", shopImg=" + shopImg + ", reportedAccount=" + reportedAccount + '}';
    }
    
}
