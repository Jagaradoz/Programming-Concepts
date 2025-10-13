// 1. Creating a promise
const myPromise = new Promise((resolve, reject) => {
  let success = true;
  if (success) {
    resolve("Operation succeeded");              // resolve value
  } else {
    reject("Operation failed");                  // reject value
  }
});

// 2. Consuming a promise
myPromise
  .then((result) => {
    console.log(result);                         // "Operation succeeded"
  })
  .catch((error) => {
    console.log(error);
  })
  .finally(() => {
    console.log("Promise settled");              // always runs
  });

// 3. Promise chaining
new Promise((resolve, reject) => {
  resolve(5);
})
  .then((num) => num * 2)                        // 10
  .then((num) => num + 3)                        // 13
  .then((result) => console.log("Result:", result))
  .catch((error) => console.log(error));

// 4. Returning promises inside then
function asyncMultiply(x) {
  return new Promise((resolve) => {
    setTimeout(() => resolve(x * 2), 1000);
  });
}

asyncMultiply(5)
  .then((res) => asyncMultiply(res))
  .then((res) => console.log("Final result:", res)); // Final result: 20

// 5. Promise.all (wait for multiple promises)
const p1 = Promise.resolve(1);
const p2 = new Promise((resolve) => setTimeout(() => resolve(2), 500));
const p3 = 3;                                   // non-promise value auto-converted

Promise.all([p1, p2, p3]).then((values) => {
  console.log(values);                           // [1,2,3]
});

// 6. Promise.race (first settled promise wins)
const fast = new Promise((resolve) => setTimeout(() => resolve("fast"), 100));
const slow = new Promise((resolve) => setTimeout(() => resolve("slow"), 500));

Promise.race([fast, slow]).then((result) => {
  console.log(result);                           // "fast"
});

// 7. Async / await (syntactic sugar over promises)
async function fetchData() {
  try {
    const data = await new Promise((resolve) => setTimeout(() => resolve("Data fetched"), 1000));
    console.log(data);                            // "Data fetched"
  } catch (error) {
    console.log(error);
  } finally {
    console.log("Async operation finished");
  }
}
fetchData();

// 8. Error handling in async/await
async function failOperation() {
  try {
    await Promise.reject("Something went wrong");
  } catch (error) {
    console.log("Caught error:", error);         // "Caught error: Something went wrong"
  }
}

// 9. Fetch API (built-in method for HTTP requests)

// Basic GET request
fetch("https://jsonplaceholder.typicode.com/todos/1")
  .then((response) => {
    if (!response.ok) throw new Error("Network response was not ok");
    return response.json();                       // parse JSON body
  })
  .then((data) => console.log(data))             // logs fetched data
  .catch((error) => console.log("Fetch error:", error));

// Async/await version
async function fetchTodo() {
  try {
    const response = await fetch("https://jsonplaceholder.typicode.com/todos/1");
    if (!response.ok) throw new Error("Network response was not ok");
    const data = await response.json();
    console.log(data);
  } catch (error) {
    console.log("Fetch error:", error);
  } finally {
    console.log("Fetch operation finished");
  }
}
fetchTodo();

// POST request example
async function createTodo() {
  try {
    const response = await fetch("https://jsonplaceholder.typicode.com/todos", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ title: "New Todo", completed: false })
    });
    const data = await response.json();
    console.log("Created:", data);
  } catch (error) {
    console.log("POST error:", error);
  }
}
createTodo();