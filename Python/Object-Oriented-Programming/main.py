# 1. Basic Class and Object
class Person:
    def __init__(self, name, age):
        self.name = name                        # Instance variable
        self.age = age

    def greet(self):
        print(f"Hello, my name is {self.name}") # Instance method

p1 = Person("Alice", 25)                        # Create object
p1.greet()                                      # Call method

# ---------------------------

# 2. The __init__ Method (Constructor)
class Dog:
    def __init__(self, name, breed="Unknown"):
        self.name = name
        self.breed = breed                      # Default argument

dog1 = Dog("Buddy", "Golden Retriever")
dog2 = Dog("Max")                               # Uses default breed
print(dog1.breed)
print(dog2.breed)

# ---------------------------

# 3. Class Attributes vs Instance Attributes
class Car:
    wheels = 4                                  # Class attribute (shared)
    def __init__(self, color):
        self.color = color                      # Instance attribute

c1 = Car("red")
c2 = Car("blue")
print(c1.wheels, c1.color)
print(c2.wheels, c2.color)
Car.wheels = 3                                  # Change class attribute
print(c1.wheels, c2.wheels)

# ---------------------------

# 4. Methods
class Calculator:
    def add(self, a, b):                        # Instance method
        return a + b

    @classmethod
    def info(cls):                              # Class method
        print("This is a Calculator class.")

    @staticmethod
    def greet():                                # Static method
        print("Welcome to Calculator!")

calc = Calculator()
print(calc.add(5, 3))
Calculator.info()
Calculator.greet()

# ---------------------------

# 5. Encapsulation (Private Attributes)
class BankAccount:
    def __init__(self, balance):
        self.__balance = balance                # Private attribute

    def deposit(self, amount):
        self.__balance += amount

    def get_balance(self):
        return self.__balance                   # Accessor method

account = BankAccount(1000)
account.deposit(500)
print(account.get_balance())
# print(account.__balance)                      # ❌ Error: private attribute

# ---------------------------

# 6. Name Mangling (Access Private)
print(account._BankAccount__balance)            # Access private attribute (not recommended)

# ---------------------------

# 7. Inheritance
class Animal:
    def speak(self):
        print("Animal sound")

class Dog(Animal):
    def speak(self):
        print("Woof!")                          # Method overriding

dog = Dog()
dog.speak()                                     # Child method executed

# ---------------------------

# 8. super() Keyword
class Parent:
    def show(self):
        print("Parent method")

class Child(Parent):
    def show(self):
        super().show()                          # Call parent method
        print("Child method")

child = Child()
child.show()

# ---------------------------

# 9. Multiple Inheritance
class A:
    def featureA(self):
        print("Feature A")

class B:
    def featureB(self):
        print("Feature B")

class C(A, B):                                  # Multiple inheritance
    def featureC(self):
        print("Feature C")

c = C()
c.featureA()
c.featureB()
c.featureC()

# ---------------------------

# 10. Multilevel Inheritance
class Grandparent:
    def say(self):
        print("Grandparent")

class Parent(Grandparent):
    def say(self):
        print("Parent")

class Child(Parent):
    def say(self):
        print("Child")

child = Child()
child.say()                                     # Most specific method called

# ---------------------------

# 11. Polymorphism (Same Interface, Different Behavior)
class Bird:
    def fly(self):
        print("Bird is flying")

class Airplane:
    def fly(self):
        print("Airplane is flying")

for obj in [Bird(), Airplane()]:
    obj.fly()                                   # Same method, different behavior

# ---------------------------

# 12. Duck Typing
class Laptop:
    def code(self, ide):
        ide.execute()

class PyCharm:
    def execute(self):
        print("Compiling and Running")

class VSCode:
    def execute(self):
        print("Linting, Compiling and Running")

laptop = Laptop()
laptop.code(PyCharm())
laptop.code(VSCode())

# ---------------------------

# 13. Abstraction (Using ABC)
from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self):
        pass                                    # Abstract method (must be implemented)

class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return 3.14 * self.radius ** 2

circle = Circle(5)
print(circle.area())

# ---------------------------

# 14. Composition (Has-a Relationship)
class Engine:
    def start(self):
        print("Engine started")

class Car:
    def __init__(self):
        self.engine = Engine()                  # Composition

    def drive(self):
        self.engine.start()
        print("Car is moving")

car = Car()
car.drive()

# ---------------------------

# 15. Aggregation (Shared Object)
class Department:
    def __init__(self, name):
        self.name = name

class Employee:
    def __init__(self, name, dept):
        self.name = name
        self.dept = dept                        # Reference passed

dept1 = Department("IT")
emp1 = Employee("Alice", dept1)
print(emp1.dept.name)

# ---------------------------

# 16. __str__() and __repr__()
class Book:
    def __init__(self, title, author):
        self.title = title
        self.author = author

    def __str__(self):
        return f"{self.title} by {self.author}"  # Human-readable string

book = Book("1984", "George Orwell")
print(book)                                     # Calls __str__()

# ---------------------------

# 17. Operator Overloading
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __add__(self, other):                   # Overload +
        return Point(self.x + other.x, self.y + other.y)

    def __str__(self):
        return f"({self.x}, {self.y})"

p1 = Point(2, 3)
p2 = Point(4, 5)
print(p1 + p2)

# ---------------------------

# 18. isinstance() and issubclass()
print(isinstance(dog, Dog))                     # True
print(issubclass(Dog, Animal))                  # True

# ---------------------------

# 19. Class Variables and Methods Example
class Student:
    total_students = 0

    def __init__(self, name):
        self.name = name
        Student.total_students += 1             # Modify class variable

    @classmethod
    def get_total(cls):
        return cls.total_students

s1 = Student("A")
s2 = Student("B")
print(Student.get_total())