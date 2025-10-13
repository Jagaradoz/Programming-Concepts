// 1. Copying arrays
let arr1 = [1, 2, 3];
let arr2 = [...arr1];                             // [1, 2, 3] → shallow copy
arr2.push(4);
console.log(arr1);                                // [1, 2, 3]
console.log(arr2);                                // [1, 2, 3, 4]

// 2. Merging arrays
let fruits = ["apple", "banana"];
let veggies = ["carrot", "spinach"];
let food = [...fruits, ...veggies];               // ["apple", "banana", "carrot", "spinach"]

// 3. Copying objects
let obj1 = { a: 1, b: 2 };
let obj2 = { ...obj1 };                           // { a: 1, b: 2 }
obj2.c = 3;
console.log(obj1);                                // { a: 1, b: 2 }
console.log(obj2);                                // { a: 1, b: 2, c: 3 }

// 4. Merging objects
let defaults = { host: "localhost", port: 80 };
let options = { port: 8080, debug: true };
let config = { ...defaults, ...options };         // { host: "localhost", port: 8080, debug: true }

// 5. Converting iterable to array
let str = "hello";
let chars = [...str];                             // ["h", "e", "l", "l", "o"]

let set = new Set([1, 2, 3]);
let arrFromSet = [...set];                        // [1, 2, 3]

// 6. Using in function arguments
function sum(a, b, c) { return a + b + c; }
let nums = [1, 2, 3];
console.log(sum(...nums));                        // 6

// 7. Rest parameter vs spread operator
function collect(...args) {                        // ...args collects values into array
  console.log(args);
}
collect(1, 2, 3, 4);                               // [1, 2, 3, 4]

// 8. Copying nested objects (shallow copy warning)
let nested = { x: 1, y: { z: 2 } };
let copyNested = { ...nested };
copyNested.y.z = 5;
console.log(nested.y.z);                          // 5 → inner object is shared

// 9. Combining with destructuring
let numbers = [1, 2, 3, 4];
let [first, ...rest] = numbers;                   // first=1, rest=[2,3,4]
console.log(first, rest);

// 10. Spread with maps or sets
let map = new Map([["a", 1], ["b", 2]]);
let entries = [...map];                            // [["a",1], ["b",2]]