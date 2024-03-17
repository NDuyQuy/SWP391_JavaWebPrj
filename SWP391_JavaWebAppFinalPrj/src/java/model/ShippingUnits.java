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
public class ShippingUnits {
    private int id;
    private String name;
    private int cost;
    private int support_shippingmethod;
    private Users user;

    public ShippingUnits() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public int getSupport_shippingmethod() {
        return support_shippingmethod;
    }

    public void setSupport_shippingmethod(int support_shippingmethod) {
        this.support_shippingmethod = support_shippingmethod;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }
    
    @Override
    public String toString() {
        return "ShippingUnits{" + "id=" + id + ", name=" + name + ", cost=" + cost + ", support_shippingmethod=" + support_shippingmethod + '}';
    }
    
}
