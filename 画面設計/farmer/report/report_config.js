const STORAGE_KEY = "tableData";

// 数値をフォーマットする関数（千の位で"."を挿入）
function formatNumberWithDots(number) {
return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// テーブルを初期化（ローカルストレージからデータを読み込む）
document.addEventListener("DOMContentLoaded", () => {
loadTable();
});

// 行を追加する関数
function addRow(rowData = null) {
const tableBody = document.querySelector("#dataTable tbody");
const newRow = document.createElement("tr");

// 1列目（行名）を作成
const nameCell = document.createElement("td");
nameCell.setAttribute("contenteditable", "true");
nameCell.innerHTML = rowData?.name || "新しい行";
newRow.appendChild(nameCell);

// 2～13列目を作成して行に追加
for (let i = 0; i < 12; i++) {
const newCell = document.createElement("td");
newCell.setAttribute("contenteditable", "true");
newCell.addEventListener("input", () => {
updateRowTotal(newRow);
updateColumn13Total();
});
newCell.innerHTML = rowData?.data?.[i] || "";
newRow.appendChild(newCell);
}

// 14列目（合計）を作成
const totalCell = document.createElement("td");
totalCell.className = "row-total";
totalCell.innerHTML = formatNumberWithDots(rowData?.total || "0"); // フォーマット適用
newRow.appendChild(totalCell);

tableBody.appendChild(newRow);
updateColumn13Total();
}

// 行の合計を計算して14列目に表示する関数
function updateRowTotal(row) {
const cells = row.querySelectorAll("td:nth-child(n+2):nth-child(-n+13)");
let sum = 0;

cells.forEach(cell => {
const value = parseFloat(cell.textContent.replace(/\,/g, "")) || 0; // ","を除去して数値変換
sum += value;
});

row.querySelector(".row-total").textContent = formatNumberWithDots(sum); // フォーマット適用
}

// 列13の合計を計算して表示する関数
function updateColumn13Total() {
const totalCells = document.querySelectorAll(".row-total");
let grandTotal = 0;

totalCells.forEach(cell => {
const value = parseFloat(cell.textContent.replace(/\,/g, "")) || 0; // ","を除去して数値変換
grandTotal += value;
});

document.getElementById("column13Total1").textContent = `＜カテゴリ＞の売上総額: ${formatNumberWithDots(grandTotal)}`; // フォーマット適用
document.getElementById("column13Total2").textContent = `＜カテゴリ＞の売上総額: ${formatNumberWithDots(grandTotal)}`; // フォーマット適用
}

function del(){
       
    let rw = tbl.rows.length;
    tbl.deleteRow(rw-1);
    
}