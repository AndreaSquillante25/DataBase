
package model;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Utente
{
    public static int last=0;
    private int id;
    private String username ;
    private String email;
    private boolean admin;
    private  String passwordhash;
    private String citta;
    // la data ci manca 
    public Utente() {

    }
    public Utente(int id, String username, String password, String email,String citta,boolean admin)
    {
        this.id=id;
        this.username=username;
        this.passwordhash=password;
        this.email=email;
        this.citta=citta;
        this.admin=admin;
    }
    public Utente(String username, String password, String email,String citta, boolean admin)
    {
        this.id=last++;
        this.username=username;
        this.passwordhash=password;
        this.email=email;
        this.citta=citta;
        this.admin=admin;
    }

    public int getId(){return id;}
    public String getUsername(){return username;}
    public String getPasswordhash(){return passwordhash;}
    public String getEmail(){return email;}
    public boolean getAdmin(){return admin;}

    public void setId(int id){this.id=id;}
    public void setUsername(String username){this.username=username;}
    public void setEmail(String email){this.email=email;}
    public void setAdmin(boolean admin){this.admin=admin;}

    public String getCitta() { return citta; }
    public void setCitta(String citta) { this.citta = citta; }

    public void setPassword(String password){
        try {
            MessageDigest digest =
                    MessageDigest.getInstance("SHA-1");
            digest.reset();
            digest.update(password.getBytes(StandardCharsets.UTF_8));
            this.passwordhash = String.format("%040x", new
                    BigInteger(1, digest.digest()));
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }



}
