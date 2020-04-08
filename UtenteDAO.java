package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//anche questo preso dal progetto precedente

public class UtenteDAO {

    public Utente doRetrieveByUsernamePassword(String username, String password)
        {
            try (Connection con = ConPool.getConnection()) {

                String query = ("SELECT id, username, passwordhash, email, admin FROM utente WHERE username=? AND passwordhash=SHA1(?)");
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, username);
                ps.setString(2, password);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    Utente u=new Utente();
                    u.setId(rs.getInt(1));
                    u.setUsername(rs.getString(2));
                    u.setPassword(rs.getString(3));
                    u.setEmail(rs.getString(4));
                    u.setAdmin(rs.getBoolean(5));
                  return u;
                }
                con.close();
                return null;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }



    public void doSave(Utente utente) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO utente (username,passwordhash,email) VALUES(?,?,?)"
                                   // questo codice è utile solo se si vuole restituire il bean customer completo di id
            );                                                            // in questo caso restituiamo  void per cui è inutile
            ps.setString(1, utente.getUsername());
            ps.setString(2, utente.getPasswordhash());
            ps.setString(3, utente.getEmail());



            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
