// 1. localStorage vs sessionStorage
// - localStorage: persists even after browser is closed
// - sessionStorage: cleared when the browser tab is closed

// 2. Setting items
localStorage.setItem("username", "Alice");
sessionStorage.setItem("sessionID", "12345");

// 3. Getting items
console.log(localStorage.getItem("username"));      // "Alice"
console.log(sessionStorage.getItem("sessionID"));   // "12345"

// 4. Removing items
localStorage.removeItem("username");
sessionStorage.removeItem("sessionID");

// 5. Clearing all items
localStorage.clear();                               // clears all localStorage
sessionStorage.clear();                             // clears all sessionStorage

// 6. Storing objects
const user = { name: "Bob", age: 30 };

// Convert object to JSON string before storing
localStorage.setItem("user", JSON.stringify(user));

// Retrieve and parse back to object
const storedUser = JSON.parse(localStorage.getItem("user"));
console.log(storedUser.name);                       // "Bob"

// 7. Checking storage length and keys
console.log(localStorage.length);                   // number of items in localStorage
console.log(localStorage.key(0));                   // key at index 0

// 8. Example: toggle theme and persist
function toggleTheme() {
  const theme = localStorage.getItem("theme") === "dark" ? "light" : "dark";
  localStorage.setItem("theme", theme);
  document.body.setAttribute("data-theme", theme);
}
toggleTheme();

// 9. Notes / best practices
// - Storage size ~5-10MB per origin (browser dependent)
// - Only strings can be stored; objects must be JSON.stringified
// - Use try/catch when parsing JSON to avoid errors
try {
  const data = JSON.parse(localStorage.getItem("invalidJSON"));
} catch (error) {
  console.error("Invalid JSON in storage:", error);
}