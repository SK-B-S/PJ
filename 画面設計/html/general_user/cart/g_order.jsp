<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Cart" %>
<%@ page import="bean.Goods" %>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jimoty</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/header_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/body_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/main_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/footer_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/button_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/general_user_style/cart_style.css">
</head>

<body>
    <header>
        <div class="hdr_icon">
            <img class="top_icon" src="${pageContext.request.contextPath}/img/pj.jpg" alt="icon画像">
        </div>
        <form class="srchbar">
            <input class="srch_input" type="text" placeholder="検索ワードを入力">
            <button class="srch_btn" type="submit">検索</button>
        </form>
        <div class="header_btn_grp">
            <button class="header_btn">アカウント</button>
            <button class="header_btn">カート</button>
        </div>
    </header>

    <main>
        <div class="container">
            <div class="content">

                <div class="top_title">商品注文確認</div>
                <div class="deliver_grp">
                    <p class="dlvr">郵便番号: ${purchasers.pchrPst}</p>
                    <p class="dlvr">お届け先: ${purchasers.pchrAddr}</p>
                    <p class="dlvr">お支払方法: 代金引換</p>
                </div>

                <c:set var="goodsPrice" value="0" />
                <c:forEach var="cart" items="${cartList}">
                    <c:set var="subtotal" value="${cart.goods.price * cart.cartQua}" />
                    <c:set var="goodsPrice" value="${goodsPrice + subtotal}" />
                    <c:set var="totalPrice" value="${goodsPrice + 300}" />

                    <div class="products_list">
                        <div class="cart_list">
                            <div class="cart_gds_grp">
                                <p class="gds_name">${cart.goods.gdsName}</p>
                                <p class="qua">数量: ${cart.cartQua}</p>
                                <p class="price">¥${cart.goods.price}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <div class="payment_exp">
                    <p class="pay_policy">■ 代金引換<br>
                        ・代金は商品配送時にお支払いください。<br>
                        ・配送時のお支払方法は現金のみとなっております。<br>
                        ・〔代引き手数料料金表〕全国一律料金：300円</p>
                    <p class="total">合計: ¥${totalPrice}</p>
                </div>

                <div class="odr_btn_grp">
                    <form action="${pageContext.request.contextPath}/g_order_conf/GOrderConfServlet" method="get">
                        <button class="odr_btn" type="submit">注文を確定</button>
                    </form>
                    <button class="odr_back_btn" type="button" onclick="history.back();">戻る</button>
                </div>
            </div>
        </div>
    </main>

    <footer>
        <p>ご利用規約・プライバシーポリシー</p>
        <p>© 2024 YUSA S.A.S</p>
    </footer>
</body>

</html>
