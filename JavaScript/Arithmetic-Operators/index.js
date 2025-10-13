// Basic arithmetic
let a = 10;
let b = 3;

let addition        = a + b;             // 13   → Addition
let subtraction     = a - b;             // 7    → Subtraction
let multiplication  = a * b;             // 30   → Multiplication
let division        = a / b;             // 3.333... → Division
let remainder       = a % b;             // 1    → Modulus (remainder)
let exponent        = a ** b;            // 1000 → Exponentiation (a^b)

// Increment & Decrement
let x = 5;
x++;                                     // 6    → Post-increment (adds 1 after use)
++x;                                     // 7    → Pre-increment (adds 1 before use)

x--;                                     // 6    → Post-decrement (subtracts 1 after use)
--x;                                     // 5    → Pre-decrement (subtracts 1 before use)

// Unary plus & minus
let y = "5";
let unaryPlus       = +y;                // 5    → Converts string to number
let unaryMinus      = -y;                // -5   → Negates after conversion

// Compound assignment operators
let c = 10;
c += 5;                                  // 15   → Add and assign (c = c + 5)
c -= 3;                                  // 12   → Subtract and assign (c = c - 3)
c *= 2;                                  // 24   → Multiply and assign (c = c * 2)
c /= 4;                                  // 6    → Divide and assign (c = c / 4)
c %= 4;                                  // 2    → Modulus and assign (c = c % 4)
c **= 3;                                 // 8    → Exponent and assign (c = c ** 3)

// Operator precedence
let result = 10 + 5 * 2;                 // 20   → Multiplication before addition
let grouped = (10 + 5) * 2;              // 30   → Parentheses change order

// Special numeric values
let divByZero      = 5 / 0;              // Infinity
let invalidCalc    = "hello" * 3;        // NaN (Not a Number)
