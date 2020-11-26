function purshase(){
  // 設定金額を入力するフォームの情報を取得する
  const form = document.getElementById("item-price")
  // keyupを使用し"フォームに値が入力される"ことに発火させる
  form.addEventListener("keyup", () => {
    // フォームに入力された値を取得する
    const price = form.value;
    // 消費税を表示させたい箇所のHTML要素を取得している
    const tax = document.getElementById("add-tax-price");
    // innerHTMLを使用してHTML要素を上書きしている
    // Math.floorは小数点以下切り下げを行う関数である
    // ※今回は上書きした値を取り消す必要性がないのでそういった記述はしていない
    tax.innerHTML = `${Math.floor(price * 0.1)}`;
    // taxと同じ要領である
    const profit = document.getElementById("profit")
    // Math.ceilは小数点以下切り上げを行う関数である
    profit.innerHTML = `${Math.ceil(price - (price * 0.1)) }`;
});
}


window.addEventListener("load",purshase)