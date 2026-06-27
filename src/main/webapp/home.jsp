<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Welcome</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-gradient: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            --glass-bg: rgba(255, 255, 255, 0.05);
            --glass-border: rgba(255, 255, 255, 0.1);
            --text-main: #f8fafc;
            --text-muted: #94a3b8;
            --accent: #3b82f6;
            --accent-hover: #2563eb;
            --danger: #ef4444;
            --danger-hover: #dc2626;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background: var(--bg-gradient);
            color: var(--text-main);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            position: relative;
        }

        /* Animated background elements */
        .blob {
            position: absolute;
            filter: blur(80px);
            z-index: 0;
            opacity: 0.6;
            animation: float 10s ease-in-out infinite;
        }
        
        .blob-1 {
            width: 300px;
            height: 300px;
            background: rgba(59, 130, 246, 0.4);
            top: -10%;
            left: -10%;
            border-radius: 50%;
        }

        .blob-2 {
            width: 400px;
            height: 400px;
            background: rgba(139, 92, 246, 0.3);
            bottom: -20%;
            right: -10%;
            border-radius: 50%;
            animation-delay: -5s;
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0) scale(1); }
            50% { transform: translate(30px, 30px) scale(1.1); }
        }

        .dashboard-container {
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid var(--glass-border);
            border-radius: 24px;
            padding: 40px;
            width: 100%;
            max-width: 450px;
            z-index: 1;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            animation: slideUp 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards;
            opacity: 0;
            transform: translateY(20px);
            text-align: center;
        }

        @keyframes slideUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .profile-avatar {
            width: 96px;
            height: 96px;
            background: linear-gradient(135deg, var(--accent), #8b5cf6);
            border-radius: 50%;
            margin: 0 auto 24px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 36px;
            font-weight: 600;
            color: white;
            box-shadow: 0 10px 25px -5px rgba(59, 130, 246, 0.5);
        }

        .welcome-text {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 8px;
            letter-spacing: -0.5px;
        }

        .user-email {
            color: var(--text-muted);
            font-size: 15px;
            margin-bottom: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .info-card {
            background: rgba(0, 0, 0, 0.2);
            border-radius: 16px;
            padding: 20px;
            margin-bottom: 32px;
            border: 1px solid var(--glass-border);
            text-align: left;
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
        }

        .info-row:last-child {
            margin-bottom: 0;
        }

        .info-label {
            color: var(--text-muted);
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-weight: 600;
        }

        .info-value {
            font-weight: 400;
            color: var(--text-main);
        }

        .logout-btn {
            display: inline-block;
            width: 100%;
            padding: 14px 24px;
            background: var(--danger);
            color: white;
            text-decoration: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 15px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px -1px rgba(239, 68, 68, 0.2), 0 2px 4px -1px rgba(239, 68, 68, 0.1);
        }

        .logout-btn:hover {
            background: var(--danger-hover);
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(239, 68, 68, 0.3), 0 4px 6px -2px rgba(239, 68, 68, 0.15);
        }
        
        .logout-btn:active {
            transform: translateY(0);
        }
    </style>
</head>
<body>
    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>

    <div class="dashboard-container">
        <div class="profile-avatar">
            <%= user.getName() != null && !user.getName().isEmpty() ? user.getName().substring(0, 1).toUpperCase() : "U" %>
        </div>
        
        <h1 class="welcome-text">Welcome back, <%= user.getName() %>!</h1>
        <div class="user-email">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
            <%= user.getEmail() %>
        </div>

        <div class="info-card">
            <div class="info-row">
                <span class="info-label">Account Status</span>
                <span class="info-value" style="color: #4ade80; display: flex; align-items: center; gap: 6px;">
                    <span style="width: 8px; height: 8px; background: #4ade80; border-radius: 50%; display: inline-block;"></span>
                    Active
                </span>
            </div>
            <div class="info-row">
                <span class="info-label">Access Level</span>
                <span class="info-value">Standard User</span>
            </div>
        </div>

        <a href="logout" class="logout-btn">Sign Out</a>
    </div>
</body>
</html>