<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ja">
    
    <head>
        <!-- UTF-8でエンコード -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- タイトル -->
        <title>ログイン画面</title>
        <!-- style_top.cssを参照 -->
        <link rel="stylesheet" href="../account_style.css">
        <!-- last update 2024/1/10 小林 -->
    </head>

    <body>

        <!-- ヘッダー -->
        <header>
            <p>Jimoty - おうちで楽々人身売買 -</p>
        </header>

        <main>

            <div class="container">
                <!-- 入力フォーム -->
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <label for="email">メールアドレス:</label>
                    <input type="text" id="email" name="email" size="20" maxlength="20" required><br><br>

                    <label for="password">パスワード:</label>
                    <input type="password" id="password" name="password" size="20" maxlength="20" required><br><br>

                    <label for="chk_d_ps">
                    <input type="checkbox" id="chk_d_ps" onclick="togglePasswordVisibility()">
                    パスワードを表示
                    </label>
                    <br>
                    <input type="submit" name="login" value="ログイン">
                </form>

                <ul id="errorMessages">
                <% String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) {%>
                    <li style="color:red;"><%= errorMessage %></li>
                <% }%>
                </ul>
            </div>
            <div class="container">
                <a class="li_link" href="/register">パスワードの分からない方はこちら</a>
            </div>
            <div class="container">
                <a class="li_link" href="/register">新規登録</a>
                <a class="li_link" href="/farmer-login">農家の方はこちら</a>
            </div>
        <script>
            function togglePasswordVisibility() {
                var passwordField = document.getElementById("password");
                if (passwordField.type === "password") {
                    passwordField.type = "text";
                } else {
                    passwordField.type = "password";
                }
            }
        </script>
        </main>

        <footer>
            <p>ご利用規約・プライバシーポリシー</p>
            <p>© 2024 YUSA S.A.S</p>
        </footer>

    </body>

</html>
