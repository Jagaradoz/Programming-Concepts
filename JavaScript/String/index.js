// 1. Creating strings
let str1 = "Hello";                             // String literal
let str2 = 'World';                             // Single quotes
let str3 = `Template literal`;                  // Backticks (ES6)
let strObj = new String("Hello Object");        // String object (rarely used)

// 2. Accessing characters
let word = "JavaScript";
console.log(word[0]);                           // "J"
console.log(word.charAt(1));                    // "a"
console.log(word.charCodeAt(0));                // 74 (Unicode code)
console.log(word.at(-1));                       // "t" (ES2022)

// 3. String length
console.log(word.length);                       // 10

// 4. Concatenation
let full = str1 + " " + str2;                   // "Hello World"
let concat = str1.concat(" ", str2);            // "Hello World"
let temp = `${str1} ${str2}!`;                  // Using template literal

// 5. Changing case
let mixed = "JaVaScRiPt";
console.log(mixed.toUpperCase());               // "JAVASCRIPT"
console.log(mixed.toLowerCase());               // "javascript"

// 6. Searching within strings
let text = "I love JavaScript";
console.log(text.indexOf("love"));              // 2
console.log(text.lastIndexOf("a"));             // 10
console.log(text.includes("Java"));             // true
console.log(text.startsWith("I"));              // true
console.log(text.endsWith("Script"));           // true
console.log(text.search("Java"));               // 7 (similar to indexOf)
console.log(text.match(/a/g));                  // ['a', 'a'] (regex match)
console.log(text.matchAll(/a/g));               // returns iterator (ES2020)

// 7. Extracting substrings
let phrase = "Hello World";
console.log(phrase.slice(0, 5));                // "Hello" (supports negatives)
console.log(phrase.substring(0, 5));            // "Hello" (no negatives)
console.log(phrase.substr(6, 5));               // "World" (deprecated)

// 8. Replacing text
let replaced = phrase.replace("World", "JavaScript");
console.log(replaced);                          // "Hello JavaScript"
let replacedAll = phrase.replaceAll("l", "L");  // "HeLLo WorLd" (ES2021)
console.log(replacedAll);

// 9. Trimming whitespace
let spaced = "   Trim me   ";
console.log(spaced.trim());                     // "Trim me"
console.log(spaced.trimStart());                // "Trim me   "
console.log(spaced.trimEnd());                  // "   Trim me"

// 10. Splitting and joining
let csv = "red,green,blue";
let colors = csv.split(",");                    // ["red", "green", "blue"]
console.log(colors.join(" | "));                // "red | green | blue"

// 11. Padding
let num = "5";
console.log(num.padStart(3, "0"));              // "005"
console.log(num.padEnd(3, "*"));                // "5**"

// 12. Repeating strings
let laugh = "ha";
console.log(laugh.repeat(3));                   // "hahaha"

// 13. Comparing strings
console.log("apple".localeCompare("banana"));   // -1 (before alphabetically)
console.log("apple" === "apple");               // true (strict comparison)

// 14. Template literals (interpolation & multiline)
let name = "Alice";
let greeting = `Hello, ${name}!
Welcome to JavaScript.`;
console.log(greeting);

// 15. Escaping characters
let quote = "He said, \"Hello!\"";              // Using escape
let path = "C:\\Users\\Alice";                  // Backslash escape
let multi = "Line1\nLine2\tTabbed";             // \n new line, \t tab

// 16. Converting to string
let numVal = 123;
console.log(numVal.toString());                 // "123"
console.log(String(true));                      // "true"

// 17. Raw strings
console.log(String.raw`Line1\nLine2`);          // "Line1\nLine2" (no escape)