# 1. Basic Function Decorator
def my_decorator(func):
    def wrapper():
        print("Before function call")            # Code before
        func()
        print("After function call")             # Code after
    return wrapper

@my_decorator
def say_hello():
    print("Hello!")

say_hello()

# ---------------------------

# 2. Decorator Without @ Syntax (Manual Way)
def greet():
    print("Greetings!")

decorated_greet = my_decorator(greet)            # Apply manually
decorated_greet()

# ---------------------------

# 3. Decorator with Arguments
def repeat(n):
    def decorator(func):
        def wrapper(*args, **kwargs):
            for _ in range(n):
                func(*args, **kwargs)
        return wrapper
    return decorator

@repeat(3)
def laugh():
    print("Haha!")

laugh()                                          # Prints 3 times

# ---------------------------

# 4. Decorator for Functions with Parameters
def debug(func):
    def wrapper(*args, **kwargs):
        print(f"Calling {func.__name__} with {args}, {kwargs}")
        result = func(*args, **kwargs)
        print(f"{func.__name__} returned {result}")
        return result
    return wrapper

@debug
def add(a, b):
    return a + b

add(5, 7)

# ---------------------------

# 5. Using functools.wraps
from functools import wraps

def preserve_metadata(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        """Wrapper function"""
        print("Running decorated function...")
        return func(*args, **kwargs)
    return wrapper

@preserve_metadata
def original():
    """Original function"""
    print("Inside original function")

print(original.__name__)                         # Keeps original name
print(original.__doc__)                          # Keeps original docstring

# ---------------------------

# 6. Multiple Decorators (Stacked)
def decorator_one(func):
    def wrapper():
        print("Decorator One")
        func()
    return wrapper

def decorator_two(func):
    def wrapper():
        print("Decorator Two")
        func()
    return wrapper

@decorator_one
@decorator_two
def say_hi():
    print("Hi!")

say_hi()                                         # Executes bottom-up

# ---------------------------

# 7. Decorator with Return Value
def square_result(func):
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        return result ** 2                       # Modify return value
    return wrapper

@square_result
def get_number():
    return 5

print(get_number())                              # 25

# ---------------------------

# 8. Class-Based Decorator
class Counter:
    def __init__(self, func):
        self.func = func
        self.count = 0

    def __call__(self, *args, **kwargs):
        self.count += 1
        print(f"Call #{self.count}")
        return self.func(*args, **kwargs)

@Counter
def greet():
    print("Hello there!")

greet()
greet()
print(greet.count)

# ---------------------------

# 9. Decorating Methods in Classes
def log_method(func):
    def wrapper(self, *args, **kwargs):
        print(f"Method {func.__name__} called")
        return func(self, *args, **kwargs)
    return wrapper

class Person:
    def __init__(self, name):
        self.name = name

    @log_method
    def say_name(self):
        print(f"My name is {self.name}")

p = Person("Alice")
p.say_name()

# ---------------------------

# 10. Decorator Factory (Custom Behavior)
def tag_html(tag):
    def decorator(func):
        def wrapper(*args, **kwargs):
            return f"<{tag}>{func(*args, **kwargs)}</{tag}>"
        return wrapper
    return decorator

@tag_html("b")
def text():
    return "Bold Text"

print(text())                                   # <b>Bold Text</b>

# ---------------------------

# 11. Chaining Decorators with Arguments
@tag_html("i")
@tag_html("u")
def message():
    return "Decorators are fun!"

print(message())                                # <i><u>Decorators are fun!</u></i>

# ---------------------------

# 12. Decorators for Validation
def require_positive(func):
    def wrapper(x):
        if x <= 0:
            print("Error: value must be positive")
            return None
        return func(x)
    return wrapper

@require_positive
def square(x):
    return x * x

print(square(5))
print(square(-2))                               # Invalid case

# ---------------------------

# 13. Memoization Decorator (Caching Results)
def memoize(func):
    cache = {}
    def wrapper(*args):
        if args in cache:
            return cache[args]
        cache[args] = func(*args)
        return cache[args]
    return wrapper

@memoize
def fib(n):
    if n <= 1:
        return n
    return fib(n-1) + fib(n-2)

print(fib(10))                                  # Efficient recursive Fibonacci

# ---------------------------

# 14. Timing Decorator
import time

def timer(func):
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        end = time.time()
        print(f"Execution time: {end - start:.5f}s")
        return result
    return wrapper

@timer
def slow_function():
    time.sleep(1)
    return "Done"

print(slow_function())

# ---------------------------

# 15. Decorator on Static and Class Methods
def announce(func):
    def wrapper(*args, **kwargs):
        print(f"Running {func.__name__}()")
        return func(*args, **kwargs)
    return wrapper

class Demo:
    @announce
    @staticmethod
    def static_func():
        print("Inside static method")

    @announce
    @classmethod
    def class_func(cls):
        print("Inside class method")

Demo.static_func()
Demo.class_func()

# ---------------------------

# 16. Nested Decorators Example
def outer_decorator(func):
    def wrapper1():
        print("Outer decorator")
        func()
    return wrapper1

def inner_decorator(func):
    def wrapper2():
        print("Inner decorator")
        func()
    return wrapper2

@outer_decorator
@inner_decorator
def hello():
    print("Hello World")

hello()                                         # Executes inner first, then outer

# ---------------------------

# 17. Disabling a Decorator (for debugging)
def noop(func):
    return func                                 # Does nothing

@noop
def test():
    print("No decoration applied")

test()

# ---------------------------

# 18. Useful Built-in Decorators
# @property           → Turns method into attribute
# @classmethod        → Defines method at class level
# @staticmethod       → Defines method not bound to class or instance
# @functools.lru_cache → Memoization cache decorator

# ---------------------------

# 19. @property Example
class Temperature:
    def __init__(self, celsius):
        self._celsius = celsius

    @property
    def fahrenheit(self):
        return (self._celsius * 9/5) + 32       # Access like attribute

t = Temperature(25)
print(t.fahrenheit)                             # 77.0