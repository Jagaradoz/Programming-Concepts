// 1. Setting a cookie
document.cookie = "username=Alice";               // simple cookie

// 2. Setting a cookie with options
document.cookie = "username=Alice; expires=Fri, 31 Dec 2025 23:59:59 GMT; path=/; secure; samesite=Strict";
// options:
// - expires: sets expiration date (GMT string)
// - max-age: sets lifetime in seconds
// - path: URL path the cookie is valid for
// - domain: domain the cookie is valid for
// - secure: cookie only sent over HTTPS
// - samesite: controls cross-site request behavior (Strict, Lax, None)

// 3. Reading cookies
console.log(document.cookie);                     // "username=Alice; theme=dark"

// 4. Getting a specific cookie
function getCookie(name) {
  const cookies = document.cookie.split("; ");
  for (let cookie of cookies) {
    const [key, value] = cookie.split("=");
    if (key === name) return value;
  }
  return null;
}
console.log(getCookie("username"));               // "Alice"

// 5. Updating a cookie
document.cookie = "username=Bob; path=/";        // overwrite by same name + path

// 6. Deleting a cookie
document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/"; // expire in the past

// 7. Using max-age instead of expires
document.cookie = "theme=dark; max-age=3600; path=/"; // expires in 1 hour

// 8. Encoding cookie values
const value = "Alice & Bob";
document.cookie = `user=${encodeURIComponent(value)}; path=/`;
console.log(decodeURIComponent(getCookie("user"))); // "Alice & Bob"

// Notes:
// - Cookies are small key-value strings stored by the browser
// - Accessible via document.cookie in JS
// - Limited in size (~4KB per cookie)
// - Use secure, samesite, and path options for better security