export const PI = 3.14159;                        // Named export
export const E = 2.718;

export function add(a, b) {                       // Named function export
  return a + b;
}

export function multiply(a, b) {                  // Another named function
  return a * b;
}

export class Calculator {                         // Named class export
  constructor() {}
  square(x) { return x * x; }
}

// Default export (only one per file)
export default function greet(name) {
  return `Hello, ${name}!`;
}