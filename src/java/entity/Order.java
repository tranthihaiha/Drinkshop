/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author Minh Hoang
 */
public class Order {
    private String idOder,userID;
    private Date dateOrder;
    private float totals;

    public Order() {
    }

    public Order(String idOder, String userID, Date dateOrder, float totals) {
        this.idOder = idOder;
        this.userID = userID;
        this.dateOrder = dateOrder;
        this.totals = totals;
    }

    public String getIdOder() {
        return idOder;
    }

    public void setIdOder(String idOder) {
        this.idOder = idOder;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
    }

    public float getTotals() {
        return totals;
    }

    public void setTotals(float totals) {
        this.totals = totals;
    }
    
}
