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
public class NVquanly072 extends Nhanvien072 implements Serializable{

    public NVquanly072() {
    }

    public NVquanly072(int id, String username, String password, String name, Date ngaySinh, String note, String number, String vitri, String address) {
        super(id, username, password, name, ngaySinh, note, number, vitri, address);
    }

}