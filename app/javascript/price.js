window.addEventListener('load', function(){

  let itemPrice = document.getElementById("item-price")
  let addTaxPrice = document.getElementById("add-tax-price")
  let userProfit = document.getElementById("profit");
  // console.log(itemPrice)

  itemPrice.addEventListener('keyup', function() {
    let price = itemPrice.value;
    taxCalculation = Math.floor(price * 0.1);
    addTaxPrice.innerHTML = taxCalculation;
    profitCalculation = Math.floor(price - taxCalculation);
    userProfit.innerHTML = profitCalculation;
  })
})
