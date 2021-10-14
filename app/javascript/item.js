function count () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const inputPrice = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = inputPrice * 0.1;
    profit.innerHTML = inputPrice - inputPrice * 0.1;
  });
};

window.addEventListener('load', count);