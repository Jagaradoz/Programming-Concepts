// 1. Basic try-catch
try {
  let result = 10 / 0;                           // no error in JS, returns Infinity
  console.log(result);
} catch (error) {
  console.log("Error caught:", error.message);
}

// 2. Throwing an error
try {
  throw new Error("Something went wrong");       // manually throw an error
} catch (error) {
  console.log("Caught error:", error.message);   // "Caught error: Something went wrong"
}

// 3. Catching specific errors
try {
  JSON.parse("invalid json");                     // causes SyntaxError
} catch (error) {
  if (error instanceof SyntaxError) {
    console.log("Syntax error:", error.message);
  } else {
    console.log("Other error:", error.message);
  }
}

// 4. Finally block (executes always)
try {
  let x = 5;
  console.log("Try block executed");
} catch (error) {
  console.log(error);
} finally {
  console.log("Finally block executed");         // runs regardless of error
}

// 5. Custom error types
class ValidationError extends Error {
  constructor(message) {
    super(message);
    this.name = "ValidationError";
  }
}

function validateAge(age) {
  if (age < 0 || age > 120) {
    throw new ValidationError("Age must be between 0 and 120");
  }
  return true;
}

try {
  validateAge(150);
} catch (error) {
  console.log(error.name + ":", error.message);  // "ValidationError: Age must be between 0 and 120"
}

// 6. Nested try-catch
try {
  try {
    throw new Error("Inner error");
  } catch (innerError) {
    console.log("Caught inner:", innerError.message);
    throw innerError;                             // rethrow
  }
} catch (outerError) {
  console.log("Caught outer:", outerError.message);
}

// 7. Using throw with different types
try {
  throw "This is a string error";
} catch (error) {
  console.log(typeof error, error);              // string "This is a string error"
}