<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account List</title>
</head>
<body>
    <h1>アカウント一覧</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>ユーザータイプ</th>
            <th>メールアドレス</th>
            <th>パスワード</th>
            <th>管理者フラグ</th>
        </tr>
        <c:forEach var="account" items="${accounts}">
            <tr>
                <td>${account.acnt_id}</td>
                <td>${account.usr_type}</td>
                <td>${account.email}</td>
                <td>${account.pwd}</td>
                <td>${account.adn_fla}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
