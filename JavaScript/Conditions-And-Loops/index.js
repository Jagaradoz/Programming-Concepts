// 1. If / Else if / Else
let x = 10;

if (x > 10) {                                   // Condition true → run block
  console.log("Greater than 10");
} else if (x === 10) {                          // Else if previous is false
  console.log("Exactly 10");
} else {                                        // If all above false
  console.log("Less than 10");
}

// 2. Ternary operator
let age = 18;
let statusMsg = (age >= 18) ? "Adult" : "Minor"; // condition ? true : false
console.log(statusMsg);

// 3. Switch statement
let color = "blue";

switch (color) {
  case "red":
    console.log("Color is red");
    break;                                      // Stop further checks
  case "blue":
    console.log("Color is blue");
    break;
  default:
    console.log("Unknown color");               // Runs if no case matches
    break;
}

// 4. Nested conditions
let num = 7;

if (num > 0) {
  if (num % 2 === 0) {
    console.log("Positive even");
  } else {
    console.log("Positive odd");
  }
} else {
  console.log("Negative number");
}

// 5. Logical operators
let a = 5, b = 10;

if (a > 0 && b > 0) console.log("Both positive");     // And → both true
if (a > 0 || b > 20) console.log("At least one true"); // Or → any true
if (!(a > 10)) console.log("a is not greater than 10"); // Not → negation

// 6. While loop
let i = 0;
while (i < 5) {                                 // Runs while condition true
  console.log("Count:", i);
  i++;
}

// 7. Do...while loop
let j = 0;
do {                                            // Runs once before checking
  console.log("j =", j);
  j++;
} while (j < 3);

// 8. For loop
for (let k = 0; k < 5; k++) {                   // for(init; condition; update)
  console.log("k =", k);
}

// 9. Nested for loops
for (let row = 1; row <= 3; row++) {
  for (let col = 1; col <= 2; col++) {
    console.log(`Row ${row}, Col ${col}`);
  }
}

// 10. For...of loop (for arrays)
let fruits = ["apple", "banana", "cherry"];
for (let fruit of fruits) {
  console.log(fruit);                           // Loops through values
}

// 11. For...in loop (for objects)
let person = { name: "Alice", age: 25, city: "Bangkok" };
for (let key in person) {
  console.log(key, ":", person[key]);           // Loops through keys
}

// 12. Break & continue
for (let n = 1; n <= 10; n++) {
  if (n === 5) break;                           // Exit loop completely
  if (n % 2 === 0) continue;                    // Skip even numbers
  console.log("Odd:", n);
}

// 13. Labelled loop (rare but valid)
outerLoop: for (let m = 1; m <= 3; m++) {
  for (let n = 1; n <= 3; n++) {
    if (m === 2 && n === 2) break outerLoop;    // Break from outer loop
    console.log(`m=${m}, n=${n}`);
  }
}

// 14. Short-circuit evaluation
let user = null;
let name = user && user.name;                   // Won’t throw error (safe check)
let displayName = user?.name ?? "Guest";        // Optional chaining + nullish coalescing