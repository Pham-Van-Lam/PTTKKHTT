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
                text-align: center; /* Center text */
            }
            h1 {
                color: #4CAF50;
            }
            .greeting {
                text-align: right; /* Align text to the right */
                margin-bottom: 20px; /* Space below greeting */
                font-size: 14px; /* Smaller font size */
            }
            .logout {
                color: #4CAF50;
                text-decoration: none; /* Remove underline */
                font-weight: bold; /* Make the logout link bold */
                margin-left: 10px; /* Space between greeting and logout link */
            }
            .logout:hover {
                text-decoration: underline; /* Underline on hover */
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
                background-color: #f2f2f2; /* Light grey for even rows */
            }
            tr:nth-child(odd) {
                background-color: #ffffff; /* White for odd rows */
            }
            tr:hover {
                background-color: #e0e0e0; /* Highlight on hover */
                cursor: pointer; /* Change cursor to pointer on hover */
            }
        </style>
        <script type="text/javascript">
            function redirectToDetails(event, id) {
                window.location.href = 'doDuyetDon072.jsp?action=donhang&id=' + id;
            }
        </script>
    </head>
    <body>
        <h1>Duyệt đơn hàng</h1>
        <div class="greeting">
            Xin chào: <%= nvk.getName()%> - MNV: <%= nvk.getId()%>
            <a href="gdDangnhap072.jsp" class="logout">Đăng xuất</a> <!-- Logout link -->
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
                %>
                <tr onclick="redirectToDetails(event, '<%= donhang.getId() %>')">
                    <td><%= donhang.getId() %></td>
                    <td><%= donhang.getKhachhang072().getName() %></td>
                    <td><%= donhang.getDate() %></td>
                    <td><%= decimalFormat.format(donhang.getTotal()) %></td>
                    <td><%= donhang.getStatus() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            }
        %>
    </body>
</html>


