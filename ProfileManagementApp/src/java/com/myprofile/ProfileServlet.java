package com.myprofile;

import com.myprofile.model.ProfileBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;


public class ProfileServlet extends HttpServlet {

    private static final String DB_URL =
            "jdbc:derby://localhost:1527/student_profile";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("intro");

        ProfileBean profile = new ProfileBean();
        profile.setName(name);
        profile.setStudentId(studentId);
        profile.setProgram(program);
        profile.setEmail(email);
        profile.setHobbies(hobbies);
        profile.setIntro(intro);

        String sql = "INSERT INTO profile "
                   + "(name, student_id, program, email, hobbies, intro) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            try (Connection conn = DriverManager.getConnection(
                    DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                ps.setString(1, profile.getName());
                ps.setString(2, profile.getStudentId());
                ps.setString(3, profile.getProgram());
                ps.setString(4, profile.getEmail());
                ps.setString(5, profile.getHobbies());
                ps.setString(6, profile.getIntro());

                ps.executeUpdate();
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("Database insert error", e);
        }

        request.setAttribute("profile", profile);

        RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
        rd.forward(request, response);
    }
}
