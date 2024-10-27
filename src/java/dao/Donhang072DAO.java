/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.Date;
import model.Donhang072;
import model.Khachhang072;
import model.Mathang072;
import model.Mathangmua072;

/**
 *
 * @author LamPham
 */
public class Donhang072DAO extends DAO {

    public Donhang072DAO() {
        super();
    }

    public List<Donhang072> getDSDonChuaDuyet() {
        List<Donhang072> donhang072s = new ArrayList<>();
        try {
            String sql = "{call getDSDonChuaDuyet()}";
            CallableStatement cs = con.prepareCall(sql);
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                // dh
                Donhang072 dh = new Donhang072();

                dh.setId(rs.getInt("dh_id"));
                dh.setDate(rs.getDate("dh_date"));
                dh.setTotal(rs.getDouble("dh_total"));
                dh.setNote(rs.getString("dh_note"));
                dh.setStatus(rs.getString("dh_status"));
                // kh
                Khachhang072 kh = new Khachhang072();

                kh.setMaKH(rs.getString("kh_mkh"));
                kh.setId(rs.getInt("tv_id"));
                kh.setName(rs.getString("tv_name"));
                kh.setNgaySinh(rs.getDate("tv_ngaySinh"));
                kh.setAddress(rs.getString("tv_address"));
                kh.setNote(rs.getString("tv_note"));
                kh.setNumber(rs.getString("tv_number"));
                // mhm
                Mathangmua072 mhm = new Mathangmua072();

                mhm.setId(rs.getInt("mhm_id"));
                mhm.setPrice(rs.getDouble("mhm_price"));
                mhm.setSoLuong(rs.getInt("mhm_soLuong"));
                // mh
                Mathang072 mh = new Mathang072();
                mh.setId(rs.getInt("mh_id"));
                mh.setName(rs.getString("mh_name"));
                mh.setPrice(rs.getDouble("mh_price"));
                mh.setNote(rs.getString("mh_note"));

                // add 
                mhm.setMathang072(mh);
                dh.setKhachhang072(kh);
                dh.getMathangmua072s().add(mhm);

                // add list
                Donhang072 dhDonhang072 = getDH(donhang072s, dh.getId());
                if (dhDonhang072 == null) {
                    donhang072s.add(dh);
                } else {
                    //Donhang072 donhang072 = getDH(donhang072s, dh.getId());
                    dhDonhang072.getMathangmua072s().add(mhm);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            donhang072s = null;
        }

        return donhang072s;
    }

    private Donhang072 getDH(List<Donhang072> donhang072s, int id) {
        for (Donhang072 donhang072 : donhang072s) {
            if (donhang072.getId() == id) {
                return donhang072;
            }
        }
        return null;
    }

    public boolean updateTrangThaiDH(int id, String tt) {
        boolean update = false;
        try {
            String sql = "{call updateTrangThaiDH(?,?)}";
            CallableStatement cs = con.prepareCall(sql);
            cs.setInt(1, id );
            cs.setString(2, tt);
            ResultSet rs = cs.executeQuery();
            update = true;

        } catch (Exception e) {
            e.printStackTrace();
            update = false;
        }
        return update;
    }

    public static void main(String[] args) {
        Donhang072DAO dAO = new Donhang072DAO();

        List<Donhang072> donhang072s = dAO.getDSDonChuaDuyet();
        for (Donhang072 donhang072 : donhang072s) {
            System.out.println("-------------------start----------------------");
            System.out.println("don hang : " + donhang072);
            Khachhang072 kh = donhang072.getKhachhang072();
            System.out.println("khach hang : " + kh);
            List<Mathangmua072> mhms = donhang072.getMathangmua072s();
            for (Mathangmua072 mhm : mhms) {
                System.out.println("mat hang mua : " + mhm + "MAT_HANG : " + mhm.getMathang072());
            }
            System.out.println("-----------------------endl-------------------");
        }
    }
}
