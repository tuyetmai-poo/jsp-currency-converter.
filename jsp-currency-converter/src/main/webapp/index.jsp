<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chuyển Đổi Tiền Tệ - USD sang VNĐ</title>
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
            max-width: 440px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h2 {
            font-size: 1.8rem;
            font-weight: 700;
            background: linear-gradient(to right, #38bdf8, #818cf8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 8px;
        }
        .header p {
            color: #94a3b8;
            font-size: 0.95rem;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #cbd5e1;
            font-size: 0.9rem;
        }
        .form-group input {
            width: 100%;
            padding: 14px 16px;
            background: rgba(15, 23, 42, 0.6);
            border: 1px solid #334155;
            border-radius: 12px;
            color: #ffffff;
            font-size: 1rem;
            outline: none;
            transition: all 0.3s ease;
        }
        .form-group input:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.2);
        }
        .btn-submit {
            width: 100%;
            padding: 14px;
            margin-top: 10px;
            background: linear-gradient(135deg, #4f46e5 0%, #6366f1 100%);
            color: #ffffff;
            border: none;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px -10px rgba(99, 102, 241, 0.5);
        }
        .btn-submit:active {
            transform: translateY(0);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Chuyển Đổi Tiền Tệ</h2>
            <p>Nhập tỉ giá và số tiền USD để quy đổi sang VNĐ</p>
        </div>
        <form action="converter.jsp" method="POST">
            <div class="form-group">
                <label for="rate">Tỉ giá (VNĐ / 1 USD):</label>
                <input type="number" id="rate" name="rate" step="any" placeholder="Ví dụ: 25400" required>
            </div>
            <div class="form-group">
                <label for="usd">Số lượng USD ($):</label>
                <input type="number" id="usd" name="usd" step="any" placeholder="Ví dụ: 100" required>
            </div>
            <button type="submit" class="btn-submit">Chuyển Đổi Ngay</button>
        </form>
    </div>
</body>
</html>
