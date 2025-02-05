document.getElementById("addRowBtn").addEventListener("click", function () {
  var tableBody = document.querySelector("#dataTable tbody");
  var newRow = document.createElement("tr");

  // 1列目（カテゴリ名）
  var categoryCell = document.createElement("td");
  categoryCell.setAttribute("contenteditable", "true");
  categoryCell.innerText = "名称";
  newRow.appendChild(categoryCell);

  // 2〜13列目（1月〜12月）
  for (let i = 0; i < 12; i++) {
    let newCell = document.createElement("td");
    newCell.setAttribute("contenteditable", "true");
    newCell.addEventListener("input", () => updateRowTotal(newRow));
    newCell.innerText = "0"; // 初期値
    newRow.appendChild(newCell);
  }

  // 14列目（合計）
  var totalCell = document.createElement("td");
  totalCell.className = "row-total";
  totalCell.innerText = "0";
  newRow.appendChild(totalCell);

  // テーブルの一番上に挿入
  if (tableBody.firstChild) {
    tableBody.insertBefore(newRow, tableBody.firstChild);
  } else {
    tableBody.appendChild(newRow);
  }

  // 総合計を更新
  updateGrandTotal();
});

document.getElementById("delRowBtn").addEventListener("click", function () {
  var tableBody = document.querySelector("#dataTable tbody");
  if (tableBody.rows.length > 0) {
    tableBody.removeChild(tableBody.firstChild);
  }
  // 総合計を更新
  updateGrandTotal();
});

// 行の合計を計算する関数
function updateRowTotal(row) {
  let cells = row.querySelectorAll("td:nth-child(n+2):nth-child(-n+13)");
  let sum = 0;

  cells.forEach(cell => {
    let value = parseFloat(cell.textContent) || 0;
    sum += value;
  });

  row.querySelector(".row-total").textContent = sum;

  // 総合計を更新
  updateGrandTotal();
}

// **全体の合計を計算して画面に表示する関数**
function updateGrandTotal() {
  let totalCells = document.querySelectorAll(".row-total");
  let grandTotal = 0;

  totalCells.forEach(cell => {
    let value = parseFloat(cell.textContent) || 0;
    grandTotal += value;
  });

  // IDが "grandTotal" の要素を更新
  let grandTotalLabel1 = document.getElementById("grandTotal");
  if (grandTotalLabel1) {
    grandTotalLabel1.innerText = "＜カテゴリ＞の売上総額： " + grandTotal;
  }

  // IDが "grandTotal2" の要素を更新
  let grandTotalLabel2 = document.getElementById("grandTotal2");
  if (grandTotalLabel2) {
    grandTotalLabel2.innerText = "売上総額：" + grandTotal;
  }
}
