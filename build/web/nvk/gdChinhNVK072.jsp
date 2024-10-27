<%-- 
    Document   : gdChinhNVK072
    Created on : Oct 21, 2024, 12:56:59 AM
    Author     : LamPham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8" import="java.util.ArrayList, java.util.List, dao.Mathang072DAO, model.*"%>
<!DOCTYPE html>
<%
    Thanhvien072 nvk = (Thanhvien072) session.getAttribute("nvkho");
    if (nvk == null) {
        response.sendRedirect("gdDangnhap072.jsp");
        return;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                color: #333;
                margin: 0;
                padding: 20px;
                text-align: center; /* Centering title */
            }
            h1 {
                color: #4CAF50;
                margin-bottom: 20px;
            }
            .container {
                max-width: 800px; /* Max width for container */
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: left; /* Left align text within container */
            }
            .greeting {
                display: flex;
                justify-content: flex-end; /* Align greeting to the right */
                align-items: center; /* Center items vertically */
                margin-bottom: 20px;
            }
            .links {
                display: flex;
                justify-content: center; /* Center buttons horizontally */
                flex-direction: column; /* Stack links vertically */
                align-items: center; /* Center align links */
            }
            .link-button {
                background-color: #4CAF50; /* Button color */
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                text-decoration: none; /* Remove underline */
                margin: 5px 0; /* Space between links */
                transition: background-color 0.3s; /* Smooth transition */
                cursor: pointer; /* Pointer cursor */
                width: 45%; /* Half of the container's width */
                text-align: center; /* Center text in buttons */
            }
            .link-button:hover {
                background-color: #45a049; /* Darker shade on hover */
            }
            .logout {
                margin-left: 10px; /* Space between greeting and logout link */
                color: #4CAF50; /* Same color as buttons */
                text-decoration: none; /* Remove underline */
                font-weight: bold; /* Make the logout link bold */
            }
            .logout:hover {
                text-decoration: underline; /* Underline on hover */
            }
        </style>
    </head>
    <body>
        <h1>Trang quản lý của nhân viên kho</h1>
        <div class="greeting">
            <h2>
                Xin chào: <%= nvk.getName() %> - MNV: <%= nvk.getId() %> 
                <a href="gdDangnhap072.jsp" class="logout">Đăng xuất</a> <!-- Logout link -->
            </h2>
        </div>
        <div class="container">
            <div class="links">
                <a href="gdChinhNVK072.jsp" class="link-button">Nhập hàng</a>
                <a href="gdDuyetDon072.jsp" class="link-button">Duyệt đơn</a>
            </div>
        </div>
    </body>
</html>


