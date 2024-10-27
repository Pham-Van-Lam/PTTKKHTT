<%-- 
    Document   : doChonNVGH072
    Created on : Oct 24, 2024, 10:06:26 AM
    Author     : LamPham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8" import="java.util.ArrayList, java.util.List,java.net.URLEncoder, java.text.DecimalFormat, dao.*, model.*"%>
<%
    Donhang072 donhang = (Donhang072) session.getAttribute("donhang");
    NVgiaohang072 nVgiaohang072 = (NVgiaohang072) session.getAttribute("nvgh");
    String updateDH = request.getParameter("donhangId");
    String trangthai = request.getParameter("orderStatus");
    
   
    if (nVgiaohang072 == null) {
        String errorMessage = URLEncoder.encode("Error: Delivery staff not selected.", "UTF-8");
        response.sendRedirect("gdChonNVGH072.jsp?err=" + errorMessage);
        return; 
    }

    if (updateDH == null || trangthai == null || donhang == null) {
        String errorMessage = URLEncoder.encode("Error: Missing order or status information.", "UTF-8");
        response.sendRedirect("gdChonNVGH072.jsp?err=" + errorMessage);
        return;
    }

 
    if (Integer.parseInt(updateDH) != donhang.getId()) {
        String errorMessage = URLEncoder.encode("Error: Order ID does not match.", "UTF-8");
        response.sendRedirect("gdChonNVGH072.jsp?err=" + errorMessage);
        return;
    }

   
    Donhang072DAO donhang072DAO = new Donhang072DAO();
    boolean check = donhang072DAO.updateTrangThaiDH(donhang.getId(), trangthai);

    if (check) {
        donhang.setStatus(trangthai);
        session.setAttribute("donhang", donhang);
        String successMessage = URLEncoder.encode("Success: Order status updated.", "UTF-8");
        response.sendRedirect("gdChonNVGH072.jsp?msg=" + successMessage);
    } else {
        String errorMessage = URLEncoder.encode("Error: Failed to update order status.", "UTF-8");
        response.sendRedirect("gdChonNVGH072.jsp?err=" + errorMessage);
    }
%>

