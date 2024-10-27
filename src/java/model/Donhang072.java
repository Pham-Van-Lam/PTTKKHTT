/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author LamPham
 */
public class Donhang072 implements Serializable{
    private int id;
    private Date date;
    private double total;
    private String note;
    private String status;
    private Khachhang072 khachhang072;
    private List<Mathangmua072> mathangmua072s = new ArrayList<>();

    public Donhang072() {
    }

    public Donhang072(int id, Date date, double total, String note, String status, Khachhang072 khachhang072) {
        this.id = id;
        this.date = date;
        this.total = total;
        this.note = note;
        this.status = status;
        this.khachhang072 = khachhang072;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Khachhang072 getKhachhang072() {
        return khachhang072;
    }

    public void setKhachhang072(Khachhang072 khachhang072) {
        this.khachhang072 = khachhang072;
    }

    public List<Mathangmua072> getMathangmua072s() {
        return mathangmua072s;
    }

    public void setMathangmua072s(List<Mathangmua072> mathangmua072s) {
        this.mathangmua072s = mathangmua072s;
    }
    

    @Override
    public String toString() {
        return "Donhang072{" + "id=" + id + ", date=" + date + ", total=" + total + ", note=" + note + ", status=" + status + ", khachhang072=" + khachhang072 + ", mathangmua072s=" + mathangmua072s + '}';
    }
    
}
