document.addEventListener("DOMContentLoaded", () => {
    // すべての top_product を取得
    const topProducts = document.querySelectorAll('.top_product');

    topProducts.forEach((product) => {
        // 商品名と価格を取得
        const gdsName = product.querySelector('.gds_name');
        const pri = product.querySelector('.gds_price');

        // 商品名または価格が空なら親要素を非表示
        if (!gdsName.textContent.trim() || !pri.textContent.trim()) {
            product.style.display = 'none';
        }
    });
});
