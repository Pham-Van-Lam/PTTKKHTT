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
public class Mathang072 implements Serializable{
    private int id;
    private String name;
    private double price;
    private String note;

    public Mathang072() {
    }

    public Mathang072(int id, String name, double price, String note) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Mathang072{" + "id=" + id + ", name=" + name + ", price=" + price + ", note=" + note + '}';
    }
    
}
