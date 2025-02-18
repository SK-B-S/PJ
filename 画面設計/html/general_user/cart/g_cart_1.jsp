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
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Jimoty</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/header_style.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/body_style.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/main_style.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/footer_style.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/button_style.css">
      <link rel="stylesheet" href="g_cart_style.css">
   </head>
   <body>
      <header>
          <div class="hdr_icon">
               <img class="top_icon" src="${pageContext.request.contextPath}/img/DALL·E 2024-11-08 14.27.31 - A simple, circular icon with the letters 'PJ' in the center. The design should be minimalistic, with 'PJ' in a bold, modern font inside a clean circle.webp" alt="icon画像">
          </div>

          <div class="header_btn_grp">
				<button class="header_btn" type="button" name="g_mypage" value="g_my_page" onclick="location.href='${pageContext.request.contextPath}/g_mypage/GMypageServlet'">アカウント</button>
          </div>
      </header>
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
                   <div class="cart">カート</div>
                   <table border="1">
                       <tr>
                           <th>商品画像</th>
                           <th>商品名</th>
                           <th>価格</th>
                           <th>数量</th>
                           <th>小計</th>
                           <th>削除</th>
                       </tr>
                       <% int totalPrice = 0;
                          if (cartList != null) {
                              for (Cart cart : cartList) {
                                  Goods goods = cart.getGoods();
                                  int subtotal = goods.getPrice() * cart.getCartQua();
                                  totalPrice += subtotal; %>
                       <tr>
                           <td><img src="${pageContext.request.contextPath}/upload/goods/<%= goods.getGdsImage() %>" width="100"></td>
                           <td><%= goods.getGdsName() %></td>
                           <td><%= goods.getPrice() %> 円</td>
                           <td><%= cart.getCartQua() %></td>
                           <td><%= subtotal %> 円</td>

                           <td>
                               <form action="${pageContext.request.contextPath}/cart/DeleteCartServlet" method="post">
                                   <input type="hidden" name="gdsId" value="<%= goods.getGdsId() %>">
                                   <button type="submit">削除</button>
                               </form>
                           </td>   
                       </tr>
                       <% } } %>
                       <tr>
                           <td colspan="4" align="right"><strong>合計金額:</strong></td>
                           <td><strong><%= totalPrice %> 円</strong></td>
                           <td>


						<form action="${pageContext.request.contextPath}/g_order_check/GOrderCheckServlet" method="get">
						    <button type="submit">注文確認へ進む</button>
						</form>





                           </td>
                       </tr>
                   </table>
						<button class="order_btn" type="button" onclick="history.back();">戻る</button>
               </div>
          </div>
      </main>
      <footer>
          <p>ご利用規約・プライバシーポリシー</p>
          <p>© 2024 YUSA S.A.S</p>
      </footer>
   </body>
</html>
