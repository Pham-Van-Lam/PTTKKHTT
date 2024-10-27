<%-- 
    Document   : gdDonCD072
    Created on : Oct 21, 2024, 12:57:34 AM
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
    
    
    Donhang072 donhang = (Donhang072) session.getAttribute("donhang");
    DecimalFormat currencyFormat = new DecimalFormat("#,### VND");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin Đơn hàng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f4f4f9;
            }
            .logged-in-user {
                text-align: right;
                color: #0066cc; /* Distinct color for login info */
                font-weight: bold;
                margin-right: 20px;
            }
            h1, h2 {
                text-align: center;
                color: #333;
            }
            .order-details, .product-list {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }
            .order-details td, .product-list th, .product-list td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
            }
            .order-details {
                margin-bottom: 30px;
                background-color: #fff;
            }
            .order-details th {
                background-color: #f0f0f0;
                color: #333;
            }
            .product-list th {
                background-color: #0073e6;
                color: white;
            }
            .total-row td {
                font-weight: bold;
                background-color: #f0f0f0;
            }
            .no-order {
                text-align: center;
                font-size: 18px;
                color: #888;
            }
            .buttons {
                text-align: center;
                margin-top: 20px;
            }
            .buttons button {
                padding: 10px 20px;
                margin: 0 10px;
                font-size: 16px;
                cursor: pointer;
                border: none;
                border-radius: 5px;
            }
            .back-button {
                background-color: #ff6666;
                color: white;
            }
            .continue-button {
                background-color: #4CAF50;
                color: white;
            }
        </style>
    </head>
    <body>
        <p class="logged-in-user">Nhân viên đăng nhập: <%= nvk.getName() %>, MNV: <%= nvk.getId() %></p>
        <h1>Thông tin Đơn Hàng</h1> 
        <% if (donhang != null) { %>
            <table class="order-details">
                <tr>
                    <th>Mã đơn hàng</th>
                    <td><%= donhang.getId() %></td>
                </tr>
                <tr>
                    <th>Ngày đặt hàng</th>
                    <td><%= donhang.getDate() %></td>
                </tr>
                <tr>
                    <th>Khách hàng</th>
                    <td><%= donhang.getKhachhang072().getName() %></td>
                </tr>
                <tr>
                    <th>Trạng thái đơn hàng</th>
                    <td><%= donhang.getStatus() %></td>
                </tr>
                <tr>
                    <th>Tổng tiền đơn hàng</th>
                    <td><%= currencyFormat.format(donhang.getTotal()) %></td>
                </tr>
                <tr>
                    <th>Ghi chú khách hàng</th>
                    <td><%= donhang.getNote() %></td>
                </tr>
            </table>

            <h2>Danh sách sản phẩm</h2>
            <table class="product-list">
                <thead>
                    <tr>
                        <th>Mã sản phẩm</th>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Đơn giá</th>
                        <th>Thành tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Mathangmua072> products = donhang.getMathangmua072s();
                        double total = 0;
                        for (Mathangmua072 mathang : products) {
                            int quantity = mathang.getSoLuong();
                            double unitPrice = mathang.getPrice();
                            double amount = quantity * unitPrice;
                            total += amount;
                    %>
                    <tr>
                        <td><%= mathang.getMathang072().getId() %></td>
                        <td><%= mathang.getMathang072().getName() %></td>
                        <td><%= quantity %></td>
                        <td><%= currencyFormat.format(unitPrice) %></td>
                        <td><%= currencyFormat.format(amount) %></td>
                    </tr>
                    <% } %>
                    <tr class="total-row">
                        <td colspan="4" align="right">Tổng cộng:</td>
                        <td><%= currencyFormat.format(total) %></td>
                    </tr>
                </tbody>
            </table>

            <div class="buttons">
                <button class="back-button" onclick="window.history.back();">Quay Lại</button>
                <button class="continue-button" onclick="window.location.href='gdChonNVGH072.jsp';">Tiếp Tục</button>
            </div>
        
        <% } else { %>
            <p class="no-order">Đơn hàng không tồn tại hoặc đã hết hạn.</p>
        <% } %>
    </body>
</html>
