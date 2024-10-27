/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author LamPham
 */
public class TKdoanhthu072 extends Hoadon072 implements Serializable{
    private Date statDate;
    private Date endDate;

    public TKdoanhthu072() {
    }

    public TKdoanhthu072(Date statDate, Date endDate, int id, Date date, double total, String note, Donhang072 donhang072, NVgiaohang072 nVgiaohang072, NVkho072 nVkho072) {
        super(id, date, total, note, donhang072, nVgiaohang072, nVkho072);
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
        return "TKdoanhthu072{" + "statDate=" + statDate + ", endDate=" + endDate + '}';
    }
    
}
