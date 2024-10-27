<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8" import="java.util.ArrayList, java.util.List,java.net.URLEncoder, java.text.DecimalFormat, dao.*, model.*"%>
<%
    Thanhvien072 nvk = (Thanhvien072) session.getAttribute("nvkho");
    if (nvk == null) {
        response.sendRedirect("gdDangnhap072.jsp");
        return;
    }

    Donhang072 donhang = (Donhang072) session.getAttribute("donhang");
    DecimalFormat currencyFormat = new DecimalFormat("#,### VND");
    NVgiaohang072DAO nVgiaohang072DAO = new NVgiaohang072DAO();
    ArrayList<NVgiaohang072> nVgiaohang072s = (ArrayList<NVgiaohang072>) nVgiaohang072DAO.getDSNVGH();

    String action = request.getParameter("nvghId");
    NVgiaohang072 nVgiaohang072 = null;
    if (action != null) {
        try {
            int nvghId = Integer.parseInt(action);
            nVgiaohang072 = nVgiaohang072s.stream()
                    .filter(nv -> nv.getId() == nvghId)
                    .findFirst()
                    .orElse(null);
            session.setAttribute("nvgh", nVgiaohang072);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    nVgiaohang072 = (NVgiaohang072) session.getAttribute("nvgh");

    String msg = request.getParameter("msg") != null ? java.net.URLDecoder.decode(request.getParameter("msg"), "UTF-8") : "";

    String xuatkhohang = request.getParameter("xuatkhohang");
    if (xuatkhohang !=  null && xuatkhohang.equals("xuatkho")) {
        if (donhang != null && donhang.getStatus().equals("hoan thanh") && nVgiaohang072 != null) {
            response.sendRedirect("gdHoaDon072.jsp");
            return;
        } else {
            String errorMessage = URLEncoder.encode("Error: Trạng thái đơn hàng không phải là hoàn thành", "UTF-8");
            response.sendRedirect("gdChonNVGH072.jsp?msg=" + errorMessage);
            return;
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chọn Nhân Viên Giao Hàng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f4f4f9;
                color: #333;
            }
            .container {
                max-width: 1000px;
                margin: auto;
                padding: 20px;
                background: white;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .header {
                text-align: center;
                margin-bottom: 20px;
            }
            .logged-in-user, .order-info, .message {
                text-align: center;
                margin-bottom: 10px;
            }
            .logged-in-user span {
                font-weight: bold;
                color: #0066cc;
            }
            .message p {
                color: green;
                font-weight: bold;
            }
            .message.error p {
                color: red;
            }
            .table-container {
                margin-top: 20px;
                overflow-x: auto;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 12px;
                text-align: center;
            }
            th {
                background-color: #0073e6;
                color: white;
            }
            .button {
                padding: 10px 20px;
                margin: 10px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                color: white;
                font-weight: bold;
                transition: background-color 0.3s;
            }
            .select-button {
                background-color: #4CAF50;
            }
            .select-button:hover {
                background-color: #45a049;
            }
            .nav-button {
                background-color: #ff6666;
            }
            .nav-button:hover {
                background-color: #e65c5c;
            }
            .status-container {
                text-align: center;
                padding: 20px;
                border: 1px solid #0073e6;
                border-radius: 8px;
                background-color: #e6f3ff;
                margin-top: 20px;
            }
            .status-container select {
                width: 60%;
                padding: 10px;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>Chọn Nhân Viên Giao Hàng và Cập Nhật Trạng Thái Đơn Hàng</h1>
            </div>

            <div class="logged-in-user">
                Nhân viên đăng nhập: <span><%= nvk.getName()%>, MNV: <%= nvk.getId()%></span>
            </div>

            <div class="order-info">
                <h3>Mã đơn hàng: <%= donhang.getId()%></h3>
            </div>

            <div class="message"><p><%= msg%></p></div>

            <div class="table-container">
                <h2>Danh Sách Nhân Viên Giao Hàng</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Mã NVGH</th>
                            <th>Tên NVGH</th>
                            <th>Số điện thoại</th>
                            <th>Chọn</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (NVgiaohang072 nvgh : nVgiaohang072s) {%>
                        <tr>
                            <td><%= nvgh.getId()%></td>
                            <td><%= nvgh.getName()%></td>
                            <td><%= nvgh.getNumber()%></td>
                            <td>
                                <form action="gdChonNVGH072.jsp" method="post">
                                    <input type="hidden" name="donhangId" value="<%= donhang.getId()%>">
                                    <input type="hidden" name="nvghId" value="<%= nvgh.getId()%>">
                                    <button type="submit" class="button select-button">Chọn</button>
                                </form>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>

            <h2>Nhân viên giao hàng: <%= nVgiaohang072 != null ? nVgiaohang072.getName() : "Chưa chọn nhân viên giao hàng"%></h2>

            <div class="status-container">
                <form action="doChonNVGH072.jsp" method="post">
                    <input type="hidden" name="donhangId" value="<%= donhang.getId()%>">
                    <label for="status">Trạng Thái Đơn Hàng</label>
                    <select id="status" name="orderStatus">
                        <option value="chua duyet">Chưa duyệt</option>
                        <option value="da duyet">Duyệt</option>
                        <option value="hoan thanh">Xuất hàng</option>
                        <option value="da huy">Hủy</option>
                    </select>
                    <button type="submit" class="button select-button" style="margin-top: 20px;">Cập Nhật</button>
                </form>
            </div>

            <div style="text-align: center; margin-top: 20px;">
                <button onclick="window.location.href = 'gdDonCD072.jsp';" class="button nav-button">Quay Lại</button>
                <button onclick="window.location.href = 'gdChonNVGH072.jsp?xuatkhohang=xuatkho';" class="button nav-button">Tiếp tục</button>
            </div>
        </div>
    </body>
</html>


