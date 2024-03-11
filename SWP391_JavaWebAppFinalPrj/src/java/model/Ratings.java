/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author hien
 */
public class Ratings {
    private int id;
    private OrderDetail orderDetail;
    private LocalDate timeStamp;
    private int score;
    private String comment;

    public Ratings() {
    }

    public Ratings(int id, OrderDetail orderDetail, LocalDate timeStamp, int score, String comment) {
        this.id = id;
        this.orderDetail = orderDetail;
        this.timeStamp = timeStamp;
        this.score = score;
        this.comment = comment;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setOrderDetail(OrderDetail orderDetail) {
        this.orderDetail = orderDetail;
    }

    public void setTimeStamp(LocalDate timeStamp) {
        this.timeStamp = timeStamp;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public OrderDetail getOrderDetail() {
        return orderDetail;
    }

    public LocalDate getTimeStamp() {
        return timeStamp;
    }

    public int getScore() {
        return score;
    }

    public String getComment() {
        return comment;
    }
}
