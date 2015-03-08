var addNewObserver, btnControl, container, controlCheckbox, extend;

extend = function(extension, obj) {
  var key;
  for (key in extension) {
    obj[key] = extension[key];
  }
};

addNewObserver = function() {
  var check;
  check = document.createElement("input");
  check.type = 'checkbox';
  extend(new Observer(), check);
  controlCheckbox.addObserver(check);
  container.appendChild(check);
};

controlCheckbox = document.querySelector('.checkbox-main');

btnControl = document.querySelector('.add-new-observer');

container = document.querySelector('.observers-container');

extend(new Subject(), controlCheckbox);

controlCheckbox.addEventListener('click', function() {
  return controlCheckbox.notify(controlCheckbox.checked);
});

btnControl.addEventListener('click', addNewObserver);
