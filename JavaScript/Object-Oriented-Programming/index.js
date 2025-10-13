// 1. Creating a class
class Person {
  constructor(name, age) {                        // Constructor method
    this.name = name;                             // Instance property
    this.age = age;
  }

  greet() {                                       // Method
    console.log(`Hello, my name is ${this.name}`);
  }
}

const alice = new Person("Alice", 25);
alice.greet();                                    // "Hello, my name is Alice"

// 2. Class inheritance
class Student extends Person {
  constructor(name, age, grade) {
    super(name, age);                             // Call parent constructor
    this.grade = grade;
  }

  study() {                                       // Child method
    console.log(`${this.name} is studying in grade ${this.grade}`);
  }
}

const bob = new Student("Bob", 16, 10);
bob.greet();                                      // Inherited method
bob.study();                                      // Child method

// 3. Static methods and properties
class MathHelper {
  static pi = 3.14159;                            // Static property
  static circleArea(radius) {                     // Static method
    return MathHelper.pi * radius ** 2;
  }
}
console.log(MathHelper.circleArea(5));           // 78.53975

// 4. Getters and setters
class Rectangle {
  constructor(width, height) {
    this.width = width;
    this.height = height;
  }

  get area() {                                    // Getter
    return this.width * this.height;
  }

  set dimensions({ width, height }) {            // Setter with object destructuring
    this.width = width;
    this.height = height;
  }
}

const rect = new Rectangle(10, 5);
console.log(rect.area);                           // 50
rect.dimensions = { width: 20, height: 10 };
console.log(rect.area);                           // 200

// 5. Encapsulation (private fields) (ES2022)
class BankAccount {
  #balance = 0;                                   // Private field

  constructor(owner) {
    this.owner = owner;
  }

  deposit(amount) {                               // Public method
    this.#balance += amount;
  }

  getBalance() {                                  // Public getter
    return this.#balance;
  }
}

const acc = new BankAccount("Alice");
acc.deposit(500);
console.log(acc.getBalance());                    // 500
// console.log(acc.#balance);                    // Error: private field

// 6. Polymorphism (method overriding)
class Animal {
  speak() {
    console.log("Animal makes a sound");
  }
}
class Dog extends Animal {
  speak() {                                       // Override parent method
    console.log("Dog barks");
  }
}
const dog = new Dog();
dog.speak();                                     // "Dog barks"

// 7. Object creation without class (prototype-based OOP)
function Vehicle(type, speed) {
  this.type = type;
  this.speed = speed;
}

Vehicle.prototype.move = function() {
  console.log(`${this.type} moves at ${this.speed} km/h`);
};

const car = new Vehicle("Car", 120);
car.move();                                      // "Car moves at 120 km/h"

// 8. instanceof operator
console.log(bob instanceof Student);            // true
console.log(bob instanceof Person);             // true
console.log(car instanceof Vehicle);            // true

// 9. Summary
// - Classes encapsulate data and behavior
// - Inheritance allows extending functionality
// - Static methods belong to the class itself
// - Private fields (#) protect internal data
// - Polymorphism enables method overriding
