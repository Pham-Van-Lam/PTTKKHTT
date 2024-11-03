/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import model.NVgiaohang072;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
/**
 *
 * @author LamPham
 */
public class NVgiaohang072DAO extends DAO{

    public NVgiaohang072DAO() {
        super();
    }
    
    public List<NVgiaohang072> getDSNVGH(){
        List<NVgiaohang072> nVgiaohang072s = new ArrayList<>();
        String sql =  "{call getDSSNVGH()}";
        
        try {
            CallableStatement cs = con.prepareCall(sql);
            ResultSet rs = cs.executeQuery();
            
            while(rs.next()){
                NVgiaohang072 nv = new NVgiaohang072();
                nv.setId(rs.getInt("id"));
                nv.setVitri(rs.getString("vitri"));
                nv.setUsername(rs.getString("username"));
                nv.setName(rs.getString("name"));
                nv.setNgaySinh(rs.getDate("ngaySinh"));
                nv.setAddress(rs.getString("address"));
                nv.setNote(rs.getString("note"));
                nv.setNumber(rs.getString("number"));
                
                nVgiaohang072s.add(nv);
            }
        } catch (Exception e) {
            e.printStackTrace();
            nVgiaohang072s = null;
        }
        
        return nVgiaohang072s;
    }
}
