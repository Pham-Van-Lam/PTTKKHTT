/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author LamPham
 */
public class DAO {

    public static Connection con;

    public DAO() {
        if (con == null) {
            String url = "jdbc:mysql://localhost:3306/qlstdm?useUnicode=true&characterEncoding=utf8&useSSL=false";
            String dbClass = "com.mysql.cj.jdbc.Driver";
            try {
                Class.forName(dbClass);
                java.util.Properties properties = new java.util.Properties();
                properties.setProperty("useUnicode", "true");
                properties.setProperty("characterEncoding", "utf8mb4");
                properties.setProperty("useSSL", "false");
                con = DriverManager.getConnection(url, "root", "root");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
