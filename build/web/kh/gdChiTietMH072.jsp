<%-- 
    Document   : gdChiTietMH072
    Created on : Oct 21, 2024, 12:56:26 AM
    Author     : LamPham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.Mathang072" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết mặt hàng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                color: #333;
                margin: 0;
                padding: 20px;
            }
            .container {
                max-width: 800px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                color: #4CAF50;
            }
            .item-details {
                margin-top: 20px;
                font-size: 18px;
            }
            .item-details p {
                margin: 5px 0;
            }
            .back-button {
                display: block;
                margin: 20px auto;
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                text-align: center;
                border-radius: 4px;
                text-decoration: none;
                font-size: 16px;
            }
            .back-button:hover {
                background-color: #45a049;
            }
            .error-message {
                color: red;
                font-weight: bold;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Thông tin chi tiết mặt hàng</h1>
            <%
                // Lấy mặt hàng từ session
                Mathang072 mathang072 = (Mathang072) session.getAttribute("chitietMH");
                
                if (mathang072 != null) {
            %>
            <div class="item-details">
                <p><strong>Mã mặt hàng:</strong> <%= mathang072.getId() %></p>
                <p><strong>Tên mặt hàng:</strong> <%= mathang072.getName() %></p>
                <p><strong>Giá bán:</strong> <%= new java.text.DecimalFormat("#,###.##").format(mathang072.getPrice()) %> VNĐ</p>
                <p><strong>Mô tả:</strong> <%= mathang072.getNote() != null ? mathang072.getNote() : "" %></p>
            </div>
            <%
                } else {
            %>
            <h4 class="error-message">Không tìm thấy thông tin mặt hàng.</h4>
            <%
                }
            %>
            <!-- Nút quay lại -->
            <a href="gdTimMH072.jsp" class="back-button">Quay lại trang tìm mặt hàng</a>
        </div>
    </body>
</html>


