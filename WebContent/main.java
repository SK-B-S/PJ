import java.util.List;

public class Main {
    public static void main(String[] args) {
        AccountDAO accountDAO = new AccountDAO();
        List<Account> accounts = AcntDAO.getAllAccounts();

        // Output the accounts
        for (Account account : accounts) {
            System.out.println(account);
        }
    }
}
