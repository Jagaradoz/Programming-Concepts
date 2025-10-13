// 1. Strict equality (checks value and type)
let a = 5;
let b = "5";

console.log(a === 5);      // true   → same value and type
console.log(a === b);      // false  → different type

// 2. Loose equality (==) (checks value only, type coercion)
console.log(a == b);       // true   → converts b to number

// 3. Not equal
console.log(a !== 5);      // false  → checks value and type
console.log(a != "5");     // false  → loose not equal, value comparison only

// 4. Greater than / less than
console.log(10 > 5);       // true
console.log(10 < 5);       // false
console.log(5 >= 5);       // true
console.log(5 <= 10);      // true

// 5. Comparing strings
console.log("apple" === "apple");    // true
console.log("apple" > "banana");     // false → compares lexicographically
console.log("Apple" < "apple");      // true  → uppercase letters come first in Unicode

// 6. Comparing different types
console.log(0 == false);     // true   → loose equality converts types
console.log(0 === false);    // false  → strict equality, different types
console.log(null == undefined);   // true   → loose equality
console.log(null === undefined);  // false  → strict equality

// 7. NaN comparisons
console.log(NaN === NaN);     // false  → NaN is not equal to itself
console.log(Number.isNaN(NaN)); // true → proper check for NaN

// 8. Objects & arrays
let obj1 = {x: 1};
let obj2 = {x: 1};
let obj3 = obj1;

console.log(obj1 === obj2);   // false → different references
console.log(obj1 === obj3);   // true  → same reference

let arr1 = [1, 2];
let arr2 = [1, 2];
console.log(arr1 === arr2);   // false → different arrays in memory

// 9. Boolean conversion for strict comparisons
console.log(true === 1);      // false → different types
console.log(true == 1);       // true  → loose equality converts true to 1

// 10. Summary
// Use === for strict equality (recommended)
// Use !== for strict not equal
// Use == or != only when intentional type coercion is desired