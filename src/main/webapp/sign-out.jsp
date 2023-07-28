<%--
  Created by IntelliJ IDEA.
  User: Korisnik
  Date: 31.1.2023.
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    session.invalidate();
    response.sendRedirect("sign-in.jsp");
%>
<!doctype html>
<html lang="en">
<head>
    <title>Sign out</title>
</head>
<body>
</body>
</html>