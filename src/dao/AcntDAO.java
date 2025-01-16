import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AcntDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/your_database_name";
    private static final String USER = "your_username";
    private static final String PASSWORD = "your_password";

    public List<ACNT> getAllAccounts() {
        List<ACNT> accounts = new ArrayList<>();
        String query = "SELECT * FROM ACNT";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                int acntId = resultSet.getInt("acnt_id");
                int usrType = resultSet.getInt("usr_type");
                String email = resultSet.getString("email");
                String pwd = resultSet.getString("pwd");
                boolean adnFla = resultSet.getBoolean("adn_fla");

                ACNT account = new ACNT(acntId, usrType, email, pwd, adnFla);
                accounts.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accounts;
    }
}
