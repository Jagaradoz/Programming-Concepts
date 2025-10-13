// 1. Selecting Elements
document.getElementById("myId");                     // Select by ID
document.getElementsByClassName("myClass");          // Select by class (HTMLCollection)
document.getElementsByTagName("div");                // Select by tag name (HTMLCollection)
document.querySelector(".myClass");                  // Select first match (CSS selector)
document.querySelectorAll(".myClass");               // Select all matches (NodeList)

// Example:
let title = document.getElementById("title");
let buttons = document.querySelectorAll(".btn");

// 2. Changing Content
title.innerHTML = "New <b>Title</b>";                // Change HTML content
title.textContent = "Plain text only";               // Change text only (no HTML tags)
title.innerText = "Visible text only";                // Similar but respects CSS visibility

// 3. Changing Attributes
let img = document.querySelector("img");
img.src = "image.jpg";                               // Change image source
img.alt = "Description";                             // Change alt text
img.setAttribute("width", "200");                     // Set any attribute
img.getAttribute("src");                              // Get attribute value
img.removeAttribute("alt");                           // Remove attribute

// 4. Changing Styles (CSS)
title.style.color = "red";                            // Change text color
title.style.backgroundColor = "yellow";               // Change background color
title.style.fontSize = "24px";                        // Change font size
title.style.display = "none";                         // Hide element
title.style.display = "block";                        // Show element

// 5. Class Manipulation
title.classList.add("highlight");                     // Add class
title.classList.remove("highlight");                  // Remove class
title.classList.toggle("hidden");                     // Toggle class
title.classList.contains("hidden");                   // Check if class exists

// 6. Creating & Adding Elements
let newDiv = document.createElement("div");           // Create new element
newDiv.textContent = "Hello!";                        // Set content
document.body.appendChild(newDiv);                    // Add to end of body
document.body.prepend(newDiv);                        // Add to start of body

let list = document.querySelector("ul");
let newItem = document.createElement("li");
newItem.textContent = "New item";
list.appendChild(newItem);                            // Add inside <ul>

// 7. Removing Elements
list.removeChild(newItem);                            // Remove specific child
newDiv.remove();                                      // Directly remove element

// 8. Replacing Elements
let newHeading = document.createElement("h2");
newHeading.textContent = "Replaced Heading";
title.replaceWith(newHeading);                        // Replace old element

// 9. Event Handling
let btn = document.querySelector("#btn");
btn.addEventListener("click", function() {            // Add click event
  alert("Button clicked!");
});
btn.removeEventListener("click", myFunction);         // Remove event

function myFunction() {
  console.log("Hello");
}

// Shortcut
btn.onclick = () => alert("Clicked!");                // Simple event handler

// 10. Form & Input Manipulation
let input = document.querySelector("#username");
input.value = "JohnDoe";                              // Set input value
console.log(input.value);                             // Get input value
input.placeholder = "Enter your name";                // Change placeholder

let form = document.querySelector("form");
form.addEventListener("submit", e => {
  e.preventDefault();                                 // Prevent form reload
  console.log("Form submitted!");
});

// 11. Traversing the DOM
let container = document.querySelector(".container");
container.children;                                   // Get child elements (HTMLCollection)
container.firstElementChild;                          // First child element
container.lastElementChild;                           // Last child element
container.parentElement;                              // Parent element
container.nextElementSibling;                         // Next sibling
container.previousElementSibling;                     // Previous sibling

// 12. Modifying HTML Structure (insertAdjacent)
title.insertAdjacentHTML("beforebegin", "<hr>");      // Insert before element
title.insertAdjacentHTML("afterbegin", "<span>*</span>"); // Inside, before content
title.insertAdjacentHTML("beforeend", "<span>!</span>");  // Inside, after content
title.insertAdjacentHTML("afterend", "<hr>");         // After element

// 13. Scroll & View Control
window.scrollTo(0, 500);                              // Scroll to Y position
element.scrollIntoView({ behavior: "smooth" });        // Scroll element into view

// 14. Document Info
document.title;                                       // Get page title
document.URL;                                         // Get page URL
document.domain;                                      // Get domain
document.lastModified;                                // Get last modified date

// 15. Timers & Interaction
setTimeout(() => alert("Hello after 2s"), 2000);      // Run once after delay
let interval = setInterval(() => console.log("Tick"), 1000); // Run repeatedly
clearInterval(interval);                              // Stop interval