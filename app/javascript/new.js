const taxProfit = () => {
  const priceArea = document.getElementById("item-price");

  priceArea.addEventListener('input', function(){
    let price = priceArea.value;

    let tax = price * 0.1;
    let profit = price - tax;

    const taxArea = document.getElementById("add-tax-price");
    const profitArea = document.getElementById("profit");

    taxArea.textContent = Math.floor(tax);
    profitArea.textContent = Math.floor(profit);
  });
};

window.addEventListener("load", taxProfit);