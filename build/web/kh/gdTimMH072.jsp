<%-- 
    Document   : gdTimMH072
    Created on : Oct 21, 2024, 12:56:03 AM
    Author     : LamPham
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.ArrayList,java.util.List,java.text.DecimalFormat,dao.*,model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cửa hàng điện máy</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                color: #333;
                margin: 0;
                padding: 20px;
            }
            h1 {
                text-align: center;
                color: #4CAF50;
            }
            .container {
                max-width: 800px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            form {
                margin-bottom: 20px;
                display: flex;
                align-items: center;
                gap: 10px;
            }
            input[type="text"] {
                flex-grow: 1;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
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
            tr:hover {
                background-color: #f2f2f2;
            }
            tr {
                cursor: pointer;
            }
            .error-message {
                color: red;
                font-weight: bold;
                text-align: center;
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
        </style>
        <script type="text/javascript">
            function redirectToDetails(id) {
                window.location.href = 'doTimMH072.jsp?action=chitietMH&id=' + id;
            }
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Tìm mặt hàng</h1>
            <div>
                <form name="timmathang" action="doTimMH072.jsp" accept-charset="UTF-8">
                    <input type="text" name="tenMH" id="tenMH" placeholder="Nhập tên mặt hàng cần tìm kiếm tại đây..." required />
                    <input type="submit" value="Tìm" />
                </form>
            </div>

            <%
                // Tạo đối tượng DecimalFormat để định dạng giá
                DecimalFormat decimalFormat = new DecimalFormat("#,###.##");

                List<Mathang072> mathangs = (ArrayList<Mathang072>) session.getAttribute("dsMH");
                if (request.getParameter("dsMH") != null && (mathangs == null || mathangs.isEmpty())) {
            %>
            <h4 class="error-message">Không tìm thấy mặt hàng vui lòng nhập lại!</h4>
            <%
            } else if (mathangs != null && !mathangs.isEmpty()) {
                String tenMH = request.getParameter("tenMH");
            %>
            <h2>Danh sách mặt hàng cho từ khóa: <%= tenMH == null ? "" : tenMH%> (Tìm thấy <%= mathangs.size()%> sản phẩm)</h2>
            <table>
                <thead>
                    <tr>
                        <th>Mã mặt hàng</th>
                        <th>Tên mặt hàng</th>
                        <th>Giá bán(VNĐ)</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Mathang072 mh : mathangs) {
                            // Định dạng giá thành chuỗi
                            String formattedPrice = decimalFormat.format(mh.getPrice());
                    %>
                    <tr onclick="redirectToDetails('<%= mh.getId()%>')">
                        <td><%= mh.getId()%></td>
                        <td><%= mh.getName()%></td>
                        <td><%= formattedPrice%> VND</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                }
            %>

            <!-- Nút quay lại -->
            <a href="doTimMH072.jsp?action=trangchu" class="back-button">Quay lại trang chính</a>
        </div>
    </body>
</html>



