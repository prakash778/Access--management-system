package com.sample.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/useraccess", "root", "Sprak@sh01")) {
                String query = "SELECT id, role FROM users WHERE username = ? AND password = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                ResultSet resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("userId", resultSet.getInt("id"));
                    session.setAttribute("role", resultSet.getString("role"));
                    String role = resultSet.getString("role");
                    if ("Employee".equals(role)) {
                        response.sendRedirect("requestAccess.jsp");
                    } else if ("Manager".equals(role)) {
                        response.sendRedirect("pendingRequests.jsp");
                    } else if ("Admin".equals(role)) {
                        response.sendRedirect("createSoftware.jsp");
                    }
                } else {
                    response.sendRedirect("login.jsp?error=invalid");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
