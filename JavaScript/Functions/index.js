// 1. Function declaration
function greet(name) {                           // Regular function
  return `Hello, ${name}!`;
}
console.log(greet("Alice"));                     // "Hello, Alice!"

// 2. Function expression
const sayHi = function(name) {                   // Assign function to variable
  return `Hi, ${name}`;
};
console.log(sayHi("Bob"));                       // "Hi, Bob"

// 3. Arrow function (ES6)
const multiply = (a, b) => a * b;                // Single expression returns automatically
console.log(multiply(2, 3));                     // 6

const divide = (a, b) => {                        // Multiple statements require curly braces
  if (b === 0) return "Cannot divide by zero";
  return a / b;
};
console.log(divide(10, 2));                       // 5

// 4. Default parameters
function power(base, exponent = 2) {
  return base ** exponent;
}
console.log(power(3));                           // 9
console.log(power(2, 3));                        // 8

// 5. Rest parameters
function sum(...numbers) {                        // Accepts unlimited arguments as array
  return numbers.reduce((total, n) => total + n, 0);
}
console.log(sum(1, 2, 3, 4));                    // 10

// 6. Arguments object (old style)
function oldSum() {
  let total = 0;
  for (let i = 0; i < arguments.length; i++) {
    total += arguments[i];
  }
  return total;
}
console.log(oldSum(1, 2, 3));                    // 6

// 7. Callback functions
function processUser(name, callback) {
  console.log(`Processing ${name}...`);
  callback(name);
}
processUser("Alice", (user) => console.log(`Hello, ${user}`));  // Callback invoked

// 8. Immediately invoked function expression (IIFE)
(function() {
  console.log("IIFE runs immediately!");
})();

(() => {
  console.log("Arrow IIFE runs immediately!");
})();

// 9. Function returning function
function greetGenerator(greeting) {
  return function(name) {
    console.log(`${greeting}, ${name}!`);
  };
}
const sayHello = greetGenerator("Hello");
sayHello("Bob");                                  // "Hello, Bob!"

// 10. Named function expressions
const factorial = function fact(n) {
  if (n <= 1) return 1;
  return n * fact(n - 1);                         // Recursion using named function
};
console.log(factorial(5));                        // 120

// 11. Methods in objects
const person = {
  name: "Alice",
  greet() {
    console.log(`Hi, I am ${this.name}`);
  }
};
person.greet();                                   // "Hi, I am Alice"

// 12. Function constructor (rarely used)
const sumFunc = new Function("a", "b", "return a + b;");
console.log(sumFunc(2, 3));                       // 5

// 13. Function properties
function demo() {}
demo.prop = "example";                             // Functions are objects
console.log(demo.prop);                            // "example"