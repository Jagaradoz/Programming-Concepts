import greet, { PI, E, add, multiply, Calculator } from './mathUtils.js';

console.log(PI);                                  // 3.14159
console.log(E);                                   // 2.718
console.log(add(2, 3));                           // 5
console.log(multiply(2, 3));                      // 6

const calc = new Calculator();
console.log(calc.square(4));                      // 16

console.log(greet("Alice"));                      // "Hello, Alice!"

// Import all as namespace
import * as math from './mathUtils.js';
console.log(math.PI);                             // 3.14159
console.log(math.add(5, 5));                      // 10

// Notes:
// - Each module file can have multiple named exports
// - Default export is optional but only one per module
// - Use relative paths './' when importing local files
// - Modules are loaded with type="module" in HTML
