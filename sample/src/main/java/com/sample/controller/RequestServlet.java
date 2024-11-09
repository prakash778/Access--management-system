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

@WebServlet("/requestAccess")
public class RequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");
        String softwareIdStr = request.getParameter("softwareId");
        String accessType = request.getParameter("accessType");
        String reason = request.getParameter("reason");

        if (userIdStr == null || softwareIdStr == null || userIdStr.isEmpty() || softwareIdStr.isEmpty()) {
            response.sendRedirect("requestAccess.jsp?error=missingFields");
            return;
        }

        try {
            int userId = Integer.parseInt(userIdStr);
            int softwareId = Integer.parseInt(softwareIdStr);

            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/useraccess", "root", "Sprak@sh01")) {
                String query = "INSERT INTO requests (user_id, software_id, access_type, reason, status) VALUES (?, ?, ?, ?, 'Pending')";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, userId);
                preparedStatement.setInt(2, softwareId);
                preparedStatement.setString(3, accessType);
                preparedStatement.setString(4, reason);
                int rowsInserted = preparedStatement.executeUpdate();

                if (rowsInserted > 0) {
                    response.sendRedirect("requestAccess.jsp?success=requestSubmitted");
                } else {
                    response.sendRedirect("requestAccess.jsp?error=requestFailed");
                }
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("requestAccess.jsp?error=invalidInput");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("requestAccess.jsp?error=serverError");
        }
    }
}

