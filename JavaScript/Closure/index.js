// 1. What is a closure?
// A closure is a function that "remembers" variables from its outer scope even after the outer function has finished executing.

// 2. Basic closure example
function outer() {
  let count = 0;                                   // outer variable

  function inner() {                               // inner function forms closure
    count++;
    console.log(count);
  }

  return inner;
}

const counter = outer();                           // outer() executed, inner() returned
counter();                                         // 1
counter();                                         // 2
counter();                                         // 3

// 3. Closure with parameters
function makeMultiplier(x) {
  return function(y) {
    return x * y;                                  // inner function remembers x
  };
}

const double = makeMultiplier(2);
console.log(double(5));                            // 10

const triple = makeMultiplier(3);
console.log(triple(5));                            // 15

// 4. Private variables using closures
function createBankAccount(initialBalance) {
  let balance = initialBalance;                    // private variable

  return {
    deposit(amount) {
      balance += amount;
      return balance;
    },
    withdraw(amount) {
      if (amount <= balance) balance -= amount;
      return balance;
    },
    getBalance() {
      return balance;
    }
  };
}

const account = createBankAccount(100);
console.log(account.getBalance());                 // 100
account.deposit(50);
console.log(account.getBalance());                 // 150
account.withdraw(70);
console.log(account.getBalance());                 // 80

// 5. Using closures in loops (common pitfall)
// Without closure: var creates function-scoped variable, may cause issues
for (var i = 1; i <= 3; i++) {
  setTimeout(function() {
    console.log("var i:", i);                      // 4,4,4
  }, 1000);
}

// With closure using IIFE
for (var j = 1; j <= 3; j++) {
  (function(jCopy) {
    setTimeout(function() {
      console.log("closure j:", jCopy);           // 1,2,3
    }, 1000);
  })(j);
}

// Using let (block-scoped) solves same problem
for (let k = 1; k <= 3; k++) {
  setTimeout(function() {
    console.log("let k:", k);                     // 1,2,3
  }, 1000);
}

// 6. Closures summary
// - Inner functions can access outer variables
// - Useful for data privacy (private variables)
// - Often used in callbacks, event handlers, and functional programming