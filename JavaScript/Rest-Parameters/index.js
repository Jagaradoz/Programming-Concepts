// 1. Basic usage
function sum(...numbers) {                        // Collects all arguments into an array
  return numbers.reduce((total, n) => total + n, 0);
}
console.log(sum(1, 2, 3, 4));                     // 10

// 2. Combining with other parameters
function multiply(factor, ...nums) {              // factor is first, rest collects remaining
  return nums.map(n => n * factor);
}
console.log(multiply(2, 1, 2, 3));               // [2, 4, 6]

// 3. Rest parameters with arrow functions
const joinStrings = (...words) => words.join(" ");
console.log(joinStrings("Hello", "world", "!")); // "Hello world !"

// 4. Rest with destructuring arrays
let numbers = [1, 2, 3, 4, 5];
let [first, second, ...rest] = numbers;          // first=1, second=2, rest=[3,4,5]
console.log(first, second, rest);

// 5. Rest with destructuring objects
let person = { name: "Alice", age: 25, city: "Bangkok" };
let { name, ...details } = person;              // name="Alice", details={ age:25, city:"Bangkok" }
console.log(name, details);

// 6. Rest parameters vs arguments object
function oldStyle() {
  console.log(arguments);                        // Not a real array, cannot use array methods directly
}
oldStyle(1, 2, 3);

function newStyle(...args) {
  console.log(args);                              // Real array, can use map, reduce, etc.
}
newStyle(1, 2, 3);

// 7. Limitations
function invalid(...args, extra) {               // ❌ Rest must be last parameter
  return args;
}