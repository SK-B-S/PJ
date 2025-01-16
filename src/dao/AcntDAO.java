package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import bean.ACNT;

public class ACNTDAO {
    private static final String URL = "jdbc:h2:tcp://localhost/~/PJ_DB"; // データベースファイル
    private static final String USER = "sa";
    private static final String PASSWD = "";

    public List<ACNT> getAllAccounts() {
        List<ACNT> accounts = new ArrayList<>();
        String sql = "SELECT * FROM accounts";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                ACNT acnt = new ACNT();
                acnt.setAcnt_id(rs.getInt("acnt_id"));
                acnt.setUsr_type(rs.getInt("usr_type"));
                acnt.setEmail(rs.getString("email"));
                acnt.setPwd(rs.getString("pwd"));
                acnt.setAdn_fla(rs.getBoolean("adn_fla"));
                accounts.add(acnt);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accounts;
    }
}
