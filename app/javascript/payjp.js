const payjpCheckout = () => {
  const publicKey = document.querySelector('meta[name="payjp-public-key"]').content;
  const payjp = Payjp(publicKey);
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  form.addEventListener('submit', (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then((response) => {
      if (response.error) {
        form.submit();
      } else {
        const token = response.id;
        const tokenInput = document.createElement('input');
        tokenInput.setAttribute('type', 'hidden');
        tokenInput.setAttribute('name', 'order_address[token]');
        tokenInput.setAttribute('value', token);
        form.appendChild(tokenInput);

        numberElement.unmount();
        expiryElement.unmount();
        cvcElement.unmount();
        form.submit();
      }
    });
  });
};

window.addEventListener('load', payjpCheckout);