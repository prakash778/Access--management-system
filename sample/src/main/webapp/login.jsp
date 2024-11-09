<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<%@include file="components/allcss.jsp"%>
</head>
<body style="background-color:#f7f7f7">
<%@include file="components/navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4 py-4">
            <div class="card">
                <div class="card-body">
                    <form action="login" method="post">
                        <div class="mb-3 text-center fs-3">Login Page</div>
                        
                        <div class="mb-3 form-group">
                            <label for="username" class="form-label">Username*</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        
                        <div class="mb-3 form-group">
                            <label for="password" class="form-label">Password*</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        
                        <div class="mb-3 text-center">
                            <button class="btn btn-primary" type="submit">Login</button>
                        </div>
                        
                        <div class="mb-3 text-center">
                            <a href="register.jsp">New User? Register Here</a>
                        </div>
                    </form>

                    <!-- Display error message if login fails -->
                    <% 
                        String error = request.getParameter("error");
                        if (error != null && error.equals("invalid_credentials")) { 
                    %>
                        <p style="color: red;">Invalid username or password. Please try again.</p>
                    <% 
                        } 
                    %>

                </div>
            </div>
        </div>
    </div>
</div>
<br>
<br>
<br>
<br>
<br><br>
<%@include file="components/footer.jsp" %>
</body>
</html>
