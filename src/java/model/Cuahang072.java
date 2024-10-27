/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LamPham
 */
public class Cuahang072 implements Serializable{
    private int id;
    private String name;
    private String addrress;
    private String numbeer;
    private List<Mathang072> mathang072s = new ArrayList<>();

    public Cuahang072() {
    }

    public Cuahang072(int id, String name, String addrress, String numbeer) {
        this.id = id;
        this.name = name;
        this.addrress = addrress;
        this.numbeer = numbeer;
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

    public String getAddrress() {
        return addrress;
    }

    public void setAddrress(String addrress) {
        this.addrress = addrress;
    }

    public String getNumbeer() {
        return numbeer;
    }

    public void setNumbeer(String numbeer) {
        this.numbeer = numbeer;
    }

    public List<Mathang072> getMathang072s() {
        return mathang072s;
    }

    public void setMathang072s(List<Mathang072> mathang072s) {
        this.mathang072s = mathang072s;
    }

    @Override
    public String toString() {
        return "Cuahang072{" + "id=" + id + ", name=" + name + ", addrress=" + addrress + ", numbeer=" + numbeer + ", mathang072s=" + mathang072s + '}';
    }
    
    
}
