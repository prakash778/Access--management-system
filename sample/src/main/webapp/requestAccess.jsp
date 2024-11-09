<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request Access</title>
<%@ include file="components/allcss.jsp" %>
</head>
<body style="background-color:#f7f7f7">
<%@ include file="components/navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3 py-4">
            <div class="card">
                <div class="card-body">
                    <div class="mb-3 text-center fs-3">Request Software Access</div>

                    <!-- Form for requesting access to software -->
                    <form action="requestAccess" method="post">
                        
                        <!-- Hidden input to pass userId (this should be retrieved dynamically) -->
                        <input type="hidden" name="userId" value="<%= session.getAttribute("userId") %>">

                        <div class="mb-3 form-group">
                            <label for="software" class="form-label">Software*</label>
                            <select class="form-control" id="software" name="softwareId" required>
                                <!-- Dynamically populate software options from the database -->
                                <option value="1">Software 1</option>
                                <option value="2">Software 2</option>
                                <!-- Add more software options dynamically here -->
                            </select>
                        </div>

                        <div class="mb-3 form-group">
                            <label for="accessType" class="form-label">Access Type*</label>
                            <select class="form-control" id="accessType" name="accessType" required>
                                <option value="Read">Read</option>
                                <option value="Write">Write</option>
                                <option value="Admin">Admin</option>
                            </select>
                        </div>

                        <div class="mb-3 form-group">
                            <label for="reason" class="form-label">Reason*</label>
                            <textarea class="form-control" id="reason" name="reason" required></textarea>
                        </div>

                        <div class="mb-3 text-center">
                            <button class="btn btn-primary" type="submit">Submit Request</button>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
</div>
<br><br><br>
<%@ include file="components/footer.jsp" %>
</body>
</html>
