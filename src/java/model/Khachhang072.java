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
public class Khachhang072 extends Thanhvien072  implements Serializable{
    private String maKH;

    public Khachhang072() {
    }

    public Khachhang072(int id, String username, String password, String name, Date ngaySinh, String note, String number, String vitri, String address) {
        super(id, username, password, name, ngaySinh, note, number, vitri, address);
    }

    public String getMaKH() {
        return maKH;
    }

    public void setMaKH(String maKH) {
        this.maKH = maKH;
    }

}
