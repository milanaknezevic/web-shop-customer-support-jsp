
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %><html>
<%@page isErrorPage="true"%>
<jsp:useBean id="userBean" class="com.example.customer_support_ip.beans.UserBean" scope="session"/>


<%
    if(!userBean.getStatus())
    {
        response.sendRedirect("sign-in.jsp");
    }
%>
<head>
    <title>Error page</title>
</head>
<body>
<div className='errorPage'>

    <div>
        <h1>Sorry, your application encountered an error</h1>
        <h2>Oops! Something went wrong</h2>
        <button type="button" onclick="location.href='home.jsp'">Return To Home</button>
    </div>
</div>

</div>
</body>
</html>