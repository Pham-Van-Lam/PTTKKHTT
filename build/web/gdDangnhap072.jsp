<%-- 
    Document   : gdDangnhap
    Created on : Oct 21, 2024, 12:58:58 AM
    Author     : LamPham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
    <style>
        /* Đặt lại CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        h4 {
            text-align: center;
            color: red;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            margin: 0 auto;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error-message {
            text-align: center;
            color: red;
            margin-bottom: 10px;
        }
        
    </style>
</head>
<body>

    <div class="login-container">
        <%
            if (request.getParameter("err") != null
                    && request.getParameter("err").equalsIgnoreCase("timeout")) {
        %>
            <h4 class="error-message">Hết phiên làm việc. Làm ơn đăng nhập lại!</h4>
        <%
            } else if (request.getParameter("err") != null
                    && request.getParameter("err").equalsIgnoreCase("fail")) {
        %>
            <h4 class="error-message">Sai tên đăng nhập/mật khẩu!</h4>
        <%
            }
        %>

        <h2>Đăng Nhập</h2>
        <form name="dangnhap" action="doDangnhap072.jsp" method="post">
            <table border="0">
                <tr>
                    <td><input type="text" name="username" id="username" placeholder="Tên đăng nhập" required /></td>
                </tr>
                <tr>
                    <td><input type="password" name="password" id="password" placeholder="Mật khẩu" required /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Đăng nhập" /></td>
                </tr>
            </table>
        </form>
    </div>

</body>
</html>
