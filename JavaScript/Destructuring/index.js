// ----------------------------
// Destructuring cheat sheet (JavaScript)
// ----------------------------

// 1. Array destructuring
let numbers = [1, 2, 3, 4];
let [a, b] = numbers;                           // a=1, b=2
let [x, , y] = numbers;                         // x=1, y=3 (skip element)
let [first, ...rest] = numbers;                 // rest=[2,3,4]

// 2. Default values
let [p = 10, q = 20] = [5];                     // p=5, q=20

// 3. Swapping variables using destructuring
let m = 1, n = 2;
[m, n] = [n, m];                                // m=2, n=1

// 4. Object destructuring
let person = { name: "Alice", age: 25, city: "Bangkok" };
let { name, age } = person;                     // name="Alice", age=25
let { name: n, city: c } = person;             // n="Alice", c="Bangkok"

// 5. Default values in objects
let { country = "Thailand" } = person;         // country="Thailand"

// 6. Nested object destructuring
let user = {
  id: 1,
  profile: { username: "alice123", email: "alice@example.com" }
};
let { profile: { username, email } } = user;    // username="alice123", email="alice@example.com"

// 7. Function parameters destructuring
function greet({ name, age }) {
  console.log(`Hello, ${name}. You are ${age} years old.`);
}
greet(person);                                  // "Hello, Alice. You are 25 years old."

// 8. Array destructuring in function parameters
function sumAndMultiply([x, y]) {
  console.log(x + y, x * y);
}
sumAndMultiply([2, 3]);                         // 5 6

// 9. Destructuring with rest in objects
let { name: firstName, ...otherProps } = person;
console.log(firstName);                          // "Alice"
console.log(otherProps);                         // {age:25, city:"Bangkok"}

// 10. Destructuring with default values in function parameters
function printUser({ name = "Unknown", age = 0 } = {}) {
  console.log(`Name: ${name}, Age: ${age}`);
}
printUser();                                     // Name: Unknown, Age: 0

// 11. Combining arrays and objects
let data = [
  { id: 1, value: "A" },
  { id: 2, value: "B" }
];
for (let { id, value } of data) {
  console.log(id, value);                        // 1 "A"   2 "B"
}

// 12. Practical use: swapping multiple variables
let coords = [10, 20, 30];
let [lat, long, alt = 0] = coords;              // lat=10, long=20, alt=30

// ----------------------------
// End of destructuring cheat sheet
// ----------------------------
