<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.customer_support_ip.beans.MessageBean" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.customer_support_ip.services.MessageService" %>
<%@ page import="com.example.customer_support_ip.beans.MessageBean" %>

<jsp:useBean id="userBean" class="com.example.customer_support_ip.beans.UserBean" scope="session"/>
<jsp:useBean id="messageService" class="com.example.customer_support_ip.services.MessageService" scope="application"/>
<%
    List<MessageBean> messages = messageService.getAllMessages();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/sign-in/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="styles/messages.css" rel="stylesheet">
    <title>Login</title>
</head>
<body class="body">
<button class="btn search-button">Search</button>
<table class="table">
    <thead>
    <tr>
        <th>Content</th>
        <th>Read</th>
        <th>Email</th>

    </tr>
    </thead>
    <tbody>
    <% for (MessageBean message : messages) { %>
    <tr>
        <td>
            <div>

                <p><%= message.getSadrzaj() %></p>



            </div>
        </td>
        <td>
            <% if (message.isProcitana()) { %>
            <span>Read</span>
            <% } else { %>
            <span>Unread</span>
            <% } %>
        </td>
        <td>
            <div>
                <div class="email-avatar">

                    <div class="avatar">
                        <% if (message.getAvatar() != null && !message.getAvatar().isEmpty()) { %>
                        <img src="<%= message.getAvatar() %>" alt="Avatar" style="width: 50px; height: 50px; border-radius: 50%;" />
                        <% } else { %>
                        <img src="https://mdbootstrap.com/img/new/avatars/8.jpg" alt="Default Avatar" style="width: 50px; height: 50px; border-radius: 50%;" />
                        <% } %>
                    </div>
                    <div >
                        <span><%= message.getEmail() %></span>
                    </div>
                </div>
            </div>
        </td>
        <td>
            <button class="btn" type="button">Reply</button> <!-- Dodali smo dugme Odgovori -->
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>
