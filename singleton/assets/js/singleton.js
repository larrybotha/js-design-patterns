var Singleton;

Singleton = (function() {
  var init, instance;
  instance = void 0;
  init = function(opts) {
    var myPrivateMethod, name;
    name = opts.name || 'Singleton';
    myPrivateMethod = function() {
      return console.log("private function called");
    };
    return {
      name: name,
      myPublicMethod: myPrivateMethod
    };
  };
  return {
    name: 'Singleton',
    getInstance: function(opts) {
      if (!instance) {
        instance = init(opts);
      }
      return instance;
    }
  };
})();
