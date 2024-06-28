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
    <title>SRMS | Login Page</title>
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


<section id="login">
    <div class="login w-25">
        <div class="card">
            <div class="card-header">
                <h1 class="card-title">Login</h1>
            </div>
            <form action="<%=request.getContextPath()%>/login/user" method="post">
                <div class="card-body">
                    <div class="form-group">
                        <label for="user" class="form-label">User Name</label>
                        <input type="text" name="user" id="user" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" name="password" id="password" class="form-control">
                    </div>
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn-success">Submit</button>
                </div>
            </form>
        </div>
    </div>
</section>


<script src="<%=request.getContextPath()%>/resources/js/jQuery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap/bootstrap.bundle.js"></script>
</body>
</html>