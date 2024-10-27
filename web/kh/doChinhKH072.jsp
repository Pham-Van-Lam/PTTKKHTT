<%-- 
    Document   : doChinhKH072
    Created on : Oct 24, 2024, 10:04:48 AM
    Author     : LamPham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*"%>

<%
    // Lấy tham số `action` từ URL
    String action = request.getParameter("action");

    if (action != null) {
        if (action.equals("dangky")) {
            response.sendRedirect("gdChinhKH072.jsp");
        } else if (action.equals("timhang")) {
            response.sendRedirect("gdTimMH072.jsp");
        } else {
            response.sendRedirect("gdChinhKH072.jsp");
        }
    } else {
        response.sendRedirect("gdChinhKH072.jsp");
    }
%>
