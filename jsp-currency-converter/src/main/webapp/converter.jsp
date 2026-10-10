<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết Quả Chuyển Đổi</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #312e81 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            color: #f8fafc;
        }
        .container {
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 460px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
        }
        .header {
            text-align: center;
            margin-bottom: 25px;
        }
        .header h2 {
            font-size: 1.8rem;
            font-weight: 700;
            background: linear-gradient(to right, #38bdf8, #818cf8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .result-card {
            background: rgba(15, 23, 42, 0.6);
            border: 1px solid #334155;
            border-radius: 16px;
            padding: 24px;
            margin-bottom: 25px;
        }
        .result-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px dashed #334155;
        }
        .result-item:last-child {
            border-bottom: none;
        }
        .label {
            color: #94a3b8;
            font-size: 0.95rem;
        }
        .value {
            font-weight: 600;
            color: #f8fafc;
            font-size: 1.05rem;
        }
        .total-item {
            background: rgba(99, 102, 241, 0.15);
            margin-top: 15px;
            padding: 16px;
            border-radius: 12px;
            border: 1px solid rgba(99, 102, 241, 0.3);
            text-align: center;
        }
        .total-item .label {
            color: #cbd5e1;
            font-size: 0.9rem;
            display: block;
            margin-bottom: 6px;
        }
        .total-item .total-value {
            font-size: 1.8rem;
            font-weight: 800;
            color: #4ade80;
        }
        .btn-back {
            display: block;
            width: 100%;
            text-align: center;
            padding: 14px;
            background: rgba(255, 255, 255, 0.08);
            color: #f8fafc;
            text-decoration: none;
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.2s ease;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .btn-back:hover {
            background: rgba(255, 255, 255, 0.15);
            transform: translateY(-2px);
        }
        .error-box {
            background: rgba(239, 68, 68, 0.15);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #fca5a5;
            padding: 16px;
            border-radius: 12px;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Kết Quả Quy Đổi</h2>
        </div>

        <%-- Sử dụng JSP Scriptlet <% %> để xử lý nhận dữ liệu và tính toán --%>
        <%
            String rateStr = request.getParameter("rate");
            String usdStr = request.getParameter("usd");
            
            double rate = 0;
            double usd = 0;
            double vnd = 0;
            boolean isValid = true;
            String errorMessage = "";

            try {
                if (rateStr != null && usdStr != null) {
                    rate = Double.parseDouble(rateStr);
                    usd = Double.parseDouble(usdStr);
                    if (rate < 0 || usd < 0) {
                        isValid = false;
                        errorMessage = "Tỉ giá và số tiền phải lớn hơn hoặc bằng 0!";
                    } else {
                        vnd = rate * usd;
                    }
                } else {
                    isValid = false;
                    errorMessage = "Vui lòng nhập đầy đủ thông tin!";
                }
            } catch (NumberFormatException e) {
                isValid = false;
                errorMessage = "Dữ liệu nhập vào không hợp lệ!";
            }

            DecimalFormat formatter = new DecimalFormat("#,##0.##");
        %>

        <%-- Hiển thị kết quả bằng Expression <%= %> --%>
        <% if (isValid) { %>
            <div class="result-card">
                <div class="result-item">
                    <span class="label">Tỉ giá áp dụng:</span>
                    <span class="value"><%= formatter.format(rate) %> VNĐ / USD</span>
                </div>
                <div class="result-item">
                    <span class="label">Số lượng USD:</span>
                    <span class="value">$<%= formatter.format(usd) %></span>
                </div>
                <div class="total-item">
                    <span class="label">Thành tiền VNĐ</span>
                    <div class="total-value"><%= formatter.format(vnd) %> VNĐ</div>
                </div>
            </div>
        <% } else { %>
            <div class="error-box">
                <%= errorMessage %>
            </div>
        <% } %>

        <a href="index.jsp" class="btn-back">← Thực hiện phép tính khác</a>
    </div>
</body>
</html>
