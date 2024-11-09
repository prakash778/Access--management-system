<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Software</title>
<%@ include file="components/allcss.jsp" %>
</head>
<body style="background-color:#f7f7f7">
<%@ include file="components/navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3 py-4">
            <div class="card">
                <div class="card-body">
                    <div class="mb-3 text-center fs-3">Create Software Application</div>

                    <!-- Form for creating software -->
                    <form action="createSoftware" method="post">
                        <div class="mb-3 form-group">
                            <label for="softwareName" class="form-label">Software Name*</label>
                            <input type="text" class="form-control" id="softwareName" name="softwareName" required>
                        </div>

                        <div class="mb-3 form-group">
                            <label for="description" class="form-label">Description*</label>
                            <textarea class="form-control" id="description" name="description" required></textarea>
                        </div>

                        <div class="mb-3 form-group">
                            <label for="accessLevel" class="form-label">Access Level*</label>
                            <select class="form-control" id="accessLevel" name="accessLevel" required>
                                <option value="Read">Read</option>
                                <option value="Write">Write</option>
                                <option value="Admin">Admin</option>
                            </select>
                        </div>

                        <div class="mb-3 text-center">
                            <button class="btn btn-primary" type="submit">Create Software</button>
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
