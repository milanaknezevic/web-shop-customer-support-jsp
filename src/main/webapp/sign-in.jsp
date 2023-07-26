<%@page import="com.example.customer_support_ip.services.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.customer_support_ip.beans.UserBean" %>
<jsp:useBean id="userBean" class="com.example.customer_support_ip.beans.UserBean" scope="session"/>
<jsp:useBean id="userService" class="com.example.customer_support_ip.services.UserService" scope="application"/>

<jsp:setProperty property="korisnicko_ime" name="userBean" param="korisnicko_ime" />
<jsp:setProperty property="lozinka" name="userBean" param="lozinka" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Administratorska aplikacija</title>
</head>
<body>
<%
    if (request.getParameter("submit") != null) {
        String username = request.getParameter("korisnicko_ime");
        String password = request.getParameter("lozinka");
        userBean = userService.getUser(username, password);

        if (userBean != null) {
            response.sendRedirect("messages.jsp");

        } else {
            response.sendRedirect("sign-out.jsp");

        }
    }
%>
<h2>Prijavi se</h2>
<form method="post" action="sign-in.jsp">

    <label for="korisnicko_ime">Korisnicko ime:</label>
    <input type="text" id="korisnicko_ime" name="korisnicko_ime" required>
    <br>
    <label for="lozinka">Lozinka:</label>
    <input type="password" id="lozinka" name="lozinka" required>
    <br>
    <input type="hidden" name="submit" value="true">
    <input type="submit" value="Prijavi se">
</form>
</body>
</html>