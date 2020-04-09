<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>JSP LOGIN PAGE</title>
    </head>

    <body>
        <h1>WELCOME TO LOGIN PAGE ! COME SONO SPOCCHIOSO XSXS!</h1>
        <form action="login-servlet" method="post">
            <label for="username">Username:</label><br>
            <input type="text" id="username" name="username"><br>
            <label for="pwd">Password:</label><br>
            <input type="password" id="pwd" name="pwd"><br><br>
            <input type="submit" value="Accedi">
            <input type="submit" name="Registrati" value="Registrati">
        </form>

    </body>
</html>
