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
public class Donhangnhap072 implements Serializable{
    private int id;
    private Date ngayTao;
    private double total;
    private String note;
    private String status;
    private Date  ngayNhap;
    private NVkho072 nVkho072;
    private Nhacungcap072 nhacungcap072;
    private List<Mathangnhap072> mathangnhap072s = new ArrayList<>();

    public Donhangnhap072() {
    }

    public Donhangnhap072(int id, Date ngayTao, double total, String note, String status, Date ngayNhap, NVkho072 nVkho072, Nhacungcap072 nhacungcap072, List<Mathangnhap072> mathangnhap072s) {
        this.id = id;
        this.ngayTao = ngayTao;
        this.total = total;
        this.note = note;
        this.status = status;
        this.ngayNhap = ngayNhap;
        this.nVkho072 = nVkho072;
        this.nhacungcap072 = nhacungcap072;
        this.mathangnhap072s = mathangnhap072s;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
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

    public Date getNgayNhap() {
        return ngayNhap;
    }

    public void setNgayNhap(Date ngayNhap) {
        this.ngayNhap = ngayNhap;
    }

    public NVkho072 getnVkho072() {
        return nVkho072;
    }

    public void setnVkho072(NVkho072 nVkho072) {
        this.nVkho072 = nVkho072;
    }

    public Nhacungcap072 getNhacungcap072() {
        return nhacungcap072;
    }

    public void setNhacungcap072(Nhacungcap072 nhacungcap072) {
        this.nhacungcap072 = nhacungcap072;
    }

    public List<Mathangnhap072> getMathangnhap072s() {
        return mathangnhap072s;
    }

    public void setMathangnhap072s(List<Mathangnhap072> mathangnhap072s) {
        this.mathangnhap072s = mathangnhap072s;
    }

    @Override
    public String toString() {
        return "Donhangnhap072{" + "id=" + id + ", ngayTao=" + ngayTao + ", total=" + total + ", note=" + note + ", status=" + status + ", ngayNhap=" + ngayNhap + ", nVkho072=" + nVkho072 + ", nhacungcap072=" + nhacungcap072 + ", mathangnhap072s=" + mathangnhap072s + '}';
    }
    
}
