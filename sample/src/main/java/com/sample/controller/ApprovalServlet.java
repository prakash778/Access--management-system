package com.sample.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ApprovalServlet")
public class ApprovalServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestId = request.getParameter("requestId");
        String action = request.getParameter("action");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            
            String dbUrl = "jdbc:mysql://localhost:3306/useraccess";
            String dbUsername = "root";
            String dbPassword = "Sprak@sh01";
            
            // Establish connection
            conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
            
            // Check if requestId and action are valid
            if (requestId == null || action == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request parameters");
                return;
            }
            
            // Determine the status based on the action
            String status = "Pending";
            if ("approve".equals(action)) {
                status = "Approved";
            } else if ("reject".equals(action)) {
                status = "Rejected";
            }

            // Update request status in the database
            String sql = "UPDATE requests SET status = ? WHERE id = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, Integer.parseInt(requestId));
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Redirect back to the pending requests page if update was successful
                response.sendRedirect("pendingRequests.jsp");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update the request");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request");
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
