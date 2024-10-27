/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;

/**
 *
 * @author LamPham
 */
public class Mathangnhap072 implements Serializable {
    private int id;
    private int soLuong;
    private double price;
    private Mathangnhap072 mathangnhap072;

    public Mathangnhap072() {
    }

    public Mathangnhap072(int id, int soLuong, double price, Mathangnhap072 mathangnhap072) {
        this.id = id;
        this.soLuong = soLuong;
        this.price = price;
        this.mathangnhap072 = mathangnhap072;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Mathangnhap072 getMathangnhap072() {
        return mathangnhap072;
    }

    public void setMathangnhap072(Mathangnhap072 mathangnhap072) {
        this.mathangnhap072 = mathangnhap072;
    }

    @Override
    public String toString() {
        return "Mathangnhap072{" + "id=" + id + ", soLuong=" + soLuong + ", price=" + price + ", mathangnhap072=" + mathangnhap072 + '}';
    }
    
}
