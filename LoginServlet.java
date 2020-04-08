package controller;

import model.Utente;
import model.UtenteDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/login-servlet")
public class LoginServlet extends HttpServlet
{


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        //Prendo i parametri che abbiamo inserito nella request.
        String username=request.getParameter("username");
        String pass=request.getParameter("pwd");


        UtenteDAO utente=new UtenteDAO();
        Utente u=utente.doRetrieveByUsernamePassword(username,pass);//verifico se ci sono nel db

        if(u!=null) {
            //se utenticazione andata a buon fine vado a recuperare la sessione vecchia nel caso dovesse esserci e la invalido
            HttpSession oldSession = request.getSession(false);//false perchè se non c'è NON la crea
            if (oldSession != null) {//c'è la sessione
                oldSession.invalidate();//la invalido,questo lo faccio perche nel caso il cliente si è stato 10 minuti inattivo
                //e vuole altro tempo ,cosi gli diamo altro tempo
            }
            HttpSession currentSession = request.getSession();
            currentSession.setAttribute("user", username);
            currentSession.setMaxInactiveInterval(10*60);//va a secnodi dopo 10 minuti sei fuori devi riautenticarti per altro tempo
                                                            //per questo motivo prima vado ad eliminare la sessione vecchia

            String address = "success.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(address);
            rd.forward(request, response);

        }else{
            //autenticazione fallisce


           response.sendRedirect("login.jsp");


        }

    }
}
