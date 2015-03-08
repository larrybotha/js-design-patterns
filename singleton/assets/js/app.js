var mySingleton;

mySingleton = new Singleton.getInstance({
  name: 'mySingleton'
});

console.log('Singleton class name:', Singleton.name);

console.log('Singleton instance name:', mySingleton.name);

mySingleton.myPublicMethod();
