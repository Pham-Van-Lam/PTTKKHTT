<%-- 
    Document   : gdHoaDon072
    Created on : Oct 21, 2024, 12:58:05 AM
    Author     : LamPham
--%>

<%@ page import="java.time.Instant" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8" import="java.util.ArrayList, java.util.List,java.net.URLEncoder, java.text.DecimalFormat, dao.*, model.*"%>

<%
    Thanhvien072 nvk = (Thanhvien072) session.getAttribute("nvkho");
    if (nvk == null) {
        response.sendRedirect("gdDangnhap072.jsp");
        return;
    }

    Hoadon072 hoadon072 = new Hoadon072();
    hoadon072.setId((int)(System.currentTimeMillis()/10000));
    NVkho072 nVkho072 = new NVkho072();
    nVkho072.setId(nvk.getId());

    Donhang072 donhang = (Donhang072) session.getAttribute("donhang");
    NVgiaohang072 nvgh = (NVgiaohang072) session.getAttribute("nvgh");

    if (donhang != null) {
        hoadon072.setDonhang072(donhang);
        hoadon072.setnVgiaohang072(nvgh);
        hoadon072.setnVkho072(nVkho072);
        hoadon072.setTotal(donhang.getTotal());
        hoadon072.setDate(new java.sql.Date(System.currentTimeMillis()));

        session.setAttribute("hoadon", hoadon072);
    }

    Khachhang072 khachhang = donhang != null ? donhang.getKhachhang072() : null;
    ArrayList<Mathangmua072> mathangmua072s = donhang != null ? (ArrayList<Mathangmua072>) donhang.getMathangmua072s() : new ArrayList<>();
    DecimalFormat currencyFormat = new DecimalFormat("#,###");

    // Format the date
    SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm dd-MM-yyyy");
    String formattedDate = hoadon072.getDate() != null ? dateFormat.format(hoadon072.getDate()) : "";

    String meg = request.getParameter("meg") == null ? "" : java.net.URLDecoder.decode(request.getParameter("meg"), "UTF-8");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hóa đơn</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f9;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .header-info {
            text-align: center;
            margin-bottom: 20px;
            color: #555;
        }
        .invoice-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .customer-info, .order-info {
            margin-bottom: 20px;
            color: #555;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        .items-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .items-table th, .items-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        .items-table th {
            background-color: #0073e6;
            color: white;
        }
        .total {
            text-align: right;
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
        }
        .signature {
            text-align: center;
            margin-top: 40px;
            padding: 20px;
            border-top: 1px dashed #ddd;
            font-style: italic;
            color: #555;
        }
        .action-buttons {
            text-align: center;
            margin-top: 40px;
        }
        .action-buttons button {
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .action-buttons .back {
            background-color: #0073e6;
        }
        .action-buttons .approve {
            background-color: #28a745;
        }
        .action-buttons .create {
            background-color: #ffc107;
        }
        .action-buttons button:hover {
            opacity: 0.8; /* Slightly dim buttons on hover */
        }
        
        .meg {
            color: red;
        }
        
        @media print {
            .meg, .action-buttons {
                display: none; /* Hide action buttons when printing */
            }
        }
    </style>
</head>
<body>
    <div>
        <h2 class="meg"><%= meg %></h2>
        <%
            if ("Tạo hóa đơn thành công".equals(meg)) { 
        %>
        <script>
            window.onload = function () {
                window.print(); 
            };
        </script>
        <%
            }
        %>
    </div>
    <div class="invoice-container">
        <div class="header-info">
            <h2>Cửa hàng điện máy xanh</h2>
            <p>15-Phan Đình Giót-Thanh Xuân-Hà Nội</p>
            <p>Số điện thoại: 0223456789</p>
        </div>
        <h1>Hóa đơn bán hàng</h1>
        <div class="customer-info">
            <strong>Mã hóa đơn:</strong> <%= hoadon072.getId() == 0 ? "" : hoadon072.getId() %>
        </div>
        <!-- Customer Information -->
        <div class="customer-info">
            <p><strong>Tên khách hàng:</strong> <%= khachhang != null ? khachhang.getName() : "N/A" %></p>
            <p><strong>Địa chỉ:</strong> <%= khachhang != null ? khachhang.getAddress() : "N/A" %></p>
            <p><strong>Số điện thoại:</strong> <%= khachhang != null ? khachhang.getNumber() : "N/A" %></p>
        </div>

        <!-- Order Information -->
        <div class="order-info">
            <p><strong>Mã đơn hàng:</strong> <%= donhang != null ? donhang.getId() : "N/A" %></p>
            <p><strong>Nhân viên giao hàng:</strong> <%= nvgh != null ? nvgh.getName() : "N/A" %></p>
            <p><strong>Ngày tạo đơn hàng:</strong> <%= donhang != null ? new SimpleDateFormat("dd-MM-yyyy").format(donhang.getDate()) : "N/A" %></p>
            <p><strong>Ngày tạo hóa đơn:</strong> <%= formattedDate %></p>
        </div>

        <!-- Item Table -->
        <h2>Danh sách mặt hàng</h2>
        <table class="items-table">
            <thead>
                <tr>
                    <th>Mã hàng</th>
                    <th>Tên hàng</th>
                    <th>Số lượng</th>
                    <th>Đơn giá (VNĐ)</th>
                    <th>Thành tiền (VNĐ)</th>
                </tr>
            </thead>
            <tbody>
                <% for (Mathangmua072 mathang : mathangmua072s) { %>
                <tr>
                    <td><%= mathang.getMathang072().getId() %></td>
                    <td><%= mathang.getMathang072().getName() %></td>
                    <td><%= mathang.getSoLuong() %></td>
                    <td><%= currencyFormat.format(mathang.getPrice()) %></td>
                    <td><%= currencyFormat.format(mathang.getSoLuong() * mathang.getPrice()) %></td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <!-- Total -->
        <div class="total">
            <p>Tổng tiền phải thanh toán: <%= currencyFormat.format(hoadon072.getTotal()) %> VNĐ</p>
        </div>
        <div class="signature" style="margin-bottom: 50px;">
            <p>Người tạo hóa đơn: <%= nvk.getName() %> - MNV: <%= nvk.getId() %></p>
            <p>(Ký tên)</p>
        </div>
    </div>
    <!-- Buttons for actions -->
    <div class="action-buttons">
        <button class="back" onclick="location.href='gdChonNVGH072.jsp'">Quay lại</button>
        <button class="approve" onclick="location.href='gdDuyetDon072.jsp'">Duyệt đơn</button>
        <button class="create" onclick="location.href='doHoaDon072.jsp?action=add'">Tạo hóa đơn</button>
    </div>
</body>
</html>
