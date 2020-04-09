<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
         <title>Registrazione jsp</title>
    </head>

    <body>
        <form action="registrazione">
            <label for="user">Username:</label><br>
             <input type="text" id="user" placeholder="username" name="username"><br>

             <label for="pass">Password:</label><br>
             <input type="password" id="pass"  placeholder="Password" name="pwd"><br><br>

            <label for="nome">Nome:</label><br>
            <input type="text" id="nome" placeholder="Nome" name="nome"><br>

             <label for="email">E-MAIL:</label><br>
             <input type="text" id="email" placeholder="E-mail" name="email"><br><br>

            <label for="date">Data di nascita:</label>
            <input type="date" id="date" name="date" min="1900-01-02"><br><br><%-- data minima da cui si puo inserire,per controllare se ha 18 anni ,qui non viene fatto--%>


            <label for="citta">Città :</label>
            <input type="text" id="citta" name="citta" ><br><br>

            <p> Registrandoti accetti di sottostare al dominio di lucia andrea e saverio <a href="#">termini e privacy</a></p>
            <input type="submit" value="Registrati">
         </form>
    </body>
</html>
