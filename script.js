
var cart = [];

cart['100'] = {count: 2,price: 13.4};
cart['587'] = {count: 3,price: 17.6};
cart['458'] = {count: 1,price: 99};
cart['758'] = {count: 10,price: 1.56};




var countSumm = function (products){
  console.log(products);
  var total = 0;

  products.map(function (value) {
    var count = parseInt(value.count);
    var price = parseFloat(value.price);

    console.log(total);
    if(count > 0 && price > 0){
      total += count * price * 10 / 10;
    }

  });

  var elem = document.getElementById("summ");
  elem.innerHTML = total;

};

countSumm(cart);

window.onbeforeunload = function(e) {
    var msg = 'Да неужели?';
    if(typeof e == "undefined")
        e = window.event;
    if(e)
        e.returnValue = msg;
    return msg;
}
