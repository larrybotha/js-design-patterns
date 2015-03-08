var ObserverList;

ObserverList = (function() {
  function ObserverList() {
    this.observerList = [];
  }

  ObserverList.prototype.add = function(obj) {
    return this.observerList.push(obj);
  };

  ObserverList.prototype.count = function() {
    return this.observerList.length;
  };

  ObserverList.prototype.get = function(index) {
    if (index > -1 && index < this.observerList.length) {
      return this.observerList[index];
    }
  };

  ObserverList.prototype.indexOf = function(obj, startIndex) {
    var i;
    i = startIndex || 0;
    while (i < this.observerList.length) {
      if (this.observerList[i] === obj) {
        return i;
      }
      i++;
    }
  };

  ObserverList.prototype.removeAt = function(index) {
    return this.observerList.splice(index, 1);
  };

  return ObserverList;

})();
