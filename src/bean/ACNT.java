package bean;

public class ACNT {
    private int acntId;
    private int usrType;
    private String email;
    private String pwd;
    private boolean adnFla;

    // Constructor
    public ACNT(int acntId, int usrType, String email, String pwd, boolean adnFla) {
        this.acntId = acntId;
        this.usrType = usrType;
        this.email = email;
        this.pwd = pwd;
        this.adnFla = adnFla;
    }

    // Getters and Setters
    public int getAcntId() {
        return acntId;
    }

    public void setAcntId(int acntId) {
        this.acntId = acntId;
    }

    public int getUsrType() {
        return usrType;
    }

    public void setUsrType(int usrType) {
        this.usrType = usrType;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public boolean isAdnFla() {
        return adnFla;
    }

    public void setAdnFla(boolean adnFla) {
        this.adnFla = adnFla;
    }

    @Override
    public String toString() {
        return "ACNT [acntId=" + acntId + ", usrType=" + usrType + ", email=" + email + ", pwd=" + pwd + ", adnFla=" + adnFla + "]";
    }
}
