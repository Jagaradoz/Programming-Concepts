// ----------------------------
// Console cheat sheet (JavaScript)
// ----------------------------

// 1. Basic logging
console.log("Hello, world!");                     // Standard log
console.info("This is an info message");          // Informational message
console.warn("This is a warning");                // Warning message
console.error("This is an error");                // Error message

// 2. Logging multiple values
let a = 5, b = 10;
console.log("Values:", a, b);                     // Values: 5 10

// 3. String formatting
console.log("My name is %s and I am %d years old", "Alice", 25); // "My name is Alice and I am 25 years old"
console.log("Object: %o", {name: "Bob", age: 30});                // Logs object nicely

// 4. Table format
const users = [
  { name: "Alice", age: 25 },
  { name: "Bob", age: 30 }
];
console.table(users);                             // Displays array of objects as table

// 5. Grouping logs
console.group("User Info");                       // Start group
console.log("Name: Alice");
console.log("Age: 25");
console.groupEnd();                               // End group

// Nested groups
console.group("Outer");
console.log("Outer log");
console.group("Inner");
console.log("Inner log");
console.groupEnd();
console.groupEnd();

// 6. Counting
console.count("Counter");                          // Counter: 1
console.count("Counter");                          // Counter: 2
console.countReset("Counter");                     // Reset counter

// 7. Timing
console.time("LoopTimer");                         // Start timer
for (let i = 0; i < 100000; i++) {}
console.timeEnd("LoopTimer");                      // End timer and log duration

// 8. Assertions
let x = 5;
console.assert(x > 10, "x is not greater than 10"); // Will log error if false

// 9. Clearing console
console.clear();                                   // Clears the console

// 10. Tracing
function aFunc() {
  bFunc();
}
function bFunc() {
  console.trace("Trace here");                     // Shows call stack
}
aFunc();

// 11. Debugging
console.debug("Debug message");                    // Works like log, may appear only in dev tools

// ----------------------------
// End of console cheat sheet
// ----------------------------
