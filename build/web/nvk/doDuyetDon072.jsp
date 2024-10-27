<%-- 
    Document   : doDuyetDon072
    Created on : Oct 24, 2024, 10:07:23 AM
    Author     : LamPham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8" import="java.util.ArrayList, java.util.List, java.text.DecimalFormat, dao.Donhang072DAO, model.*"%>

<%
    String action = request.getParameter("action");
    if (action.equals("donhang")) {
        int id = Integer.parseInt(request.getParameter("id"));
        ArrayList<Donhang072> donhang072s = (ArrayList<Donhang072>) session.getAttribute("dsDH");

        Donhang072 donhang072 = donhang072s.stream()
                .filter(dh -> dh.getId() == id)
                .findFirst()
                .orElse(null);
        session.setAttribute("donhang", donhang072);
        response.sendRedirect("gdDonCD072.jsp");
        return;
    }
%>
