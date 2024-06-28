<%--
  Created by IntelliJ IDEA.
  User: PROSPER
  Date: 1/23/2024
  Time: 10:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SRMS | Landing Page</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/libs/animate.min.css">
    <script src="<%=request.getContextPath()%>/resources/js/jQuery.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css">

</head>
<body>

<header class="header">
    <nav class="d-flex justify-content-between">
        <a href="<%= request.getContextPath() %>/" class="logo">
            <img src="<%= request.getContextPath() %>/resources/SRMS%20Logo.png" alt="Logo">
            <span>SRMS</span>
        </a>
        <ul class="d-flex">
            <li><a href="<%= request.getContextPath() %>/">Home</a></li>
            <li><a href="#">About Us</a></li>
            <li><a href="<%=request.getContextPath()%>/get-report">Student Reports</a></li>
            <li><a href="#">Contact us</a></li>
        </ul>
    </nav>
</header>

<main style="background-image: url("<%=request.getContextPath()%>/resources/books.jpg")">
    <div class="main-cont">
        <div class="content">
            <div class="left">
                <div class="left_title">
                    <h1>A Journey to success</h1>
                    <span>for Your school</span>
                </div>
                <div class="left_action">
                    <a href="<%=request.getContextPath()%>/login" class="btn btn-success rounded-5">Get Started</a>
<%--                    <button class="btn btn-success rounded-5">Get Started</button>--%>
                </div>
            </div>
        </div>
    </div>
</main>



<script src="<%=request.getContextPath()%>/resources/js/jQuery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap/bootstrap.bundle.js"></script>
</body>
</html>