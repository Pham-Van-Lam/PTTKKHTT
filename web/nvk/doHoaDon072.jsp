<%-- 
    Document   : doHoaDon072
    Created on : Oct 24, 2024, 10:07:50 AM
    Author     : LamPham
--%>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8" import="java.util.ArrayList, java.util.List, java.net.URLEncoder, java.text.DecimalFormat, dao.*, model.*"%>
<%
    String action = request.getParameter("action");
    if (action != null && action.equals("add")) {
        Hoadon072 hoadon = (Hoadon072) session.getAttribute("hoadon");
        Hoadon072DAO hoadon072DAO = new Hoadon072DAO();

        boolean check = hoadon072DAO.addHoaDon(hoadon);
        String meg = "Tạo hóa đơn thất bại";
        if (check) {
            meg = "Tạo hóa đơn thành công";
        }
        
        // URL-encode the message before redirecting
        String encodedMessage = URLEncoder.encode(meg, "UTF-8");
        response.sendRedirect("gdHoaDon072.jsp?meg=" + encodedMessage);
    }
%>
