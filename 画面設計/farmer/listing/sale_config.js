document.getElementById("up_btn").addEventListener("click", () => {
    showDeletePopup();
});

function showDeletePopup() {
const userConfirmed = confirm("本当に削除しますか？");
    if (userConfirmed) {
        alert("削除が実行されました。");
        // ここに削除処理を追加
    } else {
        alert("削除はキャンセルされました。");
    }
}