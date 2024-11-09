<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Requests</title>
    <!-- Bootstrap CSS -->
    <%@include file="components/allcss.jsp"%>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#f7f7f7">
<%@include file="components/navbar.jsp" %>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h3 class="text-center mb-4">Pending Access Requests</h3>

                    <% 
                        // Check if the manager is logged in
                        if (session.getAttribute("role") == null || !session.getAttribute("role").equals("Manager")) {
                            response.sendRedirect("login.jsp");
                            return;
                        }

                        Connection conn = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;

                        try {
                            // Establishing a direct connection
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/useraccess", "root", "Sprak@sh01");

                            // Query to get pending requests
                            String sql = "SELECT r.id, u.username AS employee_name, s.name AS software_name, r.access_type, r.reason " +
                                         "FROM requests r " +
                                         "JOIN users u ON r.user_id = u.id " +
                                         "JOIN software s ON r.software_id = s.id " +
                                         "WHERE r.status = 'Pending'";
                            ps = conn.prepareStatement(sql);
                            rs = ps.executeQuery();
                    %>

                    <table class="table table-bordered table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th>Employee Name</th>
                                <th>Software Name</th>
                                <th>Access Type</th>
                                <th>Reason for Request</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                while (rs.next()) {
                            %>
                            <tr>
                                <td><%= rs.getString("employee_name") %></td>
                                <td><%= rs.getString("software_name") %></td>
                                <td><%= rs.getString("access_type") %></td>
                                <td><%= rs.getString("reason") %></td>
                                <td>
                                    <form action="ApprovalServlet" method="post" class="d-inline">
                                        <input type="hidden" name="requestId" value="<%= rs.getInt("id") %>">
                                        <button type="submit" name="action" value="approve" class="btn btn-success btn-sm">Approve</button>
                                    </form>
                                    <form action="ApprovalServlet" method="post" class="d-inline">
                                        <input type="hidden" name="requestId" value="<%= rs.getInt("id") %>">
                                        <button type="submit" name="action" value="reject" class="btn btn-danger btn-sm">Reject</button>
                                    </form>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>

                    <% 
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (rs != null) rs.close();
                            if (ps != null) ps.close();
                            if (conn != null) conn.close();
                        }
                    %>

                </div>
            </div>
        </div>
    </div>
</div>



<%@include file="components/footer.jsp" %>
</body>
</html>
