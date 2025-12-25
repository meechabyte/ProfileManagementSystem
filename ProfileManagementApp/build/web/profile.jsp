<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Profile</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="nav-links">
    <a href="index.html">Home</a> | 
    <a href="viewProfiles.jsp">View All Profiles</a> | 
    <a href="searchProfile.jsp">Search Profiles</a>
</div>
<br>

<div class="card">
    <h1>${profile.name}'s Profile</h1>

    <div class="info">
        <p><strong>Student ID:</strong> ${profile.studentId}</p>
        <p><strong>Program:</strong> ${profile.program}</p>
        <p><strong>Email:</strong> ${profile.email}</p>
        <p><strong>Hobbies:</strong> ${profile.hobbies}</p>
    </div>

    <div class="intro">
        <h3>About Me</h3>
        <p>${profile.intro}</p>
    </div>
</div>
</body>
</html>
