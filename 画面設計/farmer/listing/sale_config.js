document.getElementById("up_btn").addEventListener("click", () => {
    showDeletePopup();
});

function showDeletePopup() {
const userConfirmed = confirm("本当に変更しますか？");
    if (userConfirmed) {
        alert("変更が実行されました。");
        // ここに削除処理を追加
    } else {
        alert("変更はキャンセルされました。");
    }
}