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
public class Thanhvien072 implements Serializable{
    private int id;
    private String username;
    private String password;
    private String name;
    private Date ngaySinh;
    private String note;
    private String number;
    private String vitri;  // them
    private String address;
    

    public Thanhvien072() {
    }

    public Thanhvien072(int id, String username, String password, String name, Date ngaySinh, String note, String number, String vitri, String address) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.ngaySinh = ngaySinh;
        this.note = note;
        this.number = number;
        this.vitri = vitri;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getVitri() {
        return vitri;
    }

    public void setVitri(String vitri) {
        this.vitri = vitri;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Thanhvien072{" + "id=" + id + ", username=" + username + ", password=" + password + ", name=" + name + ", ngaySinh=" + ngaySinh + ", note=" + note + ", number=" + number + ", vitri=" + vitri + ", address=" + address + '}';
    }

}
