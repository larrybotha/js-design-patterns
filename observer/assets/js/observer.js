var Observer;

Observer = (function() {
  function Observer() {
    this.update = function() {
      return console.log('updated');
    };
  }

  return Observer;

})();
