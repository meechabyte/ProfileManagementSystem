<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Profiles</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    
    <div class="nav-links">
    <a href="index.html">Home</a> | 
    <a href="viewProfiles.jsp">View All Profiles</a> | 
    <a href="searchProfile.jsp">Search Profiles</a>
    </div>
    <br>

    <h1>All Profiles</h1>
    
    <div class="container">
    <div class="table-container">
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Student ID</th>
                <th>Program</th>
                <th>Email</th>
                <th>Hobbies</th>
                <th>Intro</th>
            </tr>

        <%
            String url = "jdbc:derby://localhost:1527/student_profile";
            String user = "app";
            String password = "app";

            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn = DriverManager.getConnection(url, user, password);
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM profile");

                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("student_id") %></td>
                        <td><%= rs.getString("program") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("hobbies") %></td>
                        <td><%= rs.getString("intro") %></td>
                    </tr>
        <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("Database error: " + e.getMessage());
            }
        %>
    </table>
</body>
</html>
