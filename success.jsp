<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>JSP Success</title>
    </head>
    <body>
<%-- QUESTA jsp l'ho fatta solo per provare a fare un logout e per vedere se prendeva il nome dalla sessione tutto okay vvb--%>
    <%
        String utente=(String)session.getAttribute("user");
        if(utente==null) {//se per qualche motivo strano è null lo reindiriziamo alla login
            response.sendRedirect("login.jsp");
        }
    %>
<h3>ciao,${user}</h3>
    <a href="login.jsp">logout</a>
</body>
</html>

