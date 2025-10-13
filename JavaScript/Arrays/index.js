// 1. Creating arrays
let arr1 = [1, 2, 3];                              // Array literal
let arr2 = new Array(4, 5, 6);                     // Array constructor
let arr3 = Array.of(7, 8, 9);                      // Create array from values
let arr4 = Array(3).fill(0);                       // [0, 0, 0] filled array

// 2. Accessing elements
console.log(arr1[0]);                               // 1
console.log(arr1[arr1.length - 1]);                 // Last element

// 3. Adding elements
arr1.push(4);                                      // Add to end
arr1.unshift(0);                                   // Add to start
arr1.splice(2, 0, 1.5);                            // Add at index 2 without removing

// 4. Removing elements
arr1.pop();                                        // Remove last
arr1.shift();                                      // Remove first
arr1.splice(2, 1);                                 // Remove 1 element at index 2
arr1.length = 2;                                   // Truncate array

// 5. Finding elements
let nums = [10, 20, 30, 40];
console.log(nums.indexOf(20));                     // 1
console.log(nums.lastIndexOf(30));                 // 2
console.log(nums.includes(25));                    // false
console.log(nums.find(n => n > 25));              // 30 → first match
console.log(nums.findIndex(n => n > 25));         // 2 → index of first match

// 6. Iterating over arrays
nums.forEach(n => console.log(n));                 // Loop without returning
let doubled = nums.map(n => n * 2);               // Map returns new array
console.log(doubled);                              // [20, 40, 60, 80]
let filtered = nums.filter(n => n > 20);          // Filter elements
console.log(filtered);                             // [30, 40]

// 7. Reducing arrays
let sum = nums.reduce((total, n) => total + n, 0); // 100 → sum
let max = nums.reduce((a, b) => (a > b ? a : b));  // 40 → max value

// 8. Sorting and reversing
let letters = ["b", "c", "a"];
letters.sort();                                    // ["a", "b", "c"] → alphabetically
letters.sort((a, b) => b.localeCompare(a));       // ["c", "b", "a"] → descending
nums.sort((a, b) => a - b);                        // Numeric ascending
nums.reverse();                                    // Reverse array

// 9. Joining & splitting
let csv = nums.join(", ");                         // "10, 20, 30, 40"
let str = "red,green,blue";
let colors = str.split(",");                       // ["red", "green", "blue"]

// 10. Slicing & splicing
let arrSlice = nums.slice(1, 3);                  // [20, 30] → non-destructive
nums.splice(1, 2, 25, 35);                        // [10, 25, 35, 40] → remove 2, add 25,35

// 11. Flattening arrays
let nested = [1, [2, 3], [4, [5]]];
console.log(nested.flat());                        // [1, 2, 3, 4, [5]]
console.log(nested.flat(2));                       // [1, 2, 3, 4, 5]

// 12. Array checking
console.log(Array.isArray(nums));                 // true

// 13. Copying arrays
let copy = [...nums];                              // Spread syntax
let copy2 = nums.slice();                          // Using slice

// 14. Filling and generating
let zeros = Array(5).fill(0);                      // [0, 0, 0, 0, 0]
let keys = Array.from({length: 5}, (_, i) => i);   // [0, 1, 2, 3, 4]

// 15. Finding some / every
console.log(nums.some(n => n > 30));              // true → at least one
console.log(nums.every(n => n > 5));              // true → all satisfy

// 16. Reducing multidimensional arrays
let matrix = [[1, 2], [3, 4]];
let flatSum = matrix.flat().reduce((a, b) => a + b); // 10