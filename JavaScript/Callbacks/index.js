// 1. Basic callback
function greet(name, callback) {                  // callback is a function passed as argument
  console.log(`Hello, ${name}`);
  callback();
}
function sayGoodbye() {
  console.log("Goodbye!");
}
greet("Alice", sayGoodbye);                       // "Hello, Alice" then "Goodbye!"

// 2. Anonymous callback
greet("Bob", function() {
  console.log("Have a nice day!");
});

// 3. Arrow function as callback
greet("Charlie", () => console.log("See you later!"));

// 4. Callback with arguments
function processNumber(num, callback) {
  let result = num * 2;
  callback(result);
}
processNumber(5, (res) => console.log("Result:", res));  // Result: 10

// 5. Callback in array methods
let numbers = [1, 2, 3];
numbers.forEach((n, i) => console.log(`Index ${i}: ${n}`)); // iterate through array

let doubled = numbers.map(n => n * 2);          // map returns new array
console.log(doubled);                            // [2, 4, 6]

let filtered = numbers.filter(n => n > 1);       // filter elements
console.log(filtered);                            // [2, 3]

// 6. Callback in asynchronous operations
setTimeout(() => {
  console.log("Executed after 2 seconds");
}, 2000);

setInterval(() => {
  console.log("Repeating every second");
}, 1000);

// 7. Callback hell (to avoid using Promises/async)
function task1(cb) {
  console.log("Task 1 done");
  cb();
}
function task2(cb) {
  console.log("Task 2 done");
  cb();
}
task1(() => {
  task2(() => {
    console.log("All tasks done");               // Nested callbacks
  });
});

// 8. Converting callbacks to promises (modern approach)
function asyncTask() {
  return new Promise((resolve, reject) => {
    setTimeout(() => resolve("Task completed"), 1000);
  });
}
asyncTask().then(msg => console.log(msg));       // "Task completed"