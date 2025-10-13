// 1. Creating objects
let obj1 = {};                                   // Empty object
let obj2 = {                                    // Object with properties
  name: "Alice",
  age: 25,
  city: "Bangkok"
};

// 2. Accessing properties
console.log(obj2.name);                          // Dot notation → "Alice"
console.log(obj2["age"]);                        // Bracket notation → 25

// 3. Adding or updating properties
obj2.country = "Thailand";                       // Add new property
obj2.age = 26;                                   // Update existing property

// 4. Deleting properties
delete obj2.city;                                // Removes "city"

// 5. Checking properties
console.log("name" in obj2);                     // true → checks existence
console.log(obj2.hasOwnProperty("city"));        // false → own property only

// 6. Object methods
let person = {
  firstName: "Bob",
  lastName: "Smith",
  fullName() {                                   // Method
    return `${this.firstName} ${this.lastName}`;
  }
};
console.log(person.fullName());                  // "Bob Smith"

// 7. Iterating over objects
for (let key in obj2) {                          // Loop over keys
  console.log(key, ":", obj2[key]);
}

// 8. Object.keys / values / entries
console.log(Object.keys(obj2));                  // ["name", "age", "country"]
console.log(Object.values(obj2));                // ["Alice", 26, "Thailand"]
console.log(Object.entries(obj2));               // [["name","Alice"], ["age",26], ["country","Thailand"]]

// 9. Object.assign (copy/merge objects)
let objA = { a: 1, b: 2 };
let objB = { b: 3, c: 4 };
let merged = Object.assign({}, objA, objB);     // {a:1, b:3, c:4}
console.log(merged);

// 10. Object destructuring
let { name, age } = obj2;                        // Extract properties into variables
console.log(name, age);                          // "Alice", 26

// 11. Computed property names
let key = "score";
let student = {
  [key]: 95
};
console.log(student.score);                      // 95

// 12. Nested objects
let classroom = {
  teacher: { name: "Mr. Lee", subject: "Math" },
  students: ["Alice", "Bob"]
};
console.log(classroom.teacher.name);             // "Mr. Lee"

// 13. Object.freeze / seal / preventExtensions
const config = { theme: "dark" };
Object.freeze(config);                           // Cannot add, delete, or modify properties
// Object.seal(config);                           // Cannot add/delete, but can modify existing
// Object.preventExtensions(config);             // Cannot add new properties

// 14. Spread operator for objects (copy/merge)
let copy = { ...obj2 };                          // Shallow copy
let combined = { ...objA, ...objB };            // Merge objects

// 15. JSON conversion
let jsonStr = JSON.stringify(obj2);             // Convert object to JSON string
let parsedObj = JSON.parse(jsonStr);            // Convert JSON string back to object