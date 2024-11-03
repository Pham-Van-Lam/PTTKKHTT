<%-- 
    Document   : gdChinhKH072
    Created on : Oct 21, 2024, 12:08:50 AM
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
    }
   
    
%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cửa hàng điện máy</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f7f7f7;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                color: #333;
            }

            .container {
                background-color: #fff;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 100%;
                max-width: 500px;
            }

            h1 {
                margin-bottom: 20px;
                font-size: 26px;
                color: #4CAF50;
            }

            a {
                text-decoration: none;
                display: inline-block;
                margin-top: 10px;
            }

            button {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                margin: 10px 0;
                transition: background-color 0.3s ease;
                width: 100%;
            }

            button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Trang chủ khách hàng</h1>

            <!-- Đăng ký thành viên -->
            <a href="gdChinhKH072.jsp?action=dangky">
                <button>Đăng ký thành viên</button>
            </a>

            <!-- Tìm mặt hàng -->
            <a href="gdChinhKH072.jsp?action=timhang">
                <button>Tìm mặt hàng</button>
            </a>
        </div>
    </body>
</html>

