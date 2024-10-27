/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import model.Thanhvien072;

/**
 *
 * @author LamPham
 */
public class Thanhvien072DAO extends DAO {

    public Thanhvien072DAO() {
        super();
    }
    
    public boolean kiemtraDangnhap(Thanhvien072 tv){
        boolean kq = false;
        if( tv.getUsername().contains("true") ||
            tv.getUsername().contains("=") ||
            tv.getPassword().contains("true") ||
            tv.getPassword().contains("=")) return false;
        
        String sql = "{call kiemtraDN(?,?)}";
        try{
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1, tv.getUsername());
            cs.setString(2, tv.getPassword());
            ResultSet rs = cs.executeQuery();
            
            if(rs.next()){
                tv.setId(rs.getInt("id"));
                tv.setUsername(rs.getString("username"));
                tv.setName(rs.getString("name"));
                tv.setNote(rs.getString("note"));
                tv.setNumber(rs.getString("number"));
                tv.setNgaySinh(rs.getDate("ngaySinh"));
                tv.setVitri(rs.getString("vitri"));
                kq = true;
            }
            
        } catch(Exception e){
            e.printStackTrace();
        }
        return kq;
    }
    
    public static void main(String[] args) {
        Thanhvien072 tv = new Thanhvien072();
        tv.setUsername("nguyenvana1");
        tv.setPassword("passA123");
        
        Thanhvien072DAO thanhvien072DAO = new Thanhvien072DAO();
        
        boolean check = thanhvien072DAO.kiemtraDangnhap(tv);
        System.out.println(check);
        System.out.println(tv);
    }
    
}
