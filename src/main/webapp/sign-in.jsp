<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.customer_support_ip.beans.UserBean" %>
<jsp:useBean id="userBean" class="com.example.customer_support_ip.beans.UserBean" scope="session"/>
<jsp:useBean id="userService" class="com.example.customer_support_ip.services.UserService" scope="application"/>

<jsp:setProperty property="korisnicko_ime" name="userBean" param="korisnicko_ime" />
<jsp:setProperty property="lozinka" name="userBean" param="lozinka" />
<!DOCTYPE html>
<%
    if (request.getParameter("submit") != null) {
        UserBean user = userService.getUser(userBean.getKorisnicko_ime(),userBean.getLozinka());
        if(user != null)
        {
            userBean.setIme(user.getIme());
            userBean.setPrezime(user.getPrezime());
            userBean.setStatus(true);
            session.setAttribute("notification","");
            response.sendRedirect("messages.jsp");
        }
        else {
            session.setAttribute("notification","Incorrect username and password");
            userBean.setStatus(false);
        }
    }
    else
    {
        session.setAttribute("notification","");
    }
%>
<meta charset="UTF-8">
<link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/sign-in/">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="styles/sign-in.css" rel="stylesheet">
<title>Login</title>
<script>
    function hideNotification() {
        var notificationElement = document.getElementById('notificationMessage');
        if (notificationElement) {
            notificationElement.style.display = 'none';
        }
    }

    setTimeout(hideNotification, 2000);
</script>


</head>
<body>

<div class="login-box">
    <h2>Login Page</h2>
    <p  class="p"  id="notificationMessage" ><%=session.getAttribute("notification").toString()%></p>
    <form>
        <div class="user-box">
            <input type="text" id="korisnicko_ime" name="korisnicko_ime" required>
            <label>Username</label>
        </div>
        <div class="user-box">
            <input type="password" id="lozinka" name="lozinka" required>
            <label>Password</label>
        </div>
        <button class="btn" name="submit" type="submit">Sign in</button>

    </form>


</div>
</body>
</html>



</body>
</html>