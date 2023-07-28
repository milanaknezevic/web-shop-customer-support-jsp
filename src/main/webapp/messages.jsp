<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.customer_support_ip.beans.MessageBean" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.customer_support_ip.services.MessageService" %>
<%@ page import="com.example.customer_support_ip.beans.MessageBean" %>

<jsp:useBean id="userBean" class="com.example.customer_support_ip.beans.UserBean" scope="session"/>
<jsp:useBean id="messageService" class="com.example.customer_support_ip.services.MessageService" scope="application"/>


<%
    if (!userBean.getStatus())
        response.sendRedirect("sign-in.jsp");
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/sign-in/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="styles/messages.css">

    <title>Login</title>

    <script>
        $(document).ready(function () {
            // Activate tooltips
            $('[data-toggle="tooltip"]').tooltip();

            // Filter table rows based on searched term
            $("#search").on("keyup", function () {
                var term = $(this).val().toLowerCase();
                $("table tbody tr").each(function () {
                    $row = $(this);
                    var name = $row.find("td:nth-child(1)").text().toLowerCase();
                    console.log(name);
                    if (name.search(term) < 0) {
                        $row.hide();
                    } else {
                        $row.show();
                    }
                });
            });
        });
    </script>
</head>
<body class="body">

<%@include file="WEB-INF/header.jsp" %>
<div class="container-lg">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Messages</h2>
                    </div>
                    <div class="col-sm-6">
                        <div class="search-box">
                            <div class="input-group">
                                <input type="text" id="search" class="form-control" placeholder="Search by content">
                                <span class="input-group-addon"><i class="material-icons">&#xE8B6;</i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th style="width: 40%;">Content</th>
                    <th>Read</th>
                    <th style="width: fit-content;">Email</th>
                    <th>Action</th>

                </tr>
                </thead>
                <tbody>
                <% for (MessageBean message : messageService.getAllMessages()) {%>
                <tr>
                    <td>
                        <%= message.getSadrzaj() %>

                    </td>
                    <td><%=message.isProcitana() ? "Read":"Unread"%>
                    <td>
                        <%=message.getEmail()%>
                    </td>
                    <td>

                        <button type="button" class="btn btn-primary view-button"
                                onclick="location.href='messageForReply.jsp?id=<%=message.getId()%>'">
                            &nbsp;Reply
                        </button>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
