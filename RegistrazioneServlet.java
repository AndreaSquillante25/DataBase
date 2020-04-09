package controller;

import model.Utente;
import model.UtenteDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;

@WebServlet("/registrazione")
public class RegistrazioneServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=request.getParameter("username");
        String password=request.getParameter("pwd");
        String nome=request.getParameter("nome");
        String email=request.getParameter("email");
        String citta=request.getParameter("citta");
        //String datanascita=request.getParameter("date");
        //data dobbiamo decidere come trattarla come verificare l'eta ,se fare il calcolo istantaneo tramite javascript oppure tramite java
        Utente utente = new Utente();
        utente.setUsername(username);
        utente.setPassword(password);
        utente.setUsername(nome);
        utente.setEmail(email);
        utente.setCitta(citta);

        UtenteDAO utenteDAO=new UtenteDAO();
        utenteDAO.doSave(utente);
        request.getSession().setAttribute("utente", utente);

    }
}
