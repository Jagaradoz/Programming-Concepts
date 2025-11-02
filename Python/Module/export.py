# 1. Exporting Module

# Functions
def greet(name):
    return f"Hello, {name}!"

def add(a, b):
    return a + b

# Variables / Constants
PI = 3.14159
E  = 2.71828

# Classes
class Person:
    def __init__(self, name):
        self.name = name
    def introduce(self):
        return f"My name is {self.name}"

# Code that runs only when the module is executed directly (private)
if __name__ == "__main__":
    print("This runs only when executing my_module.py directly")
    print(greet("Alice"))
