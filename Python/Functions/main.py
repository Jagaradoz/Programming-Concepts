# 1. Basic Function Definition
def greet():
    print("Hello, World!")

greet()                                       # "Hello, World!"

# -----------------------------

# 2. Function with Parameters
def add(a, b):
    return a + b

result = add(3, 5)
print(result)                                 # 8

# -----------------------------

# 3. Default Parameters
def greet(name="Guest"):
    print(f"Hello, {name}!")

greet()                                       # "Hello, Guest!"
greet("Alice")                                # "Hello, Alice"

# -----------------------------

# 4. Keyword Arguments
def introduce(name, age):
    print(f"My name is {name}, I'm {age} years old")

introduce(age=25, name="Bob")                 # Keyword arguments (order independent)

# -----------------------------

# 5. Arbitrary Arguments (*args)
def sum_all(*args):
    print(args)                               # args is a tuple
    return sum(args)

print(sum_all(1, 2, 3, 4))                    # 10

# -----------------------------

# 6. Arbitrary Keyword Arguments (**kwargs)
def user_info(**kwargs):
    print(kwargs)                             # kwargs is a dict
    for key, value in kwargs.items():
        print(f"{key}: {value}")

user_info(name="Alice", age=30, city="Paris")

# -----------------------------

# 7. Returning Multiple Values
def calculate(a, b):
    return a + b, a - b, a * b

add_result, sub_result, mul_result = calculate(10, 5)
print(add_result, sub_result, mul_result)

# -----------------------------

# 8. Function Annotations (Type Hints)
def power(base: int, exp: int) -> int:
    return base ** exp

print(power(2, 3))                            # 8

# -----------------------------

# 9. Docstrings (Function Documentation)
def square(n):
    """Return the square of a number."""
    return n * n

print(square.__doc__)                         # "Return the square of a number."

# -----------------------------

# 10. Lambda (Anonymous) Functions
square = lambda x: x ** 2
add = lambda a, b: a + b
print(square(5))                              # 25
print(add(2, 3))                              # 5

# -----------------------------

# 11. map(), filter(), reduce()
nums = [1, 2, 3, 4, 5]

# map → apply function to all elements
squared = list(map(lambda x: x**2, nums))
print(squared)                                # [1,4,9,16,25]

# filter → keep elements that satisfy condition
even = list(filter(lambda x: x % 2 == 0, nums))
print(even)                                   # [2,4]

# reduce → apply cumulative operation
from functools import reduce
product = reduce(lambda x, y: x * y, nums)
print(product)                                # 120

# -----------------------------

# 12. Nested Functions
def outer():
    print("Outer function")

    def inner():
        print("Inner function")

    inner()

outer()

# -----------------------------

# 13. Returning a Function
def multiplier(factor):
    def inner(x):
        return x * factor
    return inner

double = multiplier(2)
triple = multiplier(3)
print(double(5))                              # 10
print(triple(5))                              # 15

# -----------------------------

# 14. Closures
def make_power(n):
    def power(x):
        return x ** n
    return power

square = make_power(2)
cube = make_power(3)
print(square(4))                              # 16
print(cube(2))                                # 8

# -----------------------------

# 15. Recursion
def factorial(n):
    if n == 1:
        return 1
    return n * factorial(n - 1)

print(factorial(5))                           # 120

# -----------------------------

# 16. Global and Local Variables
x = 10

def modify():
    global x
    x = 20
    print("Inside:", x)

modify()
print("Outside:", x)                          # 20

# -----------------------------

# 17. Nonlocal Variables (Inside Nested Functions)
def outer():
    x = 5
    def inner():
        nonlocal x
        x += 1
        print("Inner:", x)
    inner()
    print("Outer:", x)

outer()

# -----------------------------

# 18. Function as Argument
def apply(func, value):
    return func(value)

print(apply(lambda x: x + 5, 10))             # 15

# -----------------------------

# 19. Function Returning Function
def greet_maker(name):
    def greet():
        return f"Hello, {name}!"
    return greet

hello_alice = greet_maker("Alice")
print(hello_alice())                          # "Hello, Alice!"

# -----------------------------

# 20. Decorators (Functions that Modify Other Functions)
def decorator(func):
    def wrapper():
        print("Before function call")
        func()
        print("After function call")
    return wrapper

@decorator
def say_hello():
    print("Hello!")

say_hello()

# -----------------------------

# 21. Function with Default Mutable Arguments (⚠️)
def append_item(item, lst=[]):
    lst.append(item)
    return lst

print(append_item(1))                         # [1]
print(append_item(2))                         # [1,2] ⚠️ same list reused

# Safe version
def append_item_safe(item, lst=None):
    if lst is None:
        lst = []
    lst.append(item)
    return lst

print(append_item_safe(3))                    # [3]

# -----------------------------

# 22. Keyword-only Arguments
def func(a, *, b, c):
    print(a, b, c)

func(1, b=2, c=3)                             # b and c must be passed by name

# -----------------------------

# 23. Positional-only Arguments (Python 3.8+)
def divide(a, b, /):
    return a / b

print(divide(10, 2))                          # 5.0
# divide(a=10, b=2) → ❌ TypeError

# -----------------------------

# 24. Combining Positional, Keyword, and Arbitrary Args
def demo(a, b=2, *args, **kwargs):
    print(a, b)
    print(args)
    print(kwargs)

demo(1, 3, 4, 5, x=10, y=20)

# -----------------------------

# 25. Using Functions in Data Structures
def inc(x): return x + 1
def dec(x): return x - 1

funcs = [inc, dec]
print(funcs )                           # 11
print(funcs )                           # 9

# -----------------------------

# 26. Anonymous Functions in Sorting
data = [(1, "b"), (3, "a"), (2, "c")]
sorted_data = sorted(data, key=lambda x: x[1])
print(sorted_data)                            # [(3,'a'), (1,'b'), (2,'c')]

# -----------------------------

# 27. Generator Functions (yield)
def countdown(n):
    while n > 0:
        yield n
        n -= 1

for i in countdown(3):
    print(i)

# -----------------------------

# 28. Recursive Generator
def fib(limit):
    a, b = 0, 1
    while a < limit:
        yield a
        a, b = b, a + b

print(list(fib(10)))                          # [0,1,1,2,3,5,8]

# -----------------------------

# 29. Using `return` vs `yield`
# return → exits function, yields single value
# yield → produces sequence of values (lazy evaluation)

# -----------------------------

# 30. Anonymous Inline Usage
print((lambda x, y: x * y)(3, 4))             # 12

# -----------------------------

# 31. Function Aliasing
def greet(): print("Hi")
say_hi = greet
say_hi()                                      # "Hi"

# -----------------------------

# 32. Introspection
def sample_func(x, y): return x + y
print(sample_func.__name__)                   # 'sample_func'
print(sample_func.__code__.co_varnames)       # ('x', 'y')

# -----------------------------

# 33. Partial Functions (from functools)
from functools import partial
def power(base, exp):
    return base ** exp

square = partial(power, exp=2)
print(square(5))                              # 25

# -----------------------------

# 34. Function Scope Summary
# LEGB → Local, Enclosing, Global, Built-in
x = "global"

def outer():
    x = "enclosing"
    def inner():
        x = "local"
        print(x)
    inner()

outer()                                       # "local"

# -----------------------------

# 35. Recursive Example (Fibonacci)
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

print(fibonacci(6))                           # 8

# -----------------------------

# 36. Documentation Strings Access
def add(a, b):
    """Add two numbers and return result."""
    return a + b

help(add)                                     # Displays docstring

# -----------------------------

# 37. Function Decorator with Arguments
def repeat(n):
    def decorator(func):
        def wrapper(*args, **kwargs):
            for _ in range(n):
                func(*args, **kwargs)
        return wrapper
    return decorator

@repeat(3)
def say_hi():
    print("Hi!")

say_hi()

# -----------------------------

# 38. Higher-order Function
def operate(func, a, b):
    return func(a, b)

print(operate(lambda x, y: x + y, 2, 3))      # 5
print(operate(lambda x, y: x * y, 2, 3))      # 6

# -----------------------------

# 39. Built-in Functional Tools
from operator import add, mul
from functools import reduce
nums = [1, 2, 3, 4]
print(reduce(add, nums))                      # 10
print(reduce(mul, nums))                      # 24