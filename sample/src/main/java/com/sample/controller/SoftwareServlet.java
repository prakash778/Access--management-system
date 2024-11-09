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

@WebServlet("/createSoftware")
public class SoftwareServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String softwareName = request.getParameter("softwareName");
        String description = request.getParameter("description");
        String accessLevel = request.getParameter("accessLevel");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/useraccess", "root", "Sprak@sh01")) {
                String query = "INSERT INTO software (name, description, access_level) VALUES (?, ?, ?)";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, softwareName);
                preparedStatement.setString(2, description);
                preparedStatement.setString(3, accessLevel);
                int rowsInserted = preparedStatement.executeUpdate();

                if (rowsInserted > 0) {
                    response.sendRedirect("createSoftware.jsp?success=softwareCreated");
                } else {
                    response.sendRedirect("createSoftware.jsp?error=softwareCreationFailed");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
