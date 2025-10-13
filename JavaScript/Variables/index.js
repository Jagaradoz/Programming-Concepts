// Declaration types
var oldVar      = "I can be redeclared and updated";          // function-scoped, avoid modern use
let modernVar   = "I can be updated but not redeclared";      // block-scoped
const constantVar = "I cannot be updated or redeclared";      // block-scoped, immutable reference

// Variable types
let num         = 42;                                         // Number
let floatNum    = 3.14;                                       // Number (float)
let str         = "Hello World";                              // String
let bool        = true;                                       // Boolean
let undef;                                                    // Undefined
let nll         = null;                                       // Null
let sym         = Symbol("id");                               // Symbol (unique identifier)
let obj         = {name: "Alice"};                            // Object
let arr         = [1, 2, 3];                                  // Array
let func        = function() {};                              // Function

// Template literals (ES6)
let name        = "Alice";
let greeting    = `Hello, ${name}!`;                          // "Hello, Alice!"

// Variable scope
function scopeExample() {
  var x = 1;                                                  // function scoped
  let y = 2;                                                  // block scoped
  const z = 3;                                                // block scoped
  if (true) {
    let y = 20;                                               // different y (block scope)
    var x = 10;                                               // same x, overwrites outer x
  }
  console.log(x, y, z);                                       // 10, 2, 3
}

// Hoisting
console.log(hoistedVar);                                      // undefined
var hoistedVar = 5;

// console.log(notHoisted);                                   // ReferenceError
let notHoisted = 10;

// Destructuring
let person      = {name: "Bob", age: 25};
let {name: n, age: a} = person;                               // n = "Bob", a = 25

let numbers     = [1, 2, 3];
let [first, second] = numbers;                                // first = 1, second = 2

// Swapping variables
let aVar = 1, bVar = 2;
[aVar, bVar] = [bVar, aVar];                                  // aVar = 2, bVar = 1

// Type checking
console.log(typeof num);                                      // "number"
console.log(typeof str);                                      // "string"
console.log(Array.isArray(arr));                              // true

// Dynamic typing
let dynamic     = 42;
dynamic         = "Now I'm a string";                         // type can change anytime