<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@include file ="components/allcss.jsp"%>
</head>
<body style ="background-color:#f7f7f7">
<%@include file = "components/navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4 py-4">
            <div class="card">
                <div class="card-body">
                    <div class="mb-3 text-center fs-3">Registration Page</div>
                    
                    <form action="register" method="post">
                        <div class="mb-3 form-group">
                            <label for="username" class="form-label">Username*</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="mb-3 form-group">
                            <label for="password" class="form-label">Password*</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        
                        
                        <div class="mb-3 form-group">
                            <label for="role" class="form-label">Role*</label>
                            <select class="form-control" id="role" name="role" required>
                                <option value="Employee">Employee</option>
                                <option value="Manager">Manager</option>
                                <option value="Admin">Admin</option>
                            </select>
                        </div>
                        
                       
                        <div class="mb-3 text-center">
                            <button class="btn btn-primary" type="submit">Submit</button>
                        </div>
                    </form>
                    
                </div>
                
            </div>
        </div>
    </div>
</div>
<br><br><br>
<%@include file="components/footer.jsp" %>
</body>
</html>