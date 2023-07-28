<%@ page import="com.example.customer_support_ip.beans.MessageBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="messageService" class="com.example.customer_support_ip.services.MessageService" scope="application"/>
<jsp:useBean id="userBean" class="com.example.customer_support_ip.beans.UserBean" scope="session"/>
<%! MessageBean messageBean = new MessageBean(); %>

<%
    if (!userBean.getStatus()) {
        response.sendRedirect("sign-in.jsp");
    } else {
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
        else if (request.getParameter("submit") != null) {
            String replyContent = request.getParameter("content"); // Retrieve the value from the parameter

            System.out.println(messageBean.getEmail() + " " + replyContent);
            messageService.sendReply(messageBean.getEmail(),replyContent,messageBean.getSadrzaj());
            response.sendRedirect("messages.jsp");
        }
    }
%>
<!doctype html>
<%

%>
<html lang="en">
<head>
    <title>Reply page</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

    <script>
        function setRequired() {
            var textarea = document.getElementById("messageReply");
            textarea.required = true;
        }

        function removeRequired() {
            var textarea = document.getElementById("messageReply");
            textarea.required = false;
        }
    </script>

    <style>
        .center {
            margin: auto;
            width: 50%;
        }
    </style>
</head>
<body>
<%@include file="WEB-INF/header.jsp" %>
<br>
<br>
<h1 style="text-align: center">View Message</h1>
<div class="card border-primary mb-3 center" style="max-width: 50rem;">


    <div class="card-body">
        <div class="card-body">
            <form>
                <div class="form-group">
                    <label class="form-label" for="receivedContent">Received message</label>
                    <textarea class="form-control" style="min-height: 100px " id="receivedContent"
                              name="receivedContent" disabled
                              rows="4"><%=messageBean.getSadrzaj()%>
                    </textarea>
                </div>


                <p style="text-align: right">from: <%= messageBean.getEmail() %>
                </p>


                <div class="form-group">
                    <label class="form-label" for="messageReply">Reply message</label>
                    <textarea class="form-control" style="min-height: 100px " id="messageReply" name="content" rows="4"
                              placeholder="Reply message"></textarea>
                </div>
                <div style="margin-top: 20px">
                    <button type="submit" onclick="setRequired()" id="sendButton" name="submit" style="width: 80px;background:  #1690A7" class="btn btn-primary mb-4 d-inline-block">
                        Send
                    </button>
                    <button type="button" name="cancel"  id="cancelButton" style="width: 100px; padding: 5px;" class="btn btn-danger mb-4 d-inline-block"
                            onclick=" removeRequired(); location.href='messages.jsp'">
                        Cancel
                    </button>


                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>