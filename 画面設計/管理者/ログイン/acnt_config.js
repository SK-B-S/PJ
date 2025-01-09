// 初期状態ではポップアップは表示しない
document.getElementById('deletePopup').style.display = 'none';

// 「アカウント削除」ボタンがクリックされたとき
document.getElementById('deleteButton').addEventListener('click', function() {
    document.getElementById('deletePopup').style.display = 'flex';  // ポップアップ表示
});

// 「はい」ボタンがクリックされたとき
document.getElementById('popupYes').addEventListener('click', function() {
    alert('アカウント削除処理が実行されます');
    document.getElementById('deletePopup').style.display = 'none'; // ポップアップ非表示
});

// 「いいえ」ボタンがクリックされたとき
document.getElementById('popupNo').addEventListener('click', function() {
    document.getElementById('deletePopup').style.display = 'none'; // ポップアップ非表示
});
