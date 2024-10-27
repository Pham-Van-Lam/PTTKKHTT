<%-- 
    Document   : doTimMH072.jsp
    Created on : Oct 24, 2024, 10:05:16 AM
    Author     : LamPham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
         import="java.util.ArrayList, java.util.List,java.net.URLEncoder, dao.Mathang072DAO, model.*"%>
<%
    String tenMH = request.getParameter("tenMH");
    if (tenMH != null) {
        Mathang072DAO mathang072DAO = new Mathang072DAO();
        List<Mathang072> mathangs = mathang072DAO.getDSMatHang(tenMH);

        session.setAttribute("dsMH", mathangs);
        String encodedTenMH = URLEncoder.encode(tenMH, "UTF-8");
        response.sendRedirect("gdTimMH072.jsp?tenMH="+encodedTenMH);
        System.out.println(tenMH);
        return;
    }

    String action = request.getParameter("action");
    if (action.equals("chitietMH")) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Mathang072> mathangs = (ArrayList<Mathang072>) session.getAttribute("dsMH");
        if (mathangs != null) {
            Mathang072 mathang072 = mathangs.stream()
                    .filter(mh -> mh.getId() == id)
                    .findFirst()
                    .orElse(null);

            if (mathang072 != null) {
                session.setAttribute("chitietMH", mathang072);
                response.sendRedirect("gdChiTietMH072.jsp");
                return;
            }
        } else {
            response.sendRedirect("gdTimMH072.jsp");
        }
        return;
    } else if(action.equals("trangchu")){
           session.setAttribute("dsMH", null);
           response.sendRedirect("gdChinhKH072.jsp");
    }
    


%>

