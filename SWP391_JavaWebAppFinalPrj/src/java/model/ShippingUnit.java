/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author LENOVO
 */
public class ShippingUnit {
    private int id;
    private String name;
    private double cost;
    private String supportShippingMethod;
    public ShippingUnit() {
    }

    public ShippingUnit(int id, String name, double cost, String supportShippingMethod) {
        this.id = id;
        this.name = name;
        this.cost = cost;
        this.supportShippingMethod = supportShippingMethod;
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

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getSupportShippingMethod() {
        return supportShippingMethod;
    }

    public void setSupportShippingMethod(String supportShippingMethod) {
        this.supportShippingMethod = supportShippingMethod;
    }

    // toString method
    @Override
    public String toString() {
        return "ShippingUnit{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", cost=" + cost +
                ", supportShippingMethod='" + supportShippingMethod + '\'' +
                '}';
    }
}
