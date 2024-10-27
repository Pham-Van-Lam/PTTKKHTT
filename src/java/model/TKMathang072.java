/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author LamPham
 */
public class TKMathang072 extends Mathang072 implements Serializable{
    private Date statDate;
    private Date endDate;

    public TKMathang072() {
    }

    public TKMathang072(Date statDate, Date endDate, int id, String name, double price, String note) {
        super(id, name, price, note);
        this.statDate = statDate;
        this.endDate = endDate;
    }

    public Date getStatDate() {
        return statDate;
    }

    public void setStatDate(Date statDate) {
        this.statDate = statDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "TKMathang072{" + "statDate=" + statDate + ", endDate=" + endDate + '}';
    }
    
}
