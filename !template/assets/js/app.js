(function(window, document) {
  var Calculator;
  window.onload = function() {
    var calc;
    Calculator.prototype.add = function(x, y) {
      return this.elem.innerHTML += x * y;
    };
    calc = new Calculator('.eq');
    return calc.add(2, 3);
  };
  Calculator = function(elem) {
    this.elem = document.querySelector(elem);
  };
  return Calculator.prototype = (function() {
    var add, subtract, _output;
    _output = function(val) {
      return this.elem.innerHTML += val;
    };
    add = function(x, y) {
      return _output.call(this, x + y);
    };
    subtract = function(x, y) {
      return _output.call(this, x - y);
    };
    return {
      add: add,
      subtract: subtract
    };
  })();
})(window, document);
