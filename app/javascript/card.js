const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const cardNumber = document.getElementById("card-number")
    const cardExpMonth = document.getElementById("card-exp-month")
    const cardExpYear = document.getElementById("card-exp-year")
    const cardCvc = document.getElementById("card-cvc")

    const card = {
      number: cardNumber.value,
      exp_month: cardExpMonth.value,
      exp_year: `20${cardExpYear.value}`,
      cvc: cardCvc.value,
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const chargeForm = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        chargeForm.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();

        alert("カード情報を正しく入力してください")
        alert("住所情報を正しく入力してください")
      }
    });
  });
};

window.addEventListener("load", pay);