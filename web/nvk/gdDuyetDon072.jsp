<%-- 
    Document   : gdDuyetDon072
    Created on : Oct 21, 2024, 12:57:19 AM
    Author     : LamPham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8" import="java.util.ArrayList, java.util.List, java.text.DecimalFormat, dao.Donhang072DAO, model.*"%>

<%
    Thanhvien072 nvk = (Thanhvien072) session.getAttribute("nvkho");
    if (nvk == null) {
        response.sendRedirect("gdDangnhap072.jsp");
        return;
    }
    Donhang072DAO donhang072DAO = new Donhang072DAO();
    ArrayList<Donhang072> donhang072s = (ArrayList<Donhang072>) donhang072DAO.getDSDonChuaDuyet();
    session.setAttribute("dsDH", donhang072s);

    String action = request.getParameter("action");
    if (action != null && action.equals("donhang")) {
        int id = Integer.parseInt(request.getParameter("id"));
        //ArrayList<Donhang072> donhang072s = (ArrayList<Donhang072>) session.getAttribute("dsDH");
        Donhang072 donhang072 = donhang072s.stream()
                .filter(dh -> dh.getId() == id)
                .findFirst()
                
                .orElse(null);
        session.setAttribute("donhang", donhang072);
        response.sendRedirect("gdDonCD072.jsp");
        return;
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Duyệt đơn</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                color: #333;
                margin: 0;
                padding: 20px;
                text-align: center;
            }
            h1 {
                color: #4CAF50;
            }
            .greeting {
                text-align: right;
                margin-bottom: 20px;
                font-size: 14px;
            }
            .logout {
                color: #4CAF50;
                text-decoration: none;
                font-weight: bold;
                margin-left: 10px;
            }
            .logout:hover {
                text-decoration: underline;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                font-size: 18px;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                text-align: left;
                padding: 12px;
            }
            th {
                background-color: #4CAF50;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:nth-child(odd) {
                background-color: #ffffff;
            }
            tr:hover {
                background-color: #e0e0e0;
            }
            .back-button {
                margin-top: 20px;
                padding: 10px 20px;
                font-size: 16px;
                color: white;
                background-color: #4CAF50;
                border: none;
                cursor: pointer;
                border-radius: 5px;
            }
            .back-button:hover {
                background-color: #45a049;
            }
            .order-link {
                color: #000; /* Set text color to black */
                text-decoration: none; /* Remove underline */
            }
        </style>
    </head>
    <body>
        <h1>Duyệt đơn hàng</h1>
        <div class="greeting">
            Xin chào: <%= nvk.getName() %> - MNV: <%= nvk.getId() %>
            <a href="gdDangnhap072.jsp" class="logout">Đăng xuất</a>
        </div>
        <%
            if (donhang072s == null || donhang072s.isEmpty()) {
        %>
        <h2>Chưa có đơn hàng nào</h2>
        <%
            } else {
                DecimalFormat decimalFormat = new DecimalFormat("#,###.##");
        %>
        <table>
            <thead>
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Tên khách hàng</th>
                    <th>Ngày đặt</th>
                    <th>Giá tiền</th>
                    <th>Tình trạng</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Donhang072 donhang : donhang072s) {
                        String link = "gdDuyetDon072.jsp?action=donhang&id=" + donhang.getId();
                %>
                <tr>
                    <td><a href="<%= link %>" class="order-link"><%= donhang.getId() %></a></td>
                    <td><a href="<%= link %>" class="order-link"><%= donhang.getKhachhang072().getName() %></a></td>
                    <td><a href="<%= link %>" class="order-link"><%= donhang.getDate() %></a></td>
                    <td><a href="<%= link %>" class="order-link"><%= decimalFormat.format(donhang.getTotal()) %></a></td>
                    <td><a href="<%= link %>" class="order-link"><%= donhang.getStatus() %></a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            }
        %>

        <!-- Back button -->
        <a href="gdChinhNVK072.jsp"><button class="back-button">Quay lại</button></a>

    </body>
</html>
