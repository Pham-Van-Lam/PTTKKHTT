/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import model.Mathang072;

/**
 *
 * @author LamPham
 */
public class Mathang072DAO extends DAO {

    public Mathang072DAO() {
        super();
    }

    public List<Mathang072> getDSMatHang(String ten) {
        List<Mathang072> mathang072s = new ArrayList<>();

        try {
 
            String sql = "{call getDSMatHang(?)}";

            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1, ten);

            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                Mathang072 mh = new Mathang072();
                mh.setId(rs.getInt("id"));
                mh.setName(rs.getString("name"));
                mh.setNote(rs.getString("note"));
                mh.setPrice(rs.getDouble("price"));
                mathang072s.add(mh);
            }
        } catch (Exception e) {
            e.printStackTrace();
            mathang072s = null;
        }

        return mathang072s;
    }
}
