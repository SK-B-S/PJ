<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="bean.Cart" %>
<%@ page import="bean.Goods" %>

<%
  List<Cart> cartList = (List<Cart>) request.getAttribute("cartList");
%>

<!DOCTYPE html>
<html lang="ja">

<head>
    <!-- UTF-8でエンコード -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- タイトル -->
    <title>Jimoty</title>
    <!-- style.cssを参照 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/header_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/body_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/main_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/footer_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/button_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/general_user_style/cart_style.css">
    <!-- last update 2025/02/04 小林 -->

</head>

<body>
    <!-- ヘッダー -->
    <header>
        <div class="hdr_icon">
            <img class="top_icon" src="${pageContext.request.contextPath}/img/DALL·E 2024-11-08 14.27.31 - A simple, circular icon with the letters 'PJ' in the center. The design should be minimalistic, with 'PJ' in a bold, modern font inside a clean circle.webp" alt="icon画像" href="#">
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

    <!-- メイン -->
    <main>
        <ul id="listing">
		    <!-- カートが空の場合 -->
		    <%
		        String NULL_Cart = (String) session.getAttribute("NULL_Cart");
		        if (NULL_Cart != null) {
		    %>
		        <p><%= NULL_Cart %></p>
		    <%
		            session.removeAttribute("NULL_Cart");
		        }
		    %>
		</ul>
        <div class="container">
            <div class="content">

                <div class="top_title">
                    カート
                </div>

                <% int totalPrice = 0;
                    if (cartList != null) {
                        for (Cart cart : cartList) {
                            Goods goods = cart.getGoods();
                            int subtotal = goods.getPrice() * cart.getCartQua();
                            totalPrice += subtotal; %>

                <div class="products_list">
                    
                    <!-- 商品リスト -->
                    <div class="cart_list">
                        <div class="cart_img">
                            <!-- 商品画像 -->
                            <img src="${pageContext.request.contextPath}/upload/goods/<%= goods.getGdsImage() %>" alt="商品画像">
                        </div>
                        <p class="gds_name"><%= goods.getGdsName() %></p>
                    </div>

                    <div class="cart_gds_grp">
                        <div class="gds_dtl">
                            <p class="sub_title" id="gds_exp">${goods.GdsExp}</p>

                            <p class="price" id="price"><%= goods.getPrice() %></p>

                            <p class="qua" id="qua">
                                数量:<input class="qua_input" type="number" value="1" min="1" max="100" step="1">
                            </p>
                        </div>
                        <form class="frm_grp" action="${pageContext.request.contextPath}/cart/DeleteCartServlet" method="post">
                            <div class="cart_btn_grp">
                                <input type="hidden" name="gdsId" value="<%= goods.getGdsId() %>">
                                <button class="del_btn" type="submit">削除</button>
                            </div>
                        </form>

                        <script>
                            document.getElementById("cancel_btn").addEventListener("click", function () {
                                document.getElementById("message").style.display = "block";
                            });
                        </script>
                    </div>
                </div>

                <% 
                        } 
                    } 
                %>

                <div class="cart_prch">
                    <p>小計 : ¥<%= totalPrice%></p>
                    <!-- 支払いボタン -->
                    <form class="frm_grp" action="${pageContext.request.contextPath}/g_order_check/GOrderCheckServlet" method="get">
                        <button class="all_btn" type="submit">注文確認へ進む</button>
                    </form>
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