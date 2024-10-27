/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.Date;
import java.util.logging.Logger;

/**
 *
 * @author LamPham
 */
public class Nhanvien072 extends Thanhvien072 implements Serializable{
    
    private String vitri;

    public Nhanvien072() {
    }

    public Nhanvien072( int id, String username, String password, String name, Date ngaySinh, String note, String number, String vitri, String address) {
        super(id, username, password, name, ngaySinh, note, number, vitri, address);
        this.vitri = vitri;
    }
    
    public String getVitri() {
        return vitri;
    }

    public void setVitri(String vitri) {
        this.vitri = vitri;
    }

    @Override
    public String toString() {
        return "Nhanvien072{" + "vitri=" + vitri + '}';
    }
     
}
