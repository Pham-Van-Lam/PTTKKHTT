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
public class Mathangmua072 implements Serializable{
    private int id;
    private int soLuong;
    private double price;
    private Mathang072 mathang072;

    public Mathangmua072() {
    }

    public Mathangmua072(int id, int soLuong, double price, Mathang072 mathang072) {
        this.id = id;
        this.soLuong = soLuong;
        this.price = price;
        this.mathang072 = mathang072;
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

    public Mathang072 getMathang072() {
        return mathang072;
    }

    public void setMathang072(Mathang072 mathang072) {
        this.mathang072 = mathang072;
    }

    @Override
    public String toString() {
        return "Mathangmua072{" + "id=" + id + ", soLuong=" + soLuong + ", price=" + price + ", mathang072=" + mathang072 + '}';
    }
    
}
