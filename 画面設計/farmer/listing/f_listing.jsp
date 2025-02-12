<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ja">
    <head>
        <!-- UTF-8でエンコード -->
        <meta charset="UTF-8">
        <!-- デバイスのウィンドウ幅に合わせてページを変更、文字の初期スケールを1に指定 -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- タイトル -->
        <title>出品登録</title>

        <!-- style_sample.cssを参照 -->
        <!-- defaul static css file -->

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/header_style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/body_style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/main_style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/static_style/footer_style.css">

        <link rel="stylesheet" href="listing_style.css">

        <!-- 最終更新日：担当者 更新する度に書き換える -->
        <!-- last update 2025/1/21 杉田 -->

    </head>

    <body>

        <header>
            <p>出品登録</p>
        </header>

        <main>
            <div class="container">
                <div class="content">
                    <div class="detail">
                        <p>出品登録</p>
                    </div>

                    <div class="entry">
						<form action="${pageContext.request.contextPath}/goods_listing/GoodsListingServlet" method="post" enctype="multipart/form-data">

	                        <label class="up_label" for="gds_name">商品名</label>
	                        <input class="up_input" type="text" id="name" name="gds_name" placeholder="商品名" required>
	                        <br>


	                        <!-- 野菜リストを動的に表示 ---------------------------------------------------------------- -->
	                        <label class="up_label" for="cate">野菜区分</label>
					        <select id="category" name="category">
					            <option value="">選択してください</option>
					            <!-- 野菜リストを動的に表示 -->
					            <c:forEach var="cotegorys" items="${cotegorys}">
					                <option value="${cotegorys}">${cotegorys}</option>
					            </c:forEach>
					        </select>
					        <br>
					        <!-- ------------------------------------------------------------------------------------------- -->


	                        <label class="up_label" for="gds_image">商品画像</label>
	                        <input class="up_input" type="file" id="prim" name="gds_image" placeholder="アップロード" required>
	                        <br>

	                        <label class="up_label" for="price">値段</label>
	                        <input class="up_input" type="text" id="pri" name="price" placeholder="値段" required>
	                        <br>

	                        <label class="up_label" for="gds_exp">商品説明</label>
	                        <textarea class="up_input" id="expo" name="gds_exp" placeholder="商品説明" required></textarea>
	                        <br>



							<!-- 単位を動的に表示 ------------------------------------------------------------------------- -->

							<label class="up_label" for="unit">単位選択</label>
							<br>
							<div id="unit-options">
							    <c:forEach var="unit" items="${units}">
							        <label>
							            <input type="radio" name="unit" value="${unit}" onclick="toggleUnitFields('${unit}')">
							            ${unit}
							        </label><br>
							    </c:forEach>
							</div>

							<!-- 動的に切り替わる入力フィールド -->
							<div id="dynamic-fields">
							    <!-- 初期状態では何も表示しない -->
							</div>

							<script>
							    // 動的に入力フィールドを切り替える関数
							    function toggleUnitFields(selectedUnit) {
							        const dynamicFields = document.getElementById('dynamic-fields');
							        dynamicFields.innerHTML = ''; // 一旦フィールドをクリア

							        if (selectedUnit === '個') {
							            dynamicFields.innerHTML = `
							                <div class="check_A1">
							                    <label for="cou">個数：</label>
							                    <input type="number" id="cou" name="quantity" min="1"  placeholder="個" required>
							                </div>
							            `;
							        } else if (selectedUnit === 'グラム') {
							            dynamicFields.innerHTML = `
							                <div class="check_A1">
							                    <label for="Kg">グラム：</label>
							                    <input type="number" id="Kg" name="weight" min="1" placeholder="Kg" required>
							                </div>
							            `;
							        }
							    }
							</script>


							<!-- ------------------------------------------------------------------------------------------ -->


	                        <label class="up_label" for="rest_stk">在庫数</label>
	                        <input class="up_input" type="number" id="stock" name="rest_stk" value="1" min="1" max="100" step="1" required><br>

	        				<button class="up_btn" type="submit" name="goodsregister" value="goods_register">商品登録</button>
	        			</form>
                    </div>

                    <div class="list">
                        <!-- 商品画像 -->
                        <div class="img">
                            <img src="https://via.placeholder.com/150" alt="商品画像">
                        </div>
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