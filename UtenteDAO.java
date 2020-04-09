package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//HO AGGIUNTO LA CITTA MA MANCA LA DATA
public class UtenteDAO {

    public Utente doRetrieveByUsernamePassword(String username, String password)
        {
            try (Connection con = ConPool.getConnection()) {

                String query = ("SELECT id, username, passwordhash,email,citta,admin FROM utente WHERE username=? AND passwordhash=SHA1(?)");
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
                    u.setCitta(rs.getString(5));
                    u.setAdmin(rs.getBoolean(6));
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
                    "INSERT INTO utente (username,passwordhash,email,citta) VALUES(?,?,?,?)"
                                   // questo codice è utile solo se si vuole restituire il bean customer completo di id
            );                                                            // in questo caso restituiamo  void per cui è inutile
            ps.setString(1, utente.getUsername());
            ps.setString(2, utente.getPasswordhash());
            ps.setString(3, utente.getEmail());
            ps.setString(4,utente.getCitta());


            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
