<%-- 
    Document   : doDangnhap
    Created on : Oct 21, 2024, 10:49:24 PM
    Author     : LamPham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*"%>
<%
    String username = (String) request.getParameter("username");
    String password = (String) request.getParameter("password");
    Thanhvien072 tv = new Thanhvien072();
    tv.setUsername(username);
    tv.setPassword(password);
    Thanhvien072DAO dao = new Thanhvien072DAO();
    boolean kq = dao.kiemtraDangnhap(tv);
    if (kq && (tv.getVitri().equalsIgnoreCase("khachhang"))) {
        session.setAttribute("khachhang", tv);
        response.sendRedirect("kh\\gdChinhKH072.jsp");
    } else if (kq && (tv.getVitri().equalsIgnoreCase("kho"))) {
        session.setAttribute("nvkho", tv);
        response.sendRedirect("nvk\\gdChinhNVK072.jsp");
    } else {
        response.sendRedirect("gddangnhap.jsp?err=fail");
    }
%>