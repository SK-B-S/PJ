public class ACNT {
    private int acnt_id;       // アカウントID
    private int usr_type;      // ユーザータイプ (1, 2, 3)
    private String email;      // メールアドレス
    private String pwd;        // パスワード
    private boolean adn_fla;   // 管理者フラグ

    // デフォルトコンストラクタ
    public ACNT() {}

    // GetterとSetter
    public int getAcnt_id() {
        return acnt_id;
    }

    public void setAcnt_id(int acnt_id) {
        this.acnt_id = acnt_id;
    }

    public int getUsr_type() {
        return usr_type;
    }

    public void setUsr_type(int usr_type) {
        this.usr_type = usr_type;
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

    public boolean isAdn_fla() {
        return adn_fla;
    }

    public void setAdn_fla(boolean adn_fla) {
        this.adn_fla = adn_fla;
    }
}
