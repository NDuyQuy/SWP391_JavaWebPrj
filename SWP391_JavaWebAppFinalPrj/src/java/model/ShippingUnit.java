/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hien
 */
public class ShippingUnit {
    private int id;
    private String name;
    private double cost;
    private int supportMethod;

    public ShippingUnit() {
    }

    public ShippingUnit(int id, String name, double cost, int supportMethod) {
        this.id = id;
        this.name = name;
        this.cost = cost;
        this.supportMethod = supportMethod;
    }
}
