function count () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const inputPrice = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = Math.round(inputPrice * 0.1).toLocaleString();
    profit.innerHTML = Math.round(inputPrice - inputPrice * 0.1).toLocaleString();
  });
};

window.addEventListener('load', count);