/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.CallableStatement;
import java.sql.Date;
import model.Donhang072;
import model.Hoadon072;
import model.NVgiaohang072;
import model.NVkho072;

/**
 *
 * @author LamPham
 */
public class Hoadon072DAO extends DAO {

    public Hoadon072DAO() {
    }

    public boolean addHoaDon(Hoadon072 hoadon) {
        boolean add = false;
        try {
            String sql = "{call addHoaDon(?,?,?,?,?,?,?)}";
            CallableStatement cs = con.prepareCall(sql);
            cs.setInt(1, hoadon.getId());
            cs.setDate(2, hoadon.getDate());
            cs.setString(3, hoadon.getTotal() + "");
            cs.setString(4, hoadon.getNote());
            cs.setString(5, hoadon.getDonhang072().getId() + "");
            cs.setString(6, hoadon.getnVgiaohang072().getId() + "");
            cs.setString(7, hoadon.getnVkho072().getId() + "");
            int rowsAffected = cs.executeUpdate();
            add = rowsAffected > 0;
           System.out.println("Rows affected: " + rowsAffected);
        } catch (Exception e) {
            e.printStackTrace();
            add = false;
        }
        return add;
    }
}
