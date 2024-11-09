package com.sample.controller;

import java.io.*; 
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/register")  // Add this annotation to map the servlet to /register
public class SignUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");  // Get the role from the registration form
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Register the driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Error loading JDBC driver: " + e.getMessage());
            return;
        }


        // Database connection parameters
        String dbURL = "jdbc:mysql://localhost:3306/useraccess";  // Database URL
        String dbUsername = "root";                               // Database username
        String dbPassword = "Sprak@sh01";                          // Database password

        // Establish connection to the database
        try (Connection con = DriverManager.getConnection(dbURL, dbUsername, dbPassword)) {
            
            // Check if the username already exists in the database
            String checkQuery = "SELECT COUNT(*) FROM users WHERE username = ?";
            try (PreparedStatement checkPs = con.prepareStatement(checkQuery)) {
                checkPs.setString(1, username);
                try (ResultSet rs = checkPs.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        // Username exists, redirect back to registration page with an error
                        response.sendRedirect("register.jsp?error=username_exists");
                        return;
                    }
                }
            }

            // Insert new user data into the database with the selected role
            String query = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setString(1, username);
                ps.setString(2, password);  // Remember to hash the password in a real-world app
                ps.setString(3, role);      // Set the role in the database
                ps.executeUpdate();
            }

            // Redirect to login page after successful registration
            response.sendRedirect("login.jsp?registered=true");

        } catch (SQLException e) {
            e.printStackTrace();
            // Send a generic error message to the user
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
