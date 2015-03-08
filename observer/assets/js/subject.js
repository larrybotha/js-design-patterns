var Subject;

Subject = (function() {
  function Subject() {
    this.observers = new ObserverList();
  }

  Subject.prototype.addObserver = function(observer) {
    return this.observers.add(observer);
  };

  Subject.prototype.removeObserver = function(observer) {
    return this.observers.removeAt(this.observers.indexOf(observer));
  };

  Subject.prototype.notify = function(context) {
    var i, _i, _len, _ref;
    _ref = this.observers;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      i = _ref[_i];
      this.observers.get(i).update(context);
    }
  };

  return Subject;

})();
