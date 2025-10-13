// ----------------------------
// Number object & formatting methods cheat sheet (JavaScript)
// ----------------------------

// 1. Creating numbers
let num1 = 123456.789;                           // Number literal
let numObj = new Number(100);                    // Number object (rarely used)

// 2. Converting numbers to strings
console.log(num1.toString());                    // "123456.789"
console.log(num1.toFixed(2));                    // "123456.79" → fixed decimals
console.log(num1.toExponential(3));             // "1.235e+5" → exponential notation
console.log(num1.toPrecision(6));               // "123457" → total significant digits

// 3. Converting numbers to different bases
let dec = 255;
console.log(dec.toString(2));                    // "11111111" → binary
console.log(dec.toString(8));                    // "377" → octal
console.log(dec.toString(16));                   // "ff" → hexadecimal

// 4. Locale-aware formatting
let price = 123456.789;

// format as currency
console.log(price.toLocaleString("en-US", { style: "currency", currency: "USD" }));  // "$123,456.79"
console.log(price.toLocaleString("de-DE", { style: "currency", currency: "EUR" }));  // "123.456,79 €"

// format as percent
let percent = 0.123;
console.log(percent.toLocaleString("en-US", { style: "percent", minimumFractionDigits: 2 })); // "12.30%"

// format as unit
let distance = 5000;
console.log(distance.toLocaleString("en-US", { style: "unit", unit: "kilometer" }));   // "5,000 km"

// 5. Locale-aware number formatting
console.log(num1.toLocaleString());              // Default locale formatting
console.log(num1.toLocaleString("de-DE"));       // German locale formatting: "123.456,789"
console.log(num1.toLocaleString("ja-JP"));       // Japanese locale formatting

// 6. Converting strings to numbers
console.log(Number("123"));                       // 123
console.log(Number("123.45"));                    // 123.45
console.log(parseInt("123abc"));                  // 123
console.log(parseFloat("123.45abc"));            // 123.45

// 7. Checking numbers
console.log(Number.isFinite(123));               // true
console.log(Number.isInteger(123.45));           // false
console.log(Number.isNaN(NaN));                  // true

// ----------------------------
// End of Number object & formatting cheat sheet
// ----------------------------
