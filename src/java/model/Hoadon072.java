/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.sql.Date;

/**
 *
 * @author LamPham
 */
public class Hoadon072 implements Serializable{
    private int id;
    private Date date;
    private double total;
    private String note;
    private Donhang072 donhang072;
    private NVgiaohang072 nVgiaohang072;
    private NVkho072 nVkho072;

    public Hoadon072() {
    }

    public Hoadon072(int id, Date date, double total, String note, Donhang072 donhang072, NVgiaohang072 nVgiaohang072, NVkho072 nVkho072) {
        this.id = id;
        this.date = date;
        this.total = total;
        this.note = note;
        this.donhang072 = donhang072;
        this.nVgiaohang072 = nVgiaohang072;
        this.nVkho072 = nVkho072;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Donhang072 getDonhang072() {
        return donhang072;
    }

    public void setDonhang072(Donhang072 donhang072) {
        this.donhang072 = donhang072;
    }

    public NVgiaohang072 getnVgiaohang072() {
        return nVgiaohang072;
    }

    public void setnVgiaohang072(NVgiaohang072 nVgiaohang072) {
        this.nVgiaohang072 = nVgiaohang072;
    }

    public NVkho072 getnVkho072() {
        return nVkho072;
    }

    public void setnVkho072(NVkho072 nVkho072) {
        this.nVkho072 = nVkho072;
    }
    
    public String formattedDate(){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        return formatter.format(this.date);
    }

    @Override
    public String toString() {
        return "Hoadon072{" + "id=" + id + ", date=" + date + ", total=" + total + ", note=" + note + ", donhang072=" + donhang072 + ", nVgiaohang072=" + nVgiaohang072 + ", nVkho072=" + nVkho072 + '}';
    }
    
}
