// ----------------------------
// Date object cheat sheet (JavaScript)
// ----------------------------

// 1. Creating dates
let now = new Date();                            // Current date and time
let specific = new Date("2025-10-09");           // Specific date (YYYY-MM-DD)
let specificTime = new Date("2025-10-09T15:30:00"); // Specific date & time
let fromParts = new Date(2025, 9, 9, 15, 30, 0);    // Year, month(0-based), day, hr, min, sec
let fromTimestamp = new Date(1696841400000);     // From milliseconds since 1970-01-01

// 2. Getting date components
let d = new Date();
d.getFullYear();                                 // Year (4 digits)
d.getMonth();                                    // Month (0-11)
d.getDate();                                     // Day of month (1-31)
d.getDay();                                      // Day of week (0-Sunday, 6-Saturday)
d.getHours();                                    // Hour (0-23)
d.getMinutes();                                  // Minutes (0-59)
d.getSeconds();                                  // Seconds (0-59)
d.getMilliseconds();                             // Milliseconds (0-999)
d.getTime();                                     // Timestamp in ms since 1970-01-01

// 3. Setting date components
d.setFullYear(2026);
d.setMonth(11);                                  // December
d.setDate(25);
d.setHours(10);
d.setMinutes(30);
d.setSeconds(0);
d.setMilliseconds(500);

// 4. Date formatting
d.toString();                                    // Full string: "Fri Dec 25 2026 10:30:00 GMT+0700"
d.toDateString();                                // "Fri Dec 25 2026"
d.toTimeString();                                // "10:30:00 GMT+0700"
d.toISOString();                                 // "2026-12-25T03:30:00.500Z"
d.toUTCString();                                 // "Fri, 25 Dec 2026 03:30:00 GMT"
d.toLocaleDateString();                          // Locale formatted date
d.toLocaleTimeString();                          // Locale formatted time

// 5. Date arithmetic
let start = new Date("2025-10-09");
let end = new Date("2025-10-15");
let diffMs = end - start;                         // Difference in milliseconds
let diffDays = diffMs / (1000 * 60 * 60 * 24);   // Convert to days
console.log(diffDays);                            // 6

// 6. Comparing dates
let d1 = new Date("2025-10-09");
let d2 = new Date("2025-10-10");
console.log(d1 > d2);                             // false
console.log(d1 < d2);                             // true
console.log(d1.getTime() === d2.getTime());       // false

// 7. Timestamp & now
Date.now();                                       // Current timestamp in milliseconds
new Date().getTime();                             // Same as Date.now()

// 8. Parsing dates
Date.parse("2025-10-09T15:30:00");               // Returns milliseconds since 1970

// 9. Useful patterns
// Add days to a date
function addDays(date, days) {
  let copy = new Date(date);
  copy.setDate(copy.getDate() + days);
  return copy;
}
console.log(addDays(new Date(), 5));             // Date 5 days from now

// Difference in days between two dates
function diffInDays(d1, d2) {
  return Math.floor((d2 - d1) / (1000 * 60 * 60 * 24));
}
console.log(diffInDays(new Date("2025-10-01"), new Date("2025-10-09"))); // 8

// ----------------------------
// End of Date object cheat sheet
// ----------------------------
