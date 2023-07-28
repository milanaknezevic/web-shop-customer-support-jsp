<%@ page import="com.example.customer_support_ip.beans.MessageBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="messageService" class="com.example.customer_support_ip.services.MessageService" scope="application"/>
<jsp:useBean id="userBean" class="com.example.customer_support_ip.beans.UserBean" scope="session"/>
<%! MessageBean messageBean = new MessageBean(); %>

<%
    if (!userBean.getStatus()) {
        response.sendRedirect("sign-in.jsp");
    }
    else
    {
        if (request.getParameter("id") != null) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                messageBean = messageService.getById(id);
                messageBean.setProcitana(true);
                messageService.changeStatus(id);
            } catch (Exception e) {
                response.sendRedirect("messages.jsp");
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reply page</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/sign-in/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="styles/messageForReply.css" rel="stylesheet">

</head>
<body>
<%@include file="WEB-INF/header.jsp" %>
<div class="container">

    <div class="question-email">
        <h1>Question:</h1>
       <div class="flex-container">
            <p style="margin-right: 10px;">from: <%= messageBean.getEmail() %></p>
            <img src="<%= messageBean.getAvatar() %>" alt="Avatar" class="avatar">
        </div>
    </div>
    <p class="pitanje" ><%=messageBean.getSadrzaj() %></p>

    <div class="form-floating">
        <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="min-height: 100px "></textarea>

    </div>

    <button type="button" onclick="posaljiOdgovor()" class="btn btn-primary mt-3"> &nbsp;Send</button>
    <button type="button" class="btn btn-primary view-button" onclick="location.href='messages.jsp'">
        &nbsp;Cancel
    </button>


</div>

<script>
    // Dodajemo funkciju za ograničavanje unosa na maksimalno 3024 riječi
    document.getElementById("floatingTextarea2").addEventListener("input", function() {
        var maxWords = 3024;
        var text = this.value;
        var wordCount = text.trim().split(/\s+/).length;

        if (wordCount > maxWords) {
            var words = text.split(/\s+/);
            words = words.slice(0, maxWords);
            this.value = words.join(" ");
        }
    });

</script>

<!-- Dodajte Bootstrap JavaScript biblioteku na dno stranice, neposredno prije zatvaranja body taga -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
