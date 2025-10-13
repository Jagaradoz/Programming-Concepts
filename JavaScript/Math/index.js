// 1. Basic Constants
Math.PI;                 // 3.141592653589793    → π
Math.E;                  // 2.718281828459045    → Euler's number
Math.LN2;                // 0.6931471805599453   → Natural log of 2
Math.LN10;               // 2.302585092994046    → Natural log of 10
Math.LOG2E;              // 1.4426950408889634   → log₂(e)
Math.LOG10E;             // 0.4342944819032518   → log₁₀(e)
Math.SQRT2;              // 1.4142135623730951   → √2
Math.SQRT1_2;            // 0.7071067811865476   → 1/√2

// 2. Rounding Methods
Math.round(4.6);         // 5     → Round to nearest integer
Math.floor(4.9);         // 4     → Round down
Math.ceil(4.1);          // 5     → Round up
Math.trunc(4.9);         // 4     → Remove decimal part
Math.sign(-7);           // -1    → Returns sign: -1, 0, or 1

// 3. Exponents & Roots
Math.pow(2, 3);          // 8     → 2³
Math.sqrt(16);           // 4     → √16
Math.cbrt(27);           // 3     → ³√27
Math.exp(1);             // 2.718... → e¹
Math.expm1(1);           // e¹ - 1 → 1.718...

// 4. Logarithms
Math.log(10);            // 2.302... → Natural log (base e)
Math.log2(8);            // 3        → Log base 2
Math.log10(100);         // 2        → Log base 10
Math.log1p(9);           // log(1 + 9) → Natural log of (1 + x)

// 5. Trigonometric Functions (radians)
Math.sin(Math.PI / 2);   // 1        → sin(90°)
Math.cos(0);             // 1        → cos(0°)
Math.tan(Math.PI / 4);   // 1        → tan(45°)
Math.asin(1);            // 1.5708   → arcsin(1) = π/2
Math.acos(0);            // 1.5708   → arccos(0) = π/2
Math.atan(1);            // 0.7854   → arctan(1) = π/4
Math.atan2(1, 1);        // 0.7854   → atan2(y, x), considers quadrants

// Convert degrees ↔ radians
let deg = 180;
let rad = deg * (Math.PI / 180);             // Degrees to radians
let degrees = rad * (180 / Math.PI);         // Radians to degrees

// 6. Absolute & Sign
Math.abs(-5);            // 5        → Absolute value
Math.sign(42);           // 1        → Sign (1 for +, -1 for -, 0 for 0)

// 7. Random Numbers
Math.random();           // Random number 0 ≤ x < 1
Math.floor(Math.random() * 10);              // 0–9 random integer
Math.floor(Math.random() * (max - min + 1)) + min; // Random int in range

// Example: Random number between 5 and 15
let randomNum = Math.floor(Math.random() * (15 - 5 + 1)) + 5;

// 8. Min & Max
Math.max(5, 10, 2);      // 10       → Largest value
Math.min(5, 10, 2);      // 2        → Smallest value
Math.max(...[1, 2, 3]);  // 3        → Spread syntax with array

// 9. Hypotenuse & Other Utilities
Math.hypot(3, 4);        // 5        → √(3² + 4²)
Math.clz32(1);           // 31       → Leading zeros in 32-bit binary
Math.imul(2, 4);         // 8        → 32-bit integer multiplication
Math.fround(1.23456789); // 1.2345678806304932 → 32-bit float precision
Math.hypot(3, 4, 5);     // 7.071... → Extended hypot()

// 10. Useful Patterns
let randomFloat = (min, max) => Math.random() * (max - min) + min; // Random float
let randomInt   = (min, max) => Math.floor(Math.random() * (max - min + 1)) + min;
let roundTo     = (num, dec) => Math.round(num * 10**dec) / 10**dec; // Round to n decimals